import 'package:flutter/cupertino.dart';
import 'package:okumurastableforowner/utils/colors.dart';
import 'package:okumurastableforowner/widgets/smalltext.dart';

import '../utils/dimensions.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndTextWidget({Key? key,
    required this.icon,
    required this.text,
    required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Dimensions.height10,),
        Icon(icon, color: iconColor,size: Dimensions.iconSize24,),
        SmallText(text: text,color: AppColors.buttonBackgroundColor,),
      ],
    );
  }
}

