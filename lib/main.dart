import 'package:flutter/material.dart';
import 'package:gyk_flutter_webview/widget/webview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        // home: GYKWebView(Url: 'http://192.168.3.79:8000'),
        home: Scaffold(
          body: SafeArea(
            child: Center(
              child: GYKWebView(Url: 'http://192.168.3.79:8000'),
            ),
          ),
        ));
  }
}
