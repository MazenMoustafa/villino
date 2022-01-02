import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vallino/util/app_constants.dart';
import 'package:vallino/view/shared/toasts.dart';

class AuthenticationServices{
  static Future<bool> login(BuildContext context, String email, String password,) async {
    // Uri
    var request = MultipartRequest(
        'POST', Uri.parse("https://villino.e-compound.com/api/login"));

    // Headers
    request.headers.addAll({
      "Accept-Language" : "en",
      "Accept" : "application/json"
    });

    // Body
    request.fields.addAll({
      "email" : email,
      "password" : password
    });

    // Send
    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = await response.stream.bytesToString();
      var bodyJson = jsonDecode(body);
      if (bodyJson['success'] == false) {
        showToast(context, bodyJson['message']);
        return false;
      } else {
        //showToast(context, getTranslated(context, "Message was sent")!);
        return true;
      }
    } else {
      log("errorss");
      showToast(context, "We ran into problem");
      return false;
    }
  }

  static Future<bool> register(BuildContext context,
      String full_name,
      String email,
      String phone, String password, int country_id, int family_count, int building_number, int device_id) async {
    // Uri
    var request = MultipartRequest(
        'POST', Uri.parse( AppConstants.MAIN_URL + "register"));

    // Headers
    request.headers.addAll({
      "Accept-Language" : "en",
      "Accept" : "application/json"
    });

    // Body
    request.fields.addAll({
      "full_name" : full_name,
      "email" : email,
      "password" : password,
      "phone": phone,
      "family_count" : family_count.toString(),
      "password_confirmation" : password,
      "country_id" : country_id.toString(),
      "building_number" : building_number.toString(),
      "device_id" : device_id.toString(),
    });

    // Send
    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      log("200");
      var body = await response.stream.bytesToString();
      var bodyJson = jsonDecode(body);
      if (bodyJson['success'] == false) {
        showToast(context, bodyJson['message']);
        return false;
      } else {
        //showToast(context, getTranslated(context, "Message was sent")!);
        return true;
      }
    } else {
      log("errorss");
      showToast(context, "We ran into problem");
      return false;
    }
  }
}