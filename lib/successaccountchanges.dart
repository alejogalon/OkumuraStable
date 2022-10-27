import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:okumurastableforowner/pages/account/account_profile_top_icon.dart';
import 'package:okumurastableforowner/routes/routerhelper.dart';
import 'package:okumurastableforowner/utils/colors.dart';
import 'package:okumurastableforowner/utils/dimensions.dart';
import 'package:okumurastableforowner/widgets/bigtext.dart';
import 'package:okumurastableforowner/widgets/icons_and_text.dart';
import 'package:okumurastableforowner/widgets/smalltext.dart';

// void main() => runApp(const Login());

class SuccessAccountChangesPage extends StatelessWidget {
  const SuccessAccountChangesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(text:"Account Settings",
                  color: AppColors.whiteColor,
                  size: Dimensions.font20,),
                AccountProfileIcon(icon: FontAwesome5.user_circle,
                  iconSize: Dimensions.height30,),
              ],
            )),//const Text("OKUMURA STABLE\nFor Owners"),
        backgroundColor: AppColors.maincolor,
      ),
      body: Container(
          margin: EdgeInsets.only(top: Dimensions.height45),
          child: const SuccessAccountSettingsWidget()),
    );
  }
}

class SuccessAccountSettingsWidget extends StatefulWidget {
  const SuccessAccountSettingsWidget({Key? key}) : super(key: key);

  @override
  State<SuccessAccountSettingsWidget> createState() => _SuccessAccountSettingsWidgetState();
}
// enum SingingCharacter { rememberme }
class _SuccessAccountSettingsWidgetState extends State<SuccessAccountSettingsWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // SingingCharacter? _character = SingingCharacter.rememberme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(top: Dimensions.height45,
              left: Dimensions.width20,right: Dimensions.width20),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(Dimensions.height20),
                decoration: BoxDecoration(
                    color: AppColors.kLightGrey,
                    borderRadius:
                    BorderRadius.all(Radius.circular(20.0))),
                child:
                Column(
                  children: [
                    Container(
                      height: Dimensions.height45 * 2,
                      padding: EdgeInsets.all(Dimensions.width30),
                      decoration: BoxDecoration(
                        color: AppColors.maincolor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(FontAwesome5.check),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SmallText(text: "Saved changes!",
                        size: Dimensions.font20,
                        color: AppColors.mainBlackColor,),
                    ),
                  ],
                ),
              ),
            ],
          )),
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
   /* return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 100),
        child: const Card(child: Text('Hello World!')),
      ),
    );*/
  }
}