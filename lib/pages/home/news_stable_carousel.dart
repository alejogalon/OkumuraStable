
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:okumurastableforowner/utils/dimensions.dart';

import '../../controllers/news_from_the_stable_controller.dart';
import '../../controllers/popular_news.dart';
import '../../model/news_from_the_stable_model.dart';
import '../../routes/routerhelper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../widgets/app_column.dart';
import '../../widgets/bigtext.dart';
import '../../widgets/expandable_text.dart';
import '../../widgets/icons_and_text.dart';
import '../../widgets/smalltext.dart';
import 'home_two.dart';
import 'news_from_stable_list.dart';




class NewsFromStableCarouselPage extends StatefulWidget {
  const NewsFromStableCarouselPage({Key? key}) : super(key: key);

  @override
  State<NewsFromStableCarouselPage> createState() => _NewsFromStableCarouselPageState();
}


class _NewsFromStableCarouselPageState extends State<NewsFromStableCarouselPage> {
  CarouselController carouselController = CarouselController();
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  final featuredImages = [
    'assets/image/People_Circle8.png',
    'assets/image/People_Circle5.png',
    'assets/image/People_Circle13.png'
  ];

  @override
  Widget build(BuildContext context) {
    print("current height is "+ MediaQuery.of(context).size.height.toString());
    print("current width is "+ MediaQuery.of(context).size.width.toString());
    return Scaffold(
      appBar: AppBar(
        title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("News from the stable"),
                Icon(FontAwesome5.user_circle,
                )
              ],
            )),
        backgroundColor: AppColors.maincolor,
      ),
      body: ListView(
          children: [
            CarouselSlider(
              carouselController: carouselController, // Give the controller
              options: CarouselOptions(
                height: Dimensions.screenHeight/2,
                aspectRatio: 16/9,
                viewportFraction: 1,
                initialPage: 0,
                autoPlay: false,
              ),
              items: featuredImages.map((featuredImage) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ////////////////////////////////////SLIDER SECTION
                    GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
                      return recommendedProduct.isLoaded?Container(
                        //color: Colors.red,
                        height: 220,

                        child: PageView.builder(
                            controller: pageController,
                            itemCount: 1,
                            itemBuilder: (context, position){
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SmallText(text: recommendedProduct.recommendedProductList[position].createdAt!,
                                    size: Dimensions.font16,),
                                  SizedBox(height: Dimensions.height30,),
                                  SmallText(text: recommendedProduct.recommendedProductList[position].description!,
                                    size: Dimensions.font16,color: AppColors.mainBlackColor,)
                                ],
                              );//_buildPageItem(position, popularProducts.popularProductList[position]);// the widget that returns the index position
                            }),

                      ):CircularProgressIndicator(
                        color: AppColors.maincolor,
                      );
                    }),
                    // child: Image.asset(featuredImage),
                  ]
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      // Use the controller to change the current page
                      carouselController.previousPage();
                    },
                    icon: Icon(Icons.chevron_left),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      // Use the controller to change the current page
                      carouselController.nextPage();
                    },
                    icon: Icon(Icons.chevron_right),
                  ),
                ),
              ],
            ),

            /*ElevatedButton(
              onPressed: () => buttonCarouselController.nextPage(
                  duration: Duration(milliseconds: 300), curve: Curves.linear),
              child: Text('→'),
            )*/
          ]),
        bottomNavigationBar: Container(
            padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            height: Dimensions.height30 * 2,
            width: double.maxFinite,
            color: AppColors.bottomNavColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getToHomePage());
                    },
                    child: IconAndTextWidget(icon: Icons.home_filled, text: "Home", iconColor: AppColors.buttonBackgroundColor)),
                GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getHorseStablePage());
                    },
                    child: IconAndTextWidget(icon: Icons.person, text: "Aisha", iconColor: AppColors.buttonBackgroundColor)),
                IconAndTextWidget(icon: Icons.newspaper_rounded, text: "News", iconColor: AppColors.maincolor),
                GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getMessagePage());
                    },
                    child: IconAndTextWidget(icon: Icons.message_rounded, text: "Message", iconColor: AppColors.buttonBackgroundColor)),
                GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getLinkPage());
                    },
                    child: IconAndTextWidget(icon: Icons.link, text: "LINK", iconColor: AppColors.buttonBackgroundColor))
              ],
            )
        )
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
