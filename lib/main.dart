import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// import 'package:gyk_flutter_webview/widget/webview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'utils/theme_data.dart';
import 'utils/app_router.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    // 强制竖屏
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  runApp(ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return OKToast(
            textStyle: const TextStyle(
              fontSize: 14.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            radius: 4.0,
            textPadding: const EdgeInsets.fromLTRB(24, 18, 24, 18),
            backgroundColor: Colors.black.withOpacity(0.87),
            child: Scaffold(
              body: GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
                child: GetMaterialApp(
                  title: '猎运通',
                  debugShowCheckedModeBanner: false,
                  defaultTransition: Transition.rightToLeftWithFade,
                  theme: myThemeData,
                  initialRoute: AppRouter.root,
                  getPages: AppRouter.pages,
                  builder: EasyLoading.init(),
                ),
              ),
            ));
      }));
  // runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Flutter Demo',
//         home: Scaffold(
//           body: SafeArea(
//             child: Center(
//               child: GYKWebView(Url: 'http://192.168.3.79:8000'),
//             ),
//           ),
//         ));
//   }
// }
