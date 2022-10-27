
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:okumurastableforowner/utils/dimensions.dart';

import '../../routes/routerhelper.dart';
import '../../utils/colors.dart';
import '../../widgets/bigtext.dart';
import '../../widgets/icons_and_text.dart';
import '../../widgets/smalltext.dart';
import '../account/account_profile_top_icon.dart';
import 'news_from_stable_list.dart';




class NewsFromStablePage extends StatefulWidget {
  const NewsFromStablePage({Key? key}) : super(key: key);

  @override
  State<NewsFromStablePage> createState() => _NewsFromStablePageState();
}


class _NewsFromStablePageState extends State<NewsFromStablePage> {
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
            )),
        backgroundColor: AppColors.maincolor,
      ),
      // drawer: const NavigationDrawer(),
      body: Column(
        children: [
          //header
          Padding(
            padding: EdgeInsets.only(top: Dimensions.height10,
                left: Dimensions.width10,right: Dimensions.width10, bottom: Dimensions.height10),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: AppColors.kLightGrey,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0))),
                    width: Dimensions.screenWidth,
                    padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                   /* child:
                    DropdownButtonExample()*/
                ),
              ],
            ),
          ),
          //body
          Expanded(child: SingleChildScrollView(
            child:  NewsFromStableList(),
          ))
        ],
      ),
        bottomNavigationBar: Container(
            padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            height: Dimensions.height30 * 2,
            width: double.maxFinite,
            color: AppColors.bottomNavColor,
            child:  Row(
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
