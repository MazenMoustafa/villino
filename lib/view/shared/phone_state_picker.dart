import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vallino/util/color_resources.dart';
import 'package:vallino/util/size_config.dart';

class PhoneStatePicker extends StatefulWidget {
  const PhoneStatePicker({Key? key}) : super(key: key);

  @override
  _PhoneStatePickerState createState() => _PhoneStatePickerState();
}

class _PhoneStatePickerState extends State<PhoneStatePicker> {

  List<String> countriesNames = ["Egypt"];
  List countriesCodes = [2];
  List<String> countriesImages = ["assets/image/egypt_flag.png"];

  String choosenCountry = "Egypt";

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      focusColor: Colors.white,
      //dropdownColor: ColorResources.PRIMARY_COLOR, // Items back ground

      value: choosenCountry, // Initial Value
      //elevation: 5,
      iconEnabledColor: Colors.black,
      // m4 3ar bt3ml eh

      // Selected Item decoration
      selectedItemBuilder: (BuildContext context) {
        return countriesNames.map((String value) {
          return Text(
            value,
            style: const TextStyle(color: Colors.black),
          );
        }).toList();
      },
      // Items decoration
      items: countriesNames.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: Colors.black),
          ),
        );
      }).toList(),

      // The used one
      decoration: decoration("assets/image/egypt_flag.png"),
      // The hint here not used
      onChanged: (String? value) {
        log(value!);
      },
    );

  }

  InputDecoration decoration(String dir) {
    return InputDecoration(
      //contentPadding: EdgeInsets.symmetric(vertical: responsiveHeight(20), horizontal: responsiveWidth(20)), // The Content PAdding gets changed when an error appears
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: ColorResources.TF_FILL_COLOR,
      filled: true,
      prefixIconConstraints: BoxConstraints(minHeight: 30, minWidth: 30),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(50),
      ),
      prefixIcon: Padding(
        padding: EdgeInsets.only(
          right: responsiveWidth(16),
          left: responsiveWidth(8),
          bottom: responsiveHeight(10),
        ),
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(dir),
              )),
        ),
      ),
    );
  }
}
