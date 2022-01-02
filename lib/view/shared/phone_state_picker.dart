import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vallino/models/country.dart';
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

  List<CountryModel> countries = [
    CountryModel("Egypt", 2, "assets/image/egypt_flag.png"),
    // CountryModel("Egypt", 2, "assets/image/egypt_flag.png"),
    // CountryModel("Egypt", 2, "assets/image/egypt_flag.png")
  ];

  CountryModel choosenCountry = CountryModel("Egypt", 2, "assets/image/egypt_flag.png");

  @override
  void initState() {
    // ToDo Fetch Countries
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<CountryModel>(
      iconSize: 0.0,
      focusColor: Colors.white,
      isExpanded: true,
      //dropdownColor: ColorResources.PRIMARY_COLOR, // Items back ground

      value: countries[0], // Initial Value
      //elevation: 5,
      iconEnabledColor: Colors.black,
      // m4 3ar bt3ml eh

      // Selected Item decoration
      selectedItemBuilder: (BuildContext context) {
        return countries.map((CountryModel value) {
          return Center(
            child: Container(
              // height: responsiveHeight(20),
              // width: responsiveWidth(20),
              decoration: BoxDecoration(
                  color: ColorResources.PRIMARY_COLOR.withOpacity(0),
                  image : DecorationImage(
                      image: AssetImage(value.flag),
                      fit: BoxFit.fill)),
            ),
          );
          //   Text(
          //   value,
          //   style: const TextStyle(color: Colors.black),
          // );
        }).toList();
      },
      // Items decoration
      items: countries.map<DropdownMenuItem<CountryModel>>( (CountryModel value) {
        return DropdownMenuItem<CountryModel>(
          value: value,
          child: Center(
            child: Container(
              height: responsiveHeight(30),
              width: responsiveWidth(30),
                decoration: BoxDecoration(
                    color: ColorResources.PRIMARY_COLOR.withOpacity(0),
                    image : DecorationImage(
                        image: AssetImage(value.flag),
                        fit: BoxFit.fill)),
              ),
          )
        );
      }).toList(),

      // The used one
      decoration: decoration(),
      // The hint here not used
      onChanged: (CountryModel? value) {
        choosenCountry = value!;
      },
    );

  }

  InputDecoration decoration() {
    return InputDecoration(
      //contentPadding: EdgeInsets.symmetric(vertical: responsiveHeight(20), horizontal: responsiveWidth(20)), // The Content PAdding gets changed when an error appears
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: ColorResources.TF_FILL_COLOR,
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
