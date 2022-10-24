import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';


import '../../controllers/news_from_the_stable_controller.dart';
import '../../controllers/popular_news.dart';
import '../../model/news_from_the_stable_model.dart';
import '../../routes/routerhelper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/bigtext.dart';
import '../../widgets/expandable_text.dart';
import '../../widgets/icons_and_text.dart';
import '../../widgets/smalltext.dart';
import 'check_box.dart';

class ShowOnly extends StatefulWidget {
  const ShowOnly({Key? key,}) : super(key: key);


  @override
  State<ShowOnly> createState() => _ShowOnlyState();
}

class _ShowOnlyState extends State<ShowOnly> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;
  bool _checkbox = false;

  bool rememberMe = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {setState(() {
      _currPageValue = pageController.page!;

    });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ////////////////////////////////////NEWS FROM THE STABLE
        Container(
          margin: EdgeInsets.only(left: Dimensions.width15,bottom:  Dimensions.width10,),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /** Checkbox Widget **/
              Column(
                children: [
                  ShowOnlyUnreadCheckBox(),
                ],
              ),
            ],
          ),
        ),
        ///////////////////////////////////LIST OF NEWS
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isLoaded?ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: recommendedProduct.recommendedProductList.length,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    // Get.toNamed(RouteHelper.getNewsFromStablePage());
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20, bottom: Dimensions.height10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            //text container
                            Expanded(child: Container(
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.width10),
                                color: Colors.white,
                              ),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //BigText(text: recommendedProduct.recommendedProductList[index].name!),
                                  SizedBox(height: Dimensions.height10,),
                                  Container(
                                    margin: EdgeInsets.only(left: Dimensions.width10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SmallText(text: recommendedProduct.recommendedProductList[index].createdAt!,color: AppColors.titleColor,size: Dimensions.font16,),
                                        SmallText(text: "New",color: AppColors.redColor,size: Dimensions.font16,),
                                        SizedBox(width: Dimensions.width10),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.height10,),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        ExpandableText(
                                            text: recommendedProduct.recommendedProductList[index].description!
                                          // text: 'Lorem ipsum dolor sit amet,t clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquy sit amet.',
                                        ),
                                      ],
                                    ),
                                  ), // This trailing comma makes auto-formatting nicer for build methods.
                                ],
                              ),
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }):CircularProgressIndicator(
            color: AppColors.maincolor,
          );
        })
      ],
    );
  }

}

