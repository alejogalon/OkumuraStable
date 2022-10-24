import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okumurastableforowner/routes/routerhelper.dart';
import 'package:okumurastableforowner/utils/colors.dart';
import 'package:okumurastableforowner/utils/dimensions.dart';
import 'package:okumurastableforowner/widgets/bigtext.dart';
import 'package:okumurastableforowner/widgets/smalltext.dart';

// void main() => runApp(const Login());

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
            alignment: Alignment.center,
            padding: EdgeInsets.all(Dimensions.width10),
            child: Column(
              children: [
                BigText(
                  text: 'OKUMURA STABLE',
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                BigText(
                  text: 'for Owner',
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(Dimensions.width10),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Email',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Password',
              ),
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
                child: Text('LOG IN',
                  style: TextStyle(fontSize: Dimensions.font20),),
                onPressed: () => {
                   Get.toNamed(RouteHelper.getToSuccessPage()),
                }
            ),
          ),
          SizedBox(height: Dimensions.height10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: Text(
                  'If you cannot log in, please contact us from here',
                  style: TextStyle(fontSize: Dimensions.font26 / 2,
                      color: AppColors.blueColor),
                ),
                onPressed: () {
                  // Get.toNamed(RouteHelper.getToHomePage());
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
  }
}