import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class MyHomeTranslatorPage extends StatefulWidget {
  @override
  _MyHomeTranslatorPageState createState() => _MyHomeTranslatorPageState();
}

class _MyHomeTranslatorPageState extends State<MyHomeTranslatorPage> {
  TextEditingController textEditingController = TextEditingController();
  GoogleTranslator translator = GoogleTranslator();
  var output;
  var output2;
  var getlocal;
  var dropdownValue;
  //var transs = "Translated text";
  static const Map<String, String> lang = {
    "Hindi": "hi",
    "English": "en",
    "Japanese": "ja",
  };
/*
  void trans(Locale local) {
    print("local string ::: >> ");
    print(local.toString());
    translator
        .translate(textEditingController.text, to: "ja")
        .then((value) {
      setState(() {
        output = value;
      });
    });
  }*/
/*
  @override
  void didChangeDependencies() {
    Locale myLocale = Localizations.localeOf(context);
    print('my locale ${myLocale}');

    getlocal = myLocale;
    trans(myLocale);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('my locale get local ${getlocal}');


  }*/
  @override
  Widget build(BuildContext context) {

    Locale myLocale = Localizations.localeOf(context);

    translator
        .translate("Translated text", to: myLocale.toString())
        .then((value) {
      setState(() {
        output = value;
      });
    });

    translator
        .translate("Select Language here =>", to: myLocale.toString())
        .then((value) {
      setState(() {
        output2 = value;
      });
    });
    return Scaffold(
        appBar: AppBar(
          title: Text("Multi Language Translator"),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                style: TextStyle(fontSize: 24),
                controller: textEditingController,
                onTap: () {
                  // trans("ja" as Locale);
                },
                decoration: InputDecoration(
                    labelText: 'Type Here',
                    labelStyle: TextStyle(fontSize: 15)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(output2.toString()),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      // trans();
                    });
                  },
                  items: lang
                      .map((string, value) {
                    return MapEntry(
                      string,
                      DropdownMenuItem<String>(
                        value: value,
                        child: Text(string),
                      ),
                    );
                  })
                      .values
                      .toList(),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(output.toString()),

            SizedBox(
              height: 10,
            ),
            Text(
              output == null ? "Please Select Language" : output.toString(),
              style: TextStyle(
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ));
  }

/*
  Text labels(String data) {

    translator
        .translate(data, to: "ja")
        .then((value) {
      setState(() {
        output = value;
      });
    });
    return Text(output.toString());
  }

  Text labels2(String data) {

    translator
        .translate(data, to: "ja")
        .then((value) {
      setState(() {
        output2 = value;
      });
    });
    return Text(output2.toString());
  }*/
}

