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
import 'home_two.dart';

class NewsFromStableList extends StatefulWidget {
  const NewsFromStableList({Key? key}) : super(key: key);

  @override
  State<NewsFromStableList> createState() => _NewsFromStableListState();
}

class _NewsFromStableListState extends State<NewsFromStableList> {
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
        /*SizedBox(height: Dimensions.height20,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30,bottom:  Dimensions.width20,),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "News from the stable asdasd"),
            ],
          ),
        ),*/
        ///////////////////////////////////LIST OF NEWS
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isLoaded?ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: recommendedProduct.recommendedProductList.length,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getNewsFromStableCarouselPage());
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
                                      SizedBox(width: Dimensions.width10,),
                                      Container(
                                          padding: EdgeInsets.all(Dimensions.width10/4.63),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(Dimensions.width10),
                                            color: AppColors.kLightGrey,
                                          ),
                                          child: SmallText(text: recommendedProduct.recommendedProductList[index].status!,size: Dimensions.font16,)),
                                      SmallText(text: recommendedProduct.recommendedProductList[index].createdAt!,color: AppColors.titleColor,size: Dimensions.font16,),
                                      SmallText(text: "New",color: AppColors.redColor,size: Dimensions.font16,),
                                      SizedBox(width: Dimensions.width10,),
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
  Widget _buildPageItem(int index, ProductModel popularProduct){
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currPageValue.floor()){//current slide
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index == _currPageValue.floor()+1) {//+1 next slide
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index == _currPageValue.floor()-1) {//-1 prev slide
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }
    // const Card(
    //   child: Padding(
    //     padding: EdgeInsets.all(16.0),
    //     child: Text('Hello World!'),
    //   ),
    // );
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){

              // Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Container(
              height: Dimensions.pageViewContainer, margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: index.isEven?Color(0xFF69c5df):Color(0xFF9294df),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      AppConstants.BASE_URL+AppConstants.UPLOAD_URL+popularProduct.img!
                    //"assets/image/jew.jpg"
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(

              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30,right: Dimensions.width30 , bottom: Dimensions.height30),

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 15.5,
                        spreadRadius: 1.0,
                        blurStyle: BlurStyle.normal)]
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15, left: 15, right: 15),
                child: AppColumn(text:popularProduct.name!),//! not empty
              ),
            ),
          ),
        ],
      ),
    );
  }
}


