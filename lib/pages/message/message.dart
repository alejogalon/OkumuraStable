
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




class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}


class _MessagePageState extends State<MessagePage> {
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
                const Text("Message"),
                Icon(FontAwesome5.user_circle,
                )
              ],
            )),
        backgroundColor: AppColors.maincolor,
      ),
      body: Container(
        // margin: const EdgeInsets.all(10.0),
        child: ClipRect(
          /** Banner Widget **/
          child: Container(
            height: Dimensions.height45 * MediaQuery.of(context).padding.top,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Image(image: ExactAssetImage('assets/image/message.PNG'),),
                SizedBox(height: Dimensions.height45),
                Text(
                  'Please add friends from the QR code',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold), //TextStyle
                ),
                SizedBox(
                  height: 5,
                ),
                Image(image: ExactAssetImage('assets/image/sampleqrcode.PNG'),width: Dimensions.screenWidth/2),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'The LINE app will launch.',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold), //TextStyle
                ), //Text
              ], //<Widget>[]
            ), //Padding
          ), //Banner
        ), //ClipRect
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
                    child: IconAndTextWidget(icon: Icons.person, text: "Aisha", iconColor: AppColors.buttonBackgroundColor)),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getNewsFromStablePage());
                  },
                  child: IconAndTextWidget(icon: Icons.newspaper_rounded, text: "News", iconColor: AppColors.buttonBackgroundColor)),
                IconAndTextWidget(icon: Icons.message_rounded, text: "Message", iconColor: AppColors.maincolor),
                GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getLinkPage());
                    },
                    child: IconAndTextWidget(icon: Icons.link, text: "LINK", iconColor: AppColors.buttonBackgroundColor))
              ],
            )
        )//Center
    ); //Scaffold
  }
}
