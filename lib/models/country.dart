import 'dart:developer';

class CountryModel{
  late String name;
  late int code;
  late String flag;

  CountryModel(
      this.name,
      this.code,
      this.flag,
      );

  CountryModel.fromJson( Map<String, dynamic> json ) {
    code = json['id'];
    name = json["name"];
    flag = json['email'];
  }

}