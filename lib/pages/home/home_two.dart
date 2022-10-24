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
import 'news_from_stable.dart';
import 'news_from_stable_list.dart';

class HomeStable extends StatefulWidget {
  const HomeStable({Key? key}) : super(key: key);

  @override
  State<HomeStable> createState() => _HomeStableState();
}

class _HomeStableState extends State<HomeStable> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;
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
        SizedBox(height: Dimensions.height20,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30,bottom:  Dimensions.width20,),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "News from the stable"),
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
                     Get.toNamed(RouteHelper.getNewsFromStablePage());
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20, bottom: Dimensions.height10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            //image section
                           /* Container(
                              width: Dimensions.listViewImgSize,
                              height: Dimensions.listViewImgSize,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white38,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        AppConstants.BASE_URL+AppConstants.UPLOAD_URL+recommendedProduct.recommendedProductList[index].img!
                                    )
                                ),
                              ),
                            ),*/
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
                                  Row(

                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: Dimensions.width10),
                                      Container(
                                        padding: EdgeInsets.all(Dimensions.width10/4.63),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(Dimensions.width10),
                                            color: AppColors.kLightGrey,
                                          ),
                                          child: SmallText(text: recommendedProduct.recommendedProductList[index].status!,size: Dimensions.font16,)),
                                      SmallText(text: recommendedProduct.recommendedProductList[index].createdAt!,color: AppColors.titleColor,size: Dimensions.font16,),
                                      SmallText(text: "New",color: AppColors.redColor,size: Dimensions.font16,),
                                      SizedBox(width: Dimensions.width10),
                                    ],
                                  ),
                                  SizedBox(height: Dimensions.height10,),
                                  /*  ReadMoreText(
                                      'The content of the notification is displayed. The content of the notification isdisplayed. The content of the notification is displayed. The content of thenotification is displayed. The content of the notification is displayed. Thecontent of the notification is displayed. The content of the notification isdisplayed. Notification content is displayed. The content of the notification isdisplayed. Notification content is displayed. The content of the notification isdisplayed. The content of the notification will be displayed. The content of thenotification is displayed. The content of the notification is displayed. Thecontent of the notification is displayed. The content of the notification isdisplayed. The content of the notification is displayed. The content of thenotification is displayed. The content of the notification is displayed. Thecontent of the notification is displayed. Notification content is displayed. Thecontent of the notification is displayed. Notification content is displayed. Thecontenttific layed. The content of the notification is displayed. The content of thenotification is displayed. The content of the notification is displayed. Thecontent of the notification is displayed. The content of the notification isdisplayed. The content of the notification is displayed. The content of thenotification is displayed. The content of the notification is displayed. Notificat',
                                      trimLines: 3,
                                      colorClickableText: Colors.pink,
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText: 'Show more',
                                      trimExpandedText: 'Show less',
                                      moreStyle: TextStyle(fontSize: Dimensions.font16, fontWeight: FontWeight.bold),
                                    ),*/
                                  // SmallText(text: "With chinese characteristics"),
                             /* ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: recommendedProduct.recommendedProductList.length,
                                itemBuilder: (context,index){
                              *//*  Container(
                                  child: ExpandableText(text: "The content of the notification is displayed. The content of the notification isdisplayed. The content of the notification is displayed. The content of thenotification is displayed. The content of the notification is displayed. Thecontent of the notification is displayed. The content of the notification isdisplayed. Notification content is displayed. The content of the notification isdisplayed. Notification content is displayed. The content of the notification isdisplayed. The content of the notification will be displayed. The content of thenotification is displayed. The content of the notification is displayed. Thecontent of the notification is displayed. The content of the notification isdisplayed. The content of the notification is displayed. The content of thenotification is displayed. The content of the notification is displayed. Thecontent of the notification is displayed. Notification content is displayed. Thecontent of the notification is displayed. Notification content is displayed. Thecontenttific layed. The content of the notification is displayed. The content of thenotification is displayed. The content of the notification is displayed. Thecontent of the notification is displayed. The content of the notification isdisplayed. The content of the notification is displayed. The content of thenotification is displayed. The content of the notification is displayed. Notificat"),
                                  margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                                )*//*
                              },),*/

                                  /*Container(
                                    child: ExpandableText(text: "The content of the notification is displayed. The content of the notification isdisplayed. The content of the notification is displayed. The content of thenotification is displayed. The content of the notification is displayed. Thecontent of the notification is displayed. The content of the notification isdisplayed. Notification content is displayed. The content of the notification isdisplayed. Notification content is displayed. The content of the notification isdisplayed. The content of the notification will be displayed. The content of thenotification is displayed. The content of the notification is displayed. Thecontent of the notification is displayed. The content of the notification isdisplayed. The content of the notification is displayed. The content of thenotification is displayed. The content of the notification is displayed. Thecontent of the notification is displayed. Notification content is displayed. Thecontent of the notification is displayed. Notification content is displayed. Thecontenttific layed. The content of the notification is displayed. The content of thenotification is displayed. The content of the notification is displayed. Thecontent of the notification is displayed. The content of the notification isdisplayed. The content of the notification is displayed. The content of thenotification is displayed. The content of the notification is displayed. Notificat"),
                                    margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                                  )
*/
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
                            //text container widget
                            //_buildPageItem2(),
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



void calendarTapped(BuildContext context) {
  /*showModalBottomSheet(
      context: context,
      builder: (context) => RecommendedFoodDetail(pageId: 1,),


  );*/
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 1,
          child: NewsFromStableList(),//ShowDetailsEventDate(pageId: 1,),
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