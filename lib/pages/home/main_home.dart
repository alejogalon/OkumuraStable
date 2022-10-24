import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../routes/routerhelper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/bigtext.dart';
import '../../widgets/dropdown_horses.dart';
import '../../widgets/icons_and_text.dart';
import '../../widgets/smalltext.dart';
import 'home.dart';
import 'home_two.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("current height is "+ MediaQuery.of(context).size.height.toString());
    print("current width is "+ MediaQuery.of(context).size.width.toString());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("OKUMURA STABLE\nFor Owners"),
                Icon(FontAwesome5.user_circle,
                )
              ],
            )),//const Text("OKUMURA STABLE\nFor Owners"),
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
                  padding: EdgeInsets.all(Dimensions.height10),
                  alignment: Alignment.centerLeft,
                  child: BigText(text: 'Choose a horse'),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: AppColors.kLightGrey,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0))),
                    width: Dimensions.screenWidth,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child:
                    DropdownButtonExample()
                ),
              ],
            ),
          ),
          //body
          Expanded(child: SingleChildScrollView(
            child:  HomeStable(),
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
                IconAndTextWidget(icon: Icons.home_filled, text: "Home", iconColor: AppColors.maincolor),
                GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getHorseStablePage());
                    },
                    child: IconAndTextWidget(icon: Icons.person, text: "Aisha", iconColor: AppColors.buttonBackgroundColor)),
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
}
