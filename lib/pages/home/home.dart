
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:okumurastableforowner/utils/dimensions.dart';
import 'package:okumurastableforowner/widgets/smalltext.dart';

import '../../utils/colors.dart';
import '../../widgets/bigtext.dart';
import '../../widgets/dropdown_horses.dart';




class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    // drawer: NavigationDrawer(),
    appBar: AppBar(
      automaticallyImplyLeading: false,
      title: SmallText(text:"OKUMURA STABLE\nFor Owners"),// Text("OKUMURA STABLE\nFor Owners"),
      backgroundColor: AppColors.maincolor,
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
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
  );
}
