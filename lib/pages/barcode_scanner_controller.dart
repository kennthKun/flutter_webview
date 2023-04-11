import 'dart:typed_data';
import 'package:gyk_flutter_webview/pages/webview.dart';
import 'package:gyk_flutter_webview/utils/gap_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:oktoast/oktoast.dart';
import 'package:recognition_qrcode/recognition_qrcode.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../http/lieyun_server.dart';
import '../../../models/wallet_model.dart';
// import '../../auth/driver/driver_auth_page.dart';
// import '../../auth/vehicle/vehicle_auth_page.dart';

class BarcodeScannerWithController extends StatefulWidget {
  const BarcodeScannerWithController({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BarcodeScannerWithControllerState createState() =>
      _BarcodeScannerWithControllerState();
}

class _BarcodeScannerWithControllerState
    extends State<BarcodeScannerWithController>
    with SingleTickerProviderStateMixin {
  MobileScannerController cameraController = MobileScannerController();

  WalletModel? model;
  int? driverReviewState;
  int? vehicleReviewState;

  @override
  void initState() {
    super.initState();
    // getWallet();
  }

  getCertificationPage() async {
    dynamic res = await LieyunServer().getCertificationPage({
      "data": {
        "reviewState": 1,
        "user": {"phone": model?.driver?.phone}
      }
    });
    if (res?["content"] != []) {
      var vehicleLicenceState =
          res?["content"].any((e) => e["authenticationType"] == 5) ? 4 : 1;
      var transportLicenceState =
          res?["content"].any((e) => e["authenticationType"] == 6) ? 4 : 1;
      var realNameState =
          res?["content"].any((e) => e["authenticationType"] == 1) ? 4 : 1;
      var driverLicenseState =
          res?["content"].any((e) => e["authenticationType"] == 3) ? 4 : 1;
      if (model?.vehicleLicenceState == 2 ||
          model?.transportLicenceState == 2 ||
          vehicleLicenceState == 4 ||
          transportLicenceState == 4) {
        vehicleReviewState = 4;
      }
      if (model?.driverLicenseState == 2 ||
          model?.realNameState == 2 ||
          realNameState == 4 ||
          driverLicenseState == 4) {
        driverReviewState = 4;
      }
    }
    setState(() {});
  }

  getWallet() async {
    model = await LieyunServer().getWallet();
    getCertificationPage();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MobileScanner(
          // fit: BoxFit.contain,
          controller: cameraController,
          onDetect: (capture) {
            final List<Barcode> barcodes = capture.barcodes;
            final Uint8List? image = capture.image;
            for (final barcode in barcodes) {
              judge(barcode.rawValue);
              debugPrint('Barcode found! ${barcode.rawValue}');
            }
            // if (image != null) {
            //   showDialog(
            //     context: context,
            //     builder: (context) => Image(image: MemoryImage(image)),
            //   );
            //   Future.delayed(const Duration(seconds: 2), () {
            //     Navigator.pop(context);
            //   });
            // }
          },
        ),
        AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 30,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
          ],
        ),
        Positioned(
            top: 94.r,
            right: 127.r,
            left: 128.r,
            child: const Text(
              '请扫描二维码',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
        Positioned(
            bottom: 147.r,
            right: 117.r,
            left: 118.r,
            child: InkWell(
              onTap: () async {
                final ImagePicker picker = ImagePicker();
                // Pick an image
                final XFile? image = await picker.pickImage(
                  source: ImageSource.gallery,
                );
                if (image != null) {
                  if (await cameraController.analyzeImage(image.path)) {
                    if (!mounted) return;
                    RecognitionQrcode.recognition(image.path).then((result) {
                      judge(result);
                    });
                    showToast('识别成功');
                  } else {
                    if (!mounted) return;
                    showToast('没有发现二维码');
                  }
                }
              },
              child: Container(
                  height: 36.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(const Radius.circular(35).w),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/mine/phone_album.png',
                      ),
                      GapHelper.width5,
                      const Text(
                        '从相册选择',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )),
            )),
        Container(
          margin:
              const EdgeInsets.only(top: 283, left: 78, right: 78, bottom: 270)
                  .r,
          child: Image.asset(
            'assets/images/mine/scan_box.png',
            width: 240.w,
          ),
        )
      ],
    );
  }

  judge(result) {
    print(result);
    ;
    result != null
        ? (result.toString().contains('id=')
            ? (model?.driverLicenseState != 2 &&
                    model?.realNameState != 2 &&
                    driverReviewState != 4
                ? Get.to(Webview(
                    Url:
                        "http://192.168.3.79:8000/app/templetReceiving?id=${result.toString().substring(result.toString().indexOf('=') + 1)}"))
                : null)
            : showToast('未获取到模版ID'))
        : const SizedBox();
  }
}


// (model?.driver?.vehicleList == null ||
//                         model?.vehicleLicenceState != 2 &&
//                             model?.transportLicenceState != 2 &&
//                             vehicleReviewState != 4
//                     ? Get.off(VehicleAuthPage(
//                         id: result
//                             .toString()
//                             .substring(result.toString().indexOf('=') + 1)))
//                     : Get.off(QrCodeScanPage(
//                         id: result
//                             .toString()
//                             .substring(result.toString().indexOf('=') + 1),
//                       )))