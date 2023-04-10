import 'dart:convert';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

// ignore: must_be_immutable
class GYKWebView extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String Url;
  final String? statusBarColor;
  final String? title;
  Map<String, dynamic>? navTitle;
  // ignore: use_key_in_widget_constructors
  GYKWebView(
      // ignore: non_constant_identifier_names
      {required this.Url,
      // this.hideAppBar,
      this.statusBarColor,
      this.title,
      this.navTitle});

  @override
  State<StatefulWidget> createState() => _GYKWebViewState();
}

class _GYKWebViewState extends State<GYKWebView> {
  late final WebViewController controller;
  TabController? tabController;
  final List<Tab> _tabs = const [
    Tab(text: '待出发'),
    Tab(text: '配送中'),
    Tab(text: '待结算'),
    Tab(text: '已完成'),
  ];

  init() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel("flutterChannel", onMessageReceived: (message) {})
      ..addJavaScriptChannel("NavTitle", onMessageReceived: (message) {
        setState(() {
          message.message;
        });

        Map<String, dynamic> jsonMap = json.decode(message.message);
        widget.navTitle = jsonMap;
        // widget.hideAppBar = jsonMap['isNav'];
      })
      // ..setBackgroundColor(Colors.indigoAccent)
      ..loadRequest(Uri.parse(widget.Url));

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String statUsBarCikirStr = widget.statusBarColor ?? "c6d5fd";
    Color backButtonColor;
    if (statUsBarCikirStr == "ffffff") {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }

    return Scaffold(
        appBar: _appBar(
          Color(int.parse('0xff' + statUsBarCikirStr)),
          backButtonColor,
          '/app/waybillHall/details',
        ),
        body: Column(children: [
          Expanded(child: WebViewWidget(controller: controller))
        ]));
  }

  _appBar(Color bGcolor, Color backButColor, String path) {
    print(widget.navTitle);

    // 判断是否隐藏appbar
    switch (widget.navTitle?['path']) {
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
            widget.navTitle?['name'] ?? '',
            style: const TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xfff6f7fB),
        );
      default:
        return null;
    }
  }
}
