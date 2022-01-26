import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:vallino/models/notification.dart';

class NotificationServices {

  static Future<List<NotificationModel>> getNotifications(context) async {

    // URL
    Uri uri = Uri.parse("https://villino.e-compound.com/api/notifications");

    Response res = await get(uri,);

    if (res.statusCode == 200) {
      dynamic bodyJson = jsonDecode(res.body); // will be token and UserModel object

      var data = bodyJson['result'];

      List<NotificationModel> notifications = [];

      data.forEach( (element){
        notifications.add(NotificationModel.fromJson(element));
      });

      log("notifications Showed Succeffully");
      return notifications;
    } else {
      log('Error');
      throw "Unable to retrieve notifications.";
    }
  }

}