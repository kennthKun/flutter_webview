// ignore: depend_on_referenced_packages
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class GYKAppBar {
  final WebViewController controller;
  Map<String, dynamic>? navTitle;
  GYKAppBar(this.controller);

  // ignore: unused_element
  _appBar() {
    switch (navTitle?['path']) {
      case '/home/waybillList':
        // AppBar(backgroundColor: Color(0xfff6f7fB), elevation: 0)
        return null;
      case '/app/waybillHall/details':
        return AppBar(
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              controller.runJavaScript("history.go(-1)");
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: const Icon(
                Icons.chevron_left_sharp,
                color: Colors.black,
                size: 26,
              ),
            ),
          ),
          title: Text(
            navTitle?['name'] ?? '',
            style: const TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xfff6f7fB),
        );
      default:
        return null;
    }
  }
}
