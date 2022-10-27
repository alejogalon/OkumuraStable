import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:okumurastableforowner/widgets/smalltext.dart';

import '../../controllers/news_from_the_stable_controller.dart';
import '../../controllers/popular_news.dart';
import '../../model/news_from_the_stable_model.dart';
import '../../routes/routerhelper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/icons_and_text.dart';
import 'account_profile_indicator.dart';
import 'account_profile_top_icon.dart';

Future<Album> createAlbum(String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int id;
  final String title;

  const Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}
//
// void main() {
//   runApp(const MyApp());
// }

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() {
    return _AccountSettingsState();
  }
}

class _AccountSettingsState extends State<AccountSettings> {
  final TextEditingController _controller = TextEditingController();
  Future<Album>? _futureAlbum;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController lineAccountController = TextEditingController();
  TextEditingController prefectureController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

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
        body: ListView(
          children: <Widget>[
            ////////////////////////////////////SLIDER SECTION
            Container(
              margin: EdgeInsets.only(top: Dimensions.height45),
              child: GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
                print("the length "+recommendedProduct.recommendedProductList.length.toString());
                return recommendedProduct.isLoaded?Container(
                  //color: Colors.red,
                  height: 230,

                  child: PageView.builder(
                      itemCount: 1,//recommendedProduct.recommendedProductList.length,
                      itemBuilder: (context, position){
                        return _buildChangeProfile(position, recommendedProduct.recommendedProductList[position]);// the widget that returns the index position
                      }),

                ):CircularProgressIndicator(
                  color: AppColors.maincolor,
                );
              }),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.width10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Name',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.width10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.width10),
              child: TextField(
                controller: contactController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Contact address',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.width10),
              child: TextField(
                controller: lineAccountController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'LINE account',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.width10),
              child: TextField(
                controller: prefectureController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Prefectures',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.width10),
              child: TextField(
                controller: addressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Address',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.width10),
              child: TextField(
                readOnly: true,
                controller: dateOfBirthController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Date of Birth',
                  suffixIcon: Icon(FontAwesome5.chevron_down),
                ),
                onTap: () async{
                  DateTime? date = DateTime(1900);
                  FocusScope.of(context).requestFocus(new FocusNode());

                  date = await showDatePicker(
                      context: context,
                      initialDate:DateTime.now(),
                      firstDate:DateTime(1900),
                      lastDate: DateTime(2100));

                  dateOfBirthController.text = DateFormat.yMd().format(date!);},
              ),
            ),
            SizedBox(height: Dimensions.height20,),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.maincolor,
                  ),
                  child: SmallText(text: 'Save',
                    size: Dimensions.font20,
                    color: AppColors.whiteColor,),
                  onPressed: () => {
                    Get.toNamed(RouteHelper.getSuccessAccountSettingsPage()),
                  }
              ),
            ),
            SizedBox(height: Dimensions.height20,),
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

  Widget _buildChangeProfile(int index, ProductModel popularProduct){
    return Stack(
      children: [

        Align(
          heightFactor: 1,
          alignment: Alignment.center,
          child: Container(
            height: 200 ,
            margin: EdgeInsets.only(top:Dimensions.height45,left: Dimensions.width30,right: Dimensions.width30 , bottom: Dimensions.height30),

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
            child: Column(
              children: [
                SizedBox(height: Dimensions.height45+10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.paraColor,

                    ),
                    child: SmallText(text: 'Change your profile picture',
                    color: AppColors.textColor,),
                    onPressed: () => {
                          // Get.toNamed(RouteHelper.getToSuccessPage()),
                    }
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: AccountProfileIndecators(),//! not empty
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            // Get.toNamed(RouteHelper.getPopularFood(index));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: Dimensions.height45,
                backgroundImage: ExactAssetImage(
                    AppConstants.PROFILE_PICTURE_URL
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}