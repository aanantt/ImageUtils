library image_utils;

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
 

class ImageUtils {
  static MemoryImage base64ToImage(String base64String) {
    return MemoryImage(
      base64Decode(base64String),
    );
  }

  static Uint8List base64ToUnit8list(String base64String) {
    return base64Decode(base64String);
  }

  static String fileToBase64(File imgFile) {
    return base64Encode(imgFile.readAsBytesSync());
  }

  static Future<String> networkImageToBase64(String url) async {
    http.Response response = await http.get(url);
    return base64.encode(response.bodyBytes);
  }
}