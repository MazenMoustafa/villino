import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vallino/util/app_constants.dart';
import 'package:vallino/view/shared/toasts.dart';

class AboutUsServices{
  static Future<String?> getAboutDetails(BuildContext context) async {
    // Uri
    var request = MultipartRequest(
        'POST', Uri.parse("https://villino.e-compound.com/api/pages/about"));

    // Headers
    request.headers.addAll({
      "Accept-Language" : "en",
      "Accept" : "application/json"
    });

    // Body
    // No Body

    // Send
    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = await response.stream.bytesToString();
      var bodyJson = jsonDecode(body);
      if (bodyJson['success'] == false) {
        showToast(context, bodyJson['message']);
      } else {
        String whoRWe = bodyJson['result'][0]['details'];
        return whoRWe;
      }
    } else {
      log("errorss");
      showToast(context, "We ran into problem");
    }
  }

  static Future<List<dynamic>?> getImages(BuildContext context) async {
    // Uri
    var request = MultipartRequest(
        'POST', Uri.parse("https://villino.e-compound.com/api/pages/about"));

    // Headers
    request.headers.addAll({
      "Accept-Language" : "en",
      "Accept" : "application/json"
    });

    // Body
    // No Body

    // Send
    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = await response.stream.bytesToString();
      var bodyJson = jsonDecode(body);
      if (bodyJson['success'] == false) {
        showToast(context, bodyJson['message']);
      } else {
        List<dynamic> images = bodyJson['result'][0]['image'];

        return images;
      }
    } else {
      log("errorss");
      showToast(context, "We ran into problem");
    }
  }

}