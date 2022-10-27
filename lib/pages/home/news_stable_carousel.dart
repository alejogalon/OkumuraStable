import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:okumurastableforowner/utils/dimensions.dart';

import '../../controllers/news_from_the_stable_controller.dart';
import '../../routes/routerhelper.dart';
import '../../utils/colors.dart';
import '../../widgets/icons_and_text.dart';
import '../../widgets/smalltext.dart';
import '../account/account_profile_top_icon.dart';




class NewsFromStableCarouselPage extends StatefulWidget {
  const NewsFromStableCarouselPage({Key? key}) : super(key: key);

  @override
  State<NewsFromStableCarouselPage> createState() => _NewsFromStableCarouselPageState();
}


class _NewsFromStableCarouselPageState extends State<NewsFromStableCarouselPage> {
  CarouselController carouselController = CarouselController();
  PageController _controller = PageController(viewportFraction: 1);
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

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
                SmallText(text:"News from the stable",
                  color: AppColors.whiteColor,
                  size: Dimensions.font20,),
                AccountProfileIcon(icon: FontAwesome5.user_circle,
                  iconSize: Dimensions.height30,),
              ],
            )
        ),
        backgroundColor: AppColors.maincolor,
      ),
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
            return Flexible(
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.width10, left: Dimensions.width20,
                right: Dimensions.width20,),
                child: PageView.builder(
                  controller: _controller,
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SingleChildScrollView(
                      child: SmallText(
                          size: Dimensions.font20,
                          color: AppColors.mainBlackColor,
                          text: recommendedProduct.recommendedProductList[index].description!+" asdasdas asd asd asda da das dasd asd asdaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqwedaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqwedaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqwedaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqwedaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqwedaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqwedaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqwedaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqwedaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqwedaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqwedaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqwedaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqwedaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqwedaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqweqwe qwe asd asd asda da das dasd asd asdaqeqweqwe qwe asdasd asd asd asd asd asdad ad sdasdasd asd qeqweqwwrerwer"+recommendedProduct.recommendedProductList[index].description!),
                        );
                      }
                    ),
              ),
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
                          _controller.previousPage(
                              duration: _kDuration, curve: _kCurve);
                        },
                        icon: Icon(Icons.chevron_left),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          // Use the controller to change the current page
                          _controller.nextPage(duration: _kDuration, curve: _kCurve);
                        },
                        icon: Icon(Icons.chevron_right),
                      ),
                    ),
                  ],
                )
          ],
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
                GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getHorseStablePage());
                    },
                    child: IconAndTextWidget(icon: FontAwesome5.horse_head, text: "Aisha", iconColor: AppColors.buttonBackgroundColor)),
                IconAndTextWidget(icon: Icons.newspaper_rounded, text: "News", iconColor: AppColors.signColor),
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
}
