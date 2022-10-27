import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:okumurastableforowner/widgets/smalltext.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final double size;
  const ExpandableText({Key? key, required this.text, required this.size}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  late double size;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight/8.5;
//i love flutter laravel and golang 30
  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }
    else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(color: AppColors.paraColor, size:Dimensions.font16, text: firstHalf):Column(
        children: [
          SmallText(height: 1.8, color:AppColors.paraColor , size: widget.size, text: hiddenText?(firstHalf+"..."):(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: hiddenText?"See more":"See less", color: AppColors.maincolor,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up, color: AppColors.maincolor,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
