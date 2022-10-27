import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:okumurastableforowner/routes/routerhelper.dart';
import 'package:okumurastableforowner/utils/colors.dart';
import 'package:okumurastableforowner/utils/dimensions.dart';
import 'package:okumurastableforowner/widgets/bigtext.dart';
import 'package:okumurastableforowner/widgets/smalltext.dart';

// void main() => runApp(const Login());

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(title: const Text(_title)),
        body: Container(
            margin: EdgeInsets.only(top: Dimensions.height45),
            child: const LoginWidget()),
      ),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}
// enum SingingCharacter { rememberme }
class _LoginWidgetState extends State<LoginWidget> {
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
                      child: SmallText(text: "You are now logged!",
                        size: Dimensions.font20,
                        color: AppColors.mainBlackColor,),
                    ),
                    SizedBox(height: Dimensions.height45,),
                    Container(
                      height: 50,
                      width: Dimensions.screenWidth,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.maincolor,
                          ),
                          child: SmallText(text: 'Start the app',
                          size: Dimensions.font20,
                            color: AppColors.whiteColor,),/*Text('Start the app',
                            style: TextStyle(fontSize: Dimensions.font20),),*/
                          onPressed: () => {
                            Get.toNamed(RouteHelper.getToHomePage())
                          }
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: Dimensions.height10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    child: SmallText(text: 'If you cannot log in, please contact us from here',
                      size: Dimensions.font26 / 2,
                      color: AppColors.blueColor,),
                    onPressed: () {
                       Get.toNamed(RouteHelper.getToHomePage());
                    },
                  ),
                ],
              ),
            ],
          )),
        bottomNavigationBar: Container(
          height: double.minPositive + 20,
          width: double.maxFinite,
          child:  Align(
            child: Text("© Okumura Stable"),
          ),
          /*decoration: BoxDecoration(
                color: Colors.deepOrange[200],
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(20.0))),*/
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