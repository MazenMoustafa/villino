import 'dart:developer';

class UserModel{
  late var id;
  late var country_id;
  late var name;
  late var email;
  late var phone;
  late String? picture;
  late var family_count;
  late var building_number;


  UserModel(
      this.id,
      this.name,
      this.email,
      this.phone,
      this.building_number,
      this.country_id,
      this.family_count,
      this.picture

      );

  UserModel.fromJson( Map<String, dynamic> json ) {
    id = json['id'];
    name = json["name"];
    email = json['email'];
    phone = json['phone'];
    country_id = json['country_id'];
    family_count = json['family_count'];
    building_number = json['building_number'];

    if (json.containsKey('picture')) picture = json['picture'];


  }




}