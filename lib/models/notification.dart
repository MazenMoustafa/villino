import 'dart:developer';
class NotificationModel{
  late String name;
  late int id;
  late String details;

  NotificationModel(
      this.name,
      this.id,
      this.details,
      );

  NotificationModel.fromJson( Map<String, dynamic> json ) {
    id = json['id'];
    name = json["name"];
    details = json['details'];
  }

}