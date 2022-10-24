import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['Ashitaba (unread 2)', 'Ashitaba ()', 'Ashitaba (qweqweq q2)', 'Four'];


class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}



class _DropdownButtonExampleState extends State<DropdownButtonExample> {

  String _dropDownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton(
          hint: _dropDownValue == null
              ? Text('Dropdown')
              : Text(
            _dropDownValue,
            style: TextStyle(color: Colors.blue),
          ),
          isExpanded: true,
          iconSize: 30.0,
          style: TextStyle(color: Colors.blue),
          items: ['Ashitaba (unread 2)', 'Ashitaba ()', 'Ashitaba (qweqweq q2)', 'Four'].map(
                (val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(val),
              );
            },
          ).toList(),
          onChanged: (val) {
            setState(
                  () {
                _dropDownValue = val as String;
              },
            );
          },
        ),
      ],
    );
  }}