import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gyk_flutter_webview/pages/barcode_scanner_controller.dart';
// ignore: depend_on_referenced_packages
import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:xbr_network_freight/core/shipping_return.dart';
import 'package:xbr_network_freight/xbr_network_freight.dart';
import 'package:xbr_network_freight/core/shipping_note_info.dart';

// ignore: must_be_immutable

enum ClockInType {
  /// 修改运费
  updateFee,

  /// 出发
  departure,

  /// 装货
  loading,

  /// 在途
  onload,

  /// 卸货
  discharge,

  /// 问题上报
  reportProblem,

  /// 签收
  signFor,

  /// 停止
  stop
}

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
  late Timer _authTimer;
  bool isStop = false;

  stopSDK(driverName, vehicleNo, remark, shippingInfos) async {
    try {
      final stopResult = await XbrNetworkFreight.stop(
          driverName: driverName,
          returnBack: (ReqReturn shippingReturn) {
            print(shippingReturn.msg);
          },
          remark: remark,
          shippingNoteInfos: shippingInfos,
          vehicleNumber: vehicleNo);
      _authTimer.cancel();
      setState(() {
        isStop = true;
      });
    } catch (e) {
      print('$e');
    }
  }

  authSDK() async {
    try {
      if (Platform.isAndroid) {
        final initResult = XbrNetworkFreight.init();
        final authResult = await XbrNetworkFreight.auth(
            appSecurity:
                '5fe168ffe15f4eca8f074ba70105a9be6b974bdb79084349ad866aef1721a7856XfMEbyEuTvT96Sp',
            enterpriseSenderCode: '124k0Kw11QMtjHvzqiL9',
            environment: 'release',
            returnBack: (ReqReturn shippingReturn) {
              print(shippingReturn.msg);
            },
            tmsAppId: 'cn.lieyuntong.app.lieyuntong_app');
        _authTimer = Timer.periodic(const Duration(hours: 2), (timer) {
          XbrNetworkFreight.auth(
              appSecurity:
                  '5fe168ffe15f4eca8f074ba70105a9be6b974bdb79084349ad866aef1721a7856XfMEbyEuTvT96Sp',
              enterpriseSenderCode: '124k0Kw11QMtjHvzqiL9',
              environment: 'release',
              returnBack: (ReqReturn shippingReturn) {
                print(shippingReturn.msg);
              },
              tmsAppId: 'cn.lieyuntong.app.lieyuntong_app');
        });
      } else if (Platform.isIOS) {
        final authResult = await XbrNetworkFreight.auth(
            appSecurity:
                'd498cfb14c3b4f779541b8e491b3d18fb65898f805954b1a8af533fdd5ec3e5db4YViS3qMaPVLv1M',
            enterpriseSenderCode: '124k0Kw11QMtjHvzqiL9',
            environment: 'release',
            returnBack: (ReqReturn shippingReturn) {
              print(shippingReturn.msg);
            },
            tmsAppId: 'cn.lieyuntong.app.lieyuntongApp');
        _authTimer = Timer.periodic(const Duration(hours: 2), (timer) {
          XbrNetworkFreight.auth(
              appSecurity:
                  'd498cfb14c3b4f779541b8e491b3d18fb65898f805954b1a8af533fdd5ec3e5db4YViS3qMaPVLv1M',
              enterpriseSenderCode: '124k0Kw11QMtjHvzqiL9',
              environment: 'release',
              returnBack: (ReqReturn shippingReturn) {
                print(shippingReturn.msg);
              },
              tmsAppId: 'cn.lieyuntong.app.lieyuntongApp');
        });
      }
    } catch (e) {
      print('$e');
    }
  }

  startSDK(driverName, vehicleNo, remark, shippingNoteInfos) async {
    try {
      if (shippingNoteInfos.isEmpty) {
        print("开始运输失败,您传入的运单为空");
        return;
      }
      final startResult = await XbrNetworkFreight.start(
        driverName: driverName,
        returnBack: (ReqReturn shippingReturn) {
          if (shippingReturn.code == '888889') {
            print("运单开始时返回认证授权失效,正在恢复认证");
            authSDK();
            startSDK(driverName, vehicleNo, remark, shippingNoteInfos);
            return;
          }
          print(shippingReturn.msg);
        },
        remark: remark,
        shippingNoteInfos: shippingNoteInfos,
        vehicleNumber: vehicleNo,
      );
      final sendResult = await XbrNetworkFreight.send(
          driverName: driverName,
          returnBack: (ReqReturn shippingReturn) {
            if (shippingReturn.data?[0].interval != null) {
              print(shippingReturn.data?[0].interval);
              Future.delayed(
                  Duration(
                      milliseconds: shippingReturn.data?[0].interval ?? 180000),
                  () {
                print(shippingReturn.data?[0].interval);
                sendSDK(vehicleNo, driverName, remark, shippingNoteInfos);
              });
            }
          },
          remark: remark,
          shippingNoteInfos: shippingNoteInfos,
          vehicleNumber: vehicleNo);
    } catch (e) {
      print(e);
    }
  }

  sendSDK(vehicleNo, driverName, remark, shippingNoteInfos) async {
    try {
      isStop
          ? print('结束')
          : await XbrNetworkFreight.send(
              driverName: driverName,
              returnBack: (ReqReturn shippingReturn) {
                print(shippingReturn.data);
                Future.delayed(
                    Duration(
                        milliseconds:
                            shippingReturn.data?[0].interval ?? 180000), () {
                  sendSDK(vehicleNo, driverName, remark, shippingNoteInfos);
                });
              },
              remark: remark,
              shippingNoteInfos: shippingNoteInfos,
              vehicleNumber: vehicleNo);
    } catch (e) {
      print(e);
    }
  }

  init() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel("JumpScaner", onMessageReceived: (message) {
        print(1111);
        Get.to(const BarcodeScannerWithController());
      })
      ..addJavaScriptChannel("qiyun", onMessageReceived: (message) {
        Map<String, dynamic> jsonMap = json.decode(message.message);
        print(jsonMap);
        // authSDK();
      })
      ..addJavaScriptChannel("zhuanghuo", onMessageReceived: (message) {
        Map<String, dynamic> jsonMap = json.decode(message.message);
        print(jsonMap);
        final driverName = jsonMap['driverName'];
        final vehicleNo = jsonMap['vehicleNo'];
        final remark = jsonMap['remark'];
        final data = jsonMap['shippingNoteInfos'];
        List<ShippingNoteInfo> shippingNoteInfos = [
          ShippingNoteInfo(
              shippingNoteNumber: data[0]?['shippingNoteNumber'],
              serialNumber: data[0]?['serialNumber'],
              startCountrySubdivisionCode: data?[0]
                  ?['startCountrySubdivisionCode'],
              endCountrySubdivisionCode: data?[0]?['endCountrySubdivisionCode'],
              startLongitude: double.parse(data?[0]?['startLongitude']),
              startLatitude: double.parse(data?[0]?['startLatitude']),
              endLongitude: double.parse(data?[0]?['endLongitude']),
              endLatitude: double.parse(data?[0]?['endLatitude']),
              startLocationText: data[0]?['startLocationText'],
              endLocationText: data[0]?['endLocationText'],
              vehicleNumber: data[0]?['vehicleNumber'],
              driverName: data[0]?['driverName'],
              interval: 5000)
        ];
        print(shippingNoteInfos);
        startSDK(driverName, vehicleNo, remark, shippingNoteInfos);
      })
      ..addJavaScriptChannel("xiehuo", onMessageReceived: (message) {
        Map<String, dynamic> jsonMap = json.decode(message.message);
        print(jsonMap);
        final driverName = jsonMap['driverName'];
        final vehicleNo = jsonMap['vehicleNo'];
        final remark = jsonMap['remark'];
        final data = jsonMap['shippingNoteInfos'];
        List<ShippingNoteInfo> shippingNoteInfos = [
          ShippingNoteInfo(
              shippingNoteNumber: data[0]?['shippingNoteNumber'],
              serialNumber: data[0]?['serialNumber'],
              startCountrySubdivisionCode: data?[0]
                  ?['startCountrySubdivisionCode'],
              endCountrySubdivisionCode: data?[0]?['endCountrySubdivisionCode'],
              startLongitude: double.parse(data?[0]?['startLongitude']),
              startLatitude: double.parse(data?[0]?['startLatitude']),
              endLongitude: double.parse(data?[0]?['endLongitude']),
              endLatitude: double.parse(data?[0]?['endLatitude']),
              startLocationText: data[0]?['startLocationText'],
              endLocationText: data[0]?['endLocationText'],
              vehicleNumber: data[0]?['vehicleNumber'],
              driverName: data[0]?['driverName'],
              interval: 5000)
        ];
        print(shippingNoteInfos);
        stopSDK(driverName, vehicleNo, remark, shippingNoteInfos);
      })
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
        body: Column(children: [
      Expanded(child: WebViewWidget(controller: controller))
    ]));
  }
}
