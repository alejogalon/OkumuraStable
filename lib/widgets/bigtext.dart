import 'package:flutter/cupertino.dart';
import 'package:okumurastableforowner/widgets/translator_widget.dart';

import '../utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color color;
  final String text;
  TextAlign textAlign;
  double size;
  TextOverflow overflow;
  BigText({Key? key, this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 0,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TranslatorWidget(text: text,
      size: size==0?Dimensions.font20:size,
    weight: FontWeight.w400,
    color: color,
    maxline: 1,
    textAlign: textAlign,
    overflow: overflow);

    // return Text(
    //   text,
    //   maxLines: 1,
    //   overflow: overflow,
    //   textAlign: TextAlign.left,
    //   style: TextStyle(
    //       fontFamily: 'Roboto',
    //       color: color, fontSize: size==0?Dimensions.font20:size,
    //       fontWeight: FontWeight.w400
    //   ),
    // );
  }
}
