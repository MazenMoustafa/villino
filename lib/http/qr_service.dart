import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vallino/util/app_constants.dart';
import 'package:vallino/view/shared/toasts.dart';

class QRCodeServices{
  static Future<String?> qr_type1(BuildContext context, int customer_id) async {

    var headers = {
      'Authorization': 'c8f06001-bf5a-46b3-afd75f-f5677769fc6c',
      'Content-Type': 'application/json'
    };
    var request = Request('POST', Uri.parse('http://207.38.88.71:22112/newgiza/qr/'));
    request.body = json.encode({
      "customer_id": customer_id,
      "qr_type": 1
    });
    request.headers.addAll(headers);

   StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = await response.stream.bytesToString();
      var bodyJson = jsonDecode(body);
      if (bodyJson['status'] == false) {
        showToast(context, bodyJson['error']);
      } else {

        String QR_String = bodyJson['qr_code'];
        return QR_String;
      }
    } else {
      log("errorss");
      showToast(context, "We ran into problem");
    }
  }

  static Future<String?> qr_type2(BuildContext context, int customer_id, String visit_date) async {

    var headers = {
      'Authorization': 'c8f06001-bf5a-46b3-afd75f-f5677769fc6c',
      'Content-Type': 'application/json'
    };
    var request = Request('POST', Uri.parse('http://207.38.88.71:22112/newgiza/qr/'));
    request.body = json.encode({
      "customer_id": customer_id,
      "qr_type": 2,
      "visit_date" : visit_date
    });
    request.headers.addAll(headers);

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = await response.stream.bytesToString();
      var bodyJson = jsonDecode(body);
      if (bodyJson['status'] == false) {
        showToast(context, bodyJson['error']);
      } else {

        String QR_String = bodyJson['qr_code'];
        return QR_String;
      }
    } else {
      log("errorss");
      showToast(context, "We ran into problem");
    }
  }

}