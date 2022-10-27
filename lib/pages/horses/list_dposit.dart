import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okumurastableforowner/pages/horses/recent_status_details_carousel.dart';
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

class ListDeposit extends StatefulWidget {
  const ListDeposit({Key? key,}) : super(key: key);


  @override
  State<ListDeposit> createState() => _ListDepositState();
}

class _ListDepositState extends State<ListDeposit> {
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
        ////////////////////////////////////HORSE IMAGE PHOTO, STATUS, MOTHER, FATHER
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isLoaded?ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 1,//recommendedProduct.recommendedProductList.length,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    // Get.toNamed(RouteHelper.getRecommendedFood(index));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20, bottom: Dimensions.height10),
                    child: Row(
                      children: [
                        //image section
                        Container(
                          width: Dimensions.listViewImgSize,
                          height: Dimensions.listViewImgSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: ExactAssetImage(
                                    //"assets/image/jew.jpg"
                                  "assets"+AppConstants.UPLOAD_URL+recommendedProduct.recommendedProductList[index].img!
                                )
                            ),
                          ),
                        ),
                        //text container
                        Expanded(child: Container(
                          // height: Dimensions.listViewTextContSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            ),
                            // color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding:EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(Dimensions.radius20),
                                            topRight: Radius.circular(Dimensions.radius20),
                                            bottomLeft: Radius.circular(Dimensions.radius20),
                                            bottomRight: Radius.circular(Dimensions.radius20),
                                          ),
                                          color: Colors.green,
                                        ),
                                        child: SmallText(text: 'In stable')
                                    ),
                                    SmallText(text: 'Female 4'),
                                    SmallText(text: 'Black'),
                                  ],
                                ),
                                SizedBox(height: Dimensions.height10,),
                                SmallText(text: "Father: Sinister Minister"),
                                SmallText(text: "Mother: Win Platinum"),
                                SmallText(text: "Mother: Zennoei Cid"),
                              ],
                            ),
                          ),
                        ))
                        //text container widget
                        //_buildPageItem2(),
                      ],
                    ),
                  ),
                );
              }):CircularProgressIndicator(
            color: AppColors.maincolor,
          );
        }),
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
                    //ShowRecentDetailsTapped(context);
                    Get.toNamed(RouteHelper.getHorseStableListPage());
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20, bottom: Dimensions.height10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: Container(
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
                                    padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ExpandableText(
                                          size: Dimensions.font16,
                                            text: recommendedProduct.recommendedProductList[index].description!
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



void ShowRecentDetailsTapped(BuildContext context) {
  /*showModalBottomSheet(
      context: context,
      builder: (context) => RecommendedFoodDetail(pageId: 1,),


  );*/
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.969,
          child: RecentStatusCarouselPage(),//ShowDetailsEventDate(pageId: 1,),
        );
      });

/*
  Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return RecommendedFoodDetail(pageId: 1,);
      },
      fullscreenDialog: true
  ));*/
}
