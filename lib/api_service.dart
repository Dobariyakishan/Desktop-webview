import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  static const String url = 'http://192.168.29.41:8000/api/deviceIdStore';

  Future<void> addDeviceID(String deviceId) async {
    try {
      final Response response = await Dio().post(
        url,
        data: {"device_id": deviceId},
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
