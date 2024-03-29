import 'dart:convert';
import 'dart:html';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ControllerApi {
  static Future<bool> sentMessage(
      Map<String, dynamic> body, BuildContext context) async {
    var header = {
      "Accept": "*/*",
      "Content-Type": "application/json",
    };
    print('i am in hosted');
    var bodys = json.encode(body);
    Uri url = Uri.parse(
        'https://script.google.com/macros/s/AKfycbwZCgAp1XlG281G7pCDuWycvXBJ_s_V5t4lqNnW8_Op_BqCjV_iIVuwsVVydtXb2xEIWQ/exec');
    print(url);
    try {
      final response =
          await http.post(url, body: json.encode(bodys), headers: header);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        if (context.mounted) {
          showDialogBox(context);
        }
        return true;
      }
      return false;
    } catch (er) {
      print(er);
      return false;
    }
  }

  static void showDialogBox(BuildContext context) {
    AwesomeDialog(
            headerAnimationLoop: false,
            width: 500,
            context: context,
            bodyHeaderDistance: 40,
            dialogType: DialogType.success,
            animType: AnimType.scale,
            title: 'Message',
            titleTextStyle: Theme.of(context).textTheme.bodyMedium,
            desc: 'Your message successfully deliver.',
            descTextStyle: Theme.of(context).textTheme.bodySmall,
            padding: const EdgeInsets.symmetric(vertical: 40),
            closeIcon: IconButton(
              icon: const Icon(
                Icons.close,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            showCloseIcon: true)
        .show();
  }

  static void downloadCv(context) async {
    String url =
        'https://firebasestorage.googleapis.com/v0/b/cv-image.appspot.com/o/susan_cv.pdf?alt=media&token=e003b595-b765-43f9-b0e6-c3c34d90860e&_gl=1*f9bd6v*_ga*ODg1ODQ2NzM1LjE2OTY3NTg3NTQ.*_ga_CW55HF8NVT*MTY5Njc2Mzc2NC4zLjEuMTY5Njc2NDQ0OC42MC4wLjA.';
    url = Url.createObjectUrlFromBlob(Blob([url]));
    AnchorElement(href: url)
      ..setAttribute('download', 'cv_susan.pdf')
      ..click();
  }
}
