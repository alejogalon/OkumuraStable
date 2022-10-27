
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
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
import '../account/account_profile_top_icon.dart';




class RecentStatusCarouselPage extends StatefulWidget {
  const RecentStatusCarouselPage({Key? key}) : super(key: key);

  @override
  State<RecentStatusCarouselPage> createState() => _RecentStatusCarouselPageState();
}


class _RecentStatusCarouselPageState extends State<RecentStatusCarouselPage> {
  CarouselController carouselController = CarouselController();
  PageController pageController = PageController(viewportFraction: 0.85);
  PageController pageController2 = PageController(viewportFraction: 1);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  final featuredImages = [
    'assets/image/People_Circle8.png',
    'assets/image/People_Circle5.png',
    'assets/image/People_Circle13.png'
  ];

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
    print("current height is "+ MediaQuery.of(context).size.height.toString());
    print("current width is "+ MediaQuery.of(context).size.width.toString());
    return Scaffold(
      appBar: AppBar(
        title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(text:"Recent status of beloved horse",
                  color: AppColors.whiteColor,
                  size: Dimensions.font16,),
                AccountProfileIcon(icon: FontAwesome5.user_circle,
                  iconSize: Dimensions.height30,),
              ],
            )),
        backgroundColor: AppColors.maincolor,
      ),
      body: Container(
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [Column(
            children: [
              ////////////////////////////////////SLIDER IMAGE SECTION
              GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
                print("the length "+recommendedProduct.recommendedProductList.length.toString());
                return recommendedProduct.isLoaded?Container(
                  //color: Colors.red,
                  height: Dimensions.pageView /2,

                  child: PageView.builder(
                      controller: pageController,
                      itemCount: recommendedProduct.recommendedProductList.length,
                      itemBuilder: (context, position){
                        return _buildPageItem(position, recommendedProduct.recommendedProductList[position]);// the widget that returns the index position
                      }),

                ):CircularProgressIndicator(
                  color: AppColors.maincolor,
                );
              }),
              ////////////////////////////////////DOTS
              GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
                return DotsIndicator(
                  dotsCount: recommendedProduct.recommendedProductList.isEmpty?1:recommendedProduct.recommendedProductList.length,
                  position: _currPageValue,
                  decorator: DotsDecorator(
                    activeColor: AppColors.maincolor,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radius30)),
                  ),
                );
              }),
              SizedBox(height: Dimensions.height20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ////////////////////////////////////SLIDER SECTION
                  GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
                    return recommendedProduct.isLoaded?Container(
                      //color: Colors.red,
                      padding: EdgeInsets.all(Dimensions.width15),
                      height: Dimensions.pageView/1.2,

                      child: PageView.builder(
                          controller: pageController2,
                          itemCount: recommendedProduct.recommendedProductList.length,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {
                            // Use the controller to change the current page
                            // carouselController.previousPage();
                          },
                          icon: Icon(Icons.chevron_left),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            // Use the controller to change the current page
                            // carouselController.nextPage();
                          },
                          icon: Icon(Icons.chevron_right),
                        ),
                      ),
                    ],
                  ),
                ]
            ),
            ],
          ),]
        ),
      ),
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
                IconAndTextWidget(icon: FontAwesome5.horse_head, text: "Aisha", iconColor: AppColors.signColor),
                GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getNewsFromStablePage());
                    },
                    child: IconAndTextWidget(icon: Icons.newspaper_rounded, text: "News", iconColor: AppColors.buttonBackgroundColor)),
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
      child: Container(
        height: Dimensions.height20,
        margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20),
          color: index.isEven?Color(0xFF69c5df):Color(0xFF9294df),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: ExactAssetImage(
               // "https://via.placeholder.com/600/92c952"
              "assets"+AppConstants.UPLOAD_URL+popularProduct.img!
              //"assets/image/jew.jpg"
            ),
          ),
        ),
      ),
    );
  }
}
