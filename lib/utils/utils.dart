import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:url_launcher/url_launcher.dart';

import 'log_utils.dart';

void dismissKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

class Utils {
  /// 纯数字
  static const String BASE_IMG = 'https://static-zjk.lieyuntong.cn/';

  /// 纯数字
  static const String DIGIT_REGEX = "[0-9]";

  /// 含有数字
  static const String CONTAIN_DIGIT_REGEX = ".*[0-9].*";

  /// 纯字母
  static const String LETTER_REGEX = "[a-zA-Z]";

  // 包含字母
  static const String SMALL_CONTAIN_LETTER_REGEX = ".*[a-z].*";

  // 包含字母
  static const String BIG_CONTAIN_LETTER_REGEX = ".*[A-Z].*";

  // 包含字母
  static const String CONTAIN_LETTER_REGEX = ".*[a-zA-Z].*";

  // 同时包含字母和数字
  static const String CONTAIN_LETTER_DIGIT =
      "^(?![0-9]+)(?![a−zA−Z]+)[0-9A-Za-z]{6,14}\$";

  // 纯中文
  static const String CHINESE_REGEX = "[\u4e00-\u9fa5]";

  // 仅仅包含字母和数字
  static const String lETTER_DIGIT_REGEX = "^[a-z0-9A-Z]+\$";
  static const String CHINESE_LETTER_REGEX = "([\u4e00-\u9fa5]+|[a-zA-Z]+)";
  static const String CHINESE_LETTER_DIGIT_REGEX =
      "^[a-z0-9A-Z\u4e00-\u9fa5]+\$";

  /// 邮箱判断
  static bool isEmail(String? input) {
    String regexEmail =
        "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}\$";
    if (input == null || input.isEmpty) return false;
    return RegExp(regexEmail).hasMatch(input);
  }

  /// 仅仅包含字母和数字
  static bool isLetterDigit(String? input) {
    String regex = "^[a-z0-9A-Z]+\$";
    if (input == null || input.isEmpty) return false;
    return RegExp(regex).hasMatch(input);
  }

  /// 同时包含字母和数字
  static bool isContainLetterAndDigit(String? input) {
    if (input == null || input.isEmpty) return false;
    return RegExp(r"^[ZA-ZZa-z0-9_]+$").hasMatch(input);
  }

  /// 纯字母
  static bool isOnlyLetter(String? input) {
    if (input == null || input.isEmpty) return false;
    return RegExp(r'[a-zA-Z]').hasMatch(input);
  }

  /// 纯数字
  static bool isOnlyDigit(String? input) {
    if (input == null || input.isEmpty) return false;
    return RegExp(r'[0-9]').hasMatch(input);
  }

  // 含有数字
  static bool hasDigit(String? input) {
    if (input == null || input.isEmpty) return false;
    return RegExp(r".*[0-9].*").hasMatch(input);
  }

  // 含有字母
  static bool hasLetter(String? input) {
    if (input == null || input.isEmpty) return false;
    return RegExp(r".*[a-zA-Z].*").hasMatch(input);
  }

  // 是否包含中文
  static bool isChinese(String? input) {
    if (input == null || input.isEmpty) return false;
    return RegExp(CHINESE_REGEX).hasMatch(input);
  }

  ///大陆手机号码11位数，匹配格式：前三位固定格式+后8位任意数
  /// 此方法中前三位格式有：
  /// 13+任意数 * 15+除4的任意数 * 18+除1和4的任意数 * 17+除9的任意数 * 147
  static bool isPhoneLegal(String str) {
    RegExp exp = RegExp(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    bool matched = exp.hasMatch(str);
    return matched;
  }

  /// Base64加密
  static String encodeBase64(String data) {
    var content = utf8.encode(data);
    var digest = base64Encode(content);
    return digest;
  }

  /// 通过图片路径将图片转换成Base64字符串
  static Future<String> image2Base64(String path) async {
    File file = File(path);
    List<int> imageBytes = await file.readAsBytes();
    return 'data:image/jpg;base64,' + base64Encode(imageBytes);
  }

  /// 判断字符串是否是全部空格
  ///
  /// true 表示全部是空格
  ///
  /// false 表示有字符
  static bool isAllBlanks(String? str) {
    if (str == null || str.length == 0) {
      return true;
    } else {
      /// 去除左右两边的空格
      var s = str.trim();
      if (s.length == 0) {
        return true;
      }
      return false;
    }
  }

  static Size boundingTextSize(
      BuildContext context, String text, TextStyle style,
      {int maxLines = 2 ^ 31, double maxWidth = double.infinity}) {
    if (text == null || text.isEmpty) {
      return Size.zero;
    }
    final TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        locale: Localizations.localeOf(context),
        text: TextSpan(text: text, style: style),
        maxLines: maxLines)
      ..layout(maxWidth: maxWidth);
    return textPainter.size;
  }

  static String getLiveStatus(int status) {
    if (status == 1) {
      return 'comingSoon'.tr;
    }
    if (status == 2) {
      return 'onGoing'.tr;
    }
    if (status == 3) {
      return 'finished'.tr;
    }
    return '';
  }

  static Future<ui.Image> loadImage(String url) async {
    AssetBundle _bundle = rootBundle;
    ImageStream stream =
        AssetImage(url, bundle: _bundle).resolve(ImageConfiguration.empty);
    Completer<ui.Image> completer = Completer<ui.Image>();
    ImageStreamListener? listener;
    listener = ImageStreamListener((ImageInfo frame, bool synchronousCall) {
      final ui.Image image = frame.image;
      completer.complete(image);
      stream.removeListener(listener!);
    });
    stream.addListener(listener);
    return completer.future;
  }

  static Future<ui.Image> loadImageFromFile(String url) async {
    ImageStream stream = FileImage(
      File.fromUri(Uri.parse(url)),
    ).resolve(ImageConfiguration.empty);
    Completer<ui.Image> completer = Completer<ui.Image>();
    ImageStreamListener? listener;
    listener = ImageStreamListener((ImageInfo frame, bool synchronousCall) {
      final ui.Image image = frame.image;
      completer.complete(image);
      stream.removeListener(listener!);
    });
    stream.addListener(listener);
    return completer.future;
  }

  static double formatNum(dynamic nums, int postion) {
    var num;
    if (nums is double) {
      num = nums;
    } else {
      num = double.parse(nums.toString());
    }
    if ((num.toString().length - num.toString().lastIndexOf(".") - 1) <
        postion) {
      return double.parse(num.toStringAsFixed(postion)
          .substring(0, num.toString().lastIndexOf(".") + postion + 1)
          .toString());
    } else {
      return double.parse(num.toString()
          .substring(0, num.toString().lastIndexOf(".") + postion + 1)
          .toString());
    }
  }

  /// 打电话
  static callPhone(String phone) async {
    final Uri uri = Uri(scheme: 'tel', path: phone);
    if (await launchUrl(uri)) {
      await launchUrl(uri);
    } else {
      logE("url不能进行访问，异常。");
    }
  }
}
