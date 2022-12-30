import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_web_app/api_service.dart';
import 'package:webview_win_floating/webview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:platform_device_id/platform_device_id.dart';

void main() {
  if (Platform.isWindows) WebView.platform = WindowsWebViewPlugin();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late WebViewController controller;

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    final String deviceId = await _getDeviceId();
    ApiService().addDeviceID(deviceId);
  }

  Future<String> _getDeviceId() async {
    String? deviceId;
    try {
      deviceId = await PlatformDeviceId.getDeviceId;
    } catch (e) {
      //deviceId = 'Failed to get deviceId.';
      log('Failed to get deviceId.');
    }

    return deviceId ?? '';
  }

  @override
  Widget build(BuildContext context) {
    /*
    https://pub.dev/packages/webview_win_floating
    */

    final Widget webview = WebView(
      initialUrl: "http://192.168.29.16:3001/register",
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) {
        this.controller = controller;
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: webview,
    );
  }
}
