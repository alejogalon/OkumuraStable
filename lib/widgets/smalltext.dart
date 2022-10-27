import 'package:flutter/cupertino.dart';
import 'package:okumurastableforowner/widgets/translator_widget.dart';

import '../utils/dimensions.dart';

class SmallText extends StatelessWidget {
  Color color;
  final String text;
  TextAlign textAlign;
  double size;
  double height;
  SmallText({Key? key, this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 12,
    this.height = 1.2,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TranslatorWidget(text: text,
      size: size==0?Dimensions.font12:size,
      color: color,
      textAlign: textAlign,
      weight: FontWeight.normal,);
    //   Text(
    //   text,
    //   style: TextStyle(
    //     fontFamily: 'Roboto',
    //     color: color,
    //     fontSize: size,
    //   ),
    // );
  }
}
