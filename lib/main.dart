import 'dart:developer';

import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_web_app/api.dart';
import 'package:flutter_web_app/mobileWebView.dart';
import 'package:flutter_web_app/webview.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:platform_device_id_platform_interface/platform_device_id_platform_interface.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('argssd: ${args}');
  if (runWebViewTitleBarWidget(args)) {
    return;
  }


  runApp( MyStatefulWidget());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _deviceId;

  @override
  void initState() {

    initPlatformState();
    abc();
    if (kIsWeb) {
      debugPrint('kIsWeb: $kIsWeb');
    } else {
      // NOT running on the web! You can check for additional platforms here.
    }

    super.initState();
  }

  abc()async{
    log('web id : ${await WebviewWindow.isWebviewAvailable()}');
    final webview = await WebviewWindow.create(
        configuration: CreateConfiguration(
            title: 'Letmegrab Ads'
        )
    );

    webview.setBrightness(Brightness.dark);
    webview.launch("https://alphabusiness.letmegrab.in/");

  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String? deviceId = '';
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      deviceId = await PlatformDeviceIdPlatform.instance.getDeviceId();
    } on PlatformException {
      deviceId = 'Failed to get deviceId.';
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _deviceId = deviceId;
      print("deviceId->$_deviceId");
    });
    if(_deviceId !=null){
      API().addDeviceID(deviceID: _deviceId??'');
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin first Page'),
        ),
        body: Button(deviceID: _deviceId??'',)
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String deviceID;
  const Button({Key? key,
    required this.deviceID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text('Device ID : $deviceID'),
        ),
        ElevatedButton(onPressed: ()async{
          log('web id : ${await WebviewWindow.isWebviewAvailable()}');
          final webview = await WebviewWindow.create(
             configuration: CreateConfiguration(
  title: 'Letmegrab Ads'
)
          );

          webview.setBrightness(Brightness.dark);
          webview.launch("https://alphabusiness.letmegrab.in/");

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) =>  ExampleBrowser()),
          // );
        }, child: Text('Next'))

      ],
    );
  }
}




