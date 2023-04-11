import 'package:gyk_flutter_webview/widget/webview.dart';
import 'package:flutter/material.dart';

class Webview extends StatelessWidget {
  final String? Url;
  const Webview({super.key, this.Url});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(Url);
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: SafeArea(
            child: Center(
              child: GYKWebView(Url: Url ?? 'http://192.168.3.79:8000'),
            ),
          ),
        ));
  }
}
