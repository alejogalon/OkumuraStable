import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:translator/translator.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';


class TranslatorWidget extends StatefulWidget {
  Color color;
  final String text;
  TextAlign textAlign;
  double size;
  int? maxline;
  FontWeight? weight;
  TextOverflow? overflow;
  TranslatorWidget({Key? key,
    required this.text,
    this.size = 0,
    this.overflow,
    this.weight,
    this.maxline,
    this.color = Colors.black,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  State<TranslatorWidget> createState() => _TranslatorWidgetState();

}

class _TranslatorWidgetState extends State<TranslatorWidget> {
  // GoogleTranslator translator = GoogleTranslator();

  var output;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Locale myLocale = Localizations.localeOf(context);
   /* translator
        .translate(widget.text, to: Get.deviceLocale?.languageCode as String)
        .then((value) {
      setState(() {
        output = value;
      });
    });*/

    //var translation = translator.translate("I would buy a car, if I had money.", from: 'en', to: 'it');

    return Text(
      widget.text,//output.toString(),
      maxLines: widget.maxline,
      overflow: widget.overflow,
      textAlign: widget.textAlign,
      style: TextStyle(

        fontFamily: 'Roboto',
        color: widget.color,
          fontSize: widget.size,
          fontWeight: widget.weight
      ),
    );
  }
}
