import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:okumurastableforowner/widgets/smalltext.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/bigtext.dart';

class AccountProfileIndecators extends StatelessWidget {
  const AccountProfileIndecators({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ Column(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle_rounded, color: AppColors.blueColor,),
                Icon(Icons.circle_rounded, color: AppColors.lightblueColor,),
                Icon(Icons.circle_rounded, color: AppColors.redColor,),
              ],
            ),
          )
        ],
      ),]
    );
  }
}
