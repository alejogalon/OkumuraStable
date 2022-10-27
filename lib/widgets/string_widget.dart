import 'package:flutter/cupertino.dart';
import 'package:okumurastableforowner/widgets/translator_widget.dart';

import '../utils/dimensions.dart';

class StringWidget extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  StringWidget({Key? key, this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 12,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TranslatorWidget(text: text,
      size: size==0?Dimensions.font12:size,
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
