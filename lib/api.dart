import 'package:http/http.dart' as http;

class API {
  addDeviceID({required String deviceID}) async {
    var url = Uri.parse('http://192.168.29.41:8000/api/deviceIdStore');
    var response = await http.post(url, body: {"device_id": deviceID});
    if(response.statusCode == 200){
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    print('Response status: ${response.statusCode}');

    print(await http.read(Uri.https('example.com', 'foobar.txt')));
  }
}
