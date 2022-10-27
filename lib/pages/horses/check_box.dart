import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:okumurastableforowner/utils/colors.dart';
import 'package:okumurastableforowner/widgets/bigtext.dart';

import '../../utils/dimensions.dart';
import '../../widgets/smalltext.dart';
class ShowOnlyUnreadCheckBox extends StatefulWidget {
  ShowOnlyUnreadCheckBox({Key? key,}) : super(key: key);

  @override
  _ShowOnlyUnreadCheckBoxState createState() => _ShowOnlyUnreadCheckBoxState();
}

class _ShowOnlyUnreadCheckBoxState extends State<ShowOnlyUnreadCheckBox> {
  bool shouldCheck = false;
  bool shouldCheckDefault = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCheckBox(
          value: shouldCheckDefault,
          splashColor: Colors.red.withOpacity(0.4),
          splashRadius: 40,
          onChanged: (val) {
            //do your stuff here
            setState(() {
              shouldCheckDefault = val;
            });
          },
        ),
        BigText(text: 'Show only unread',
          color: AppColors.mainBlackColor,
        size: Dimensions.font16,
        ),
       /* Text(
          'Show only unread',
          style: TextStyle(
            color: AppColors.mainBlackColor,
            fontSize: Dimensions.font16,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),*/
      ],
    );
  }
}