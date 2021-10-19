
import 'dart:developer';
import 'dart:convert' as convert;
import 'dart:io' as io;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;



class MethodConstants {

  static Future<bool> isInternetAvailable() async {
    try {
      final result = await io.InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on io.SocketException catch (_) {
      return false;
    }
  }
}