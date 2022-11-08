import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url, this.s, this.q);

  final String url;
  final String s;
  final Map<String, String> q;
  Future getDate() async {
    try {
      http.Response response = await http.get(Uri.https(url, s, q));
      if (response.statusCode == 200) {
        print(response.body);
        return jsonEncode(response.body);
      }else {
        print(response.statusCode);
        print(response.body);
      }
    }catch (e) {
      print(e);
    }

  }
}