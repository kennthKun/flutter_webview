import 'package:gyk_flutter_webview/widget/webview.dart';
import 'package:flutter/material.dart';

class Webview extends StatelessWidget {
  const Webview({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: SafeArea(
            child: Center(
              child: GYKWebView(Url: 'https://dev-app.ailieyun.com'),
            ),
          ),
        ));
  }
}
