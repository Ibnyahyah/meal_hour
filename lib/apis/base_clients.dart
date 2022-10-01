import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://dead-rose-elk-wig.cyclic.app';

class BaseClients {
  final client = http.Client();

  Future<dynamic> post(String api, dynamic object) async {
    var _payload = json.decode(object);
    var url = Uri.parse(baseUrl + api);
    client.post(url, body: _payload);
  }

  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {}
  }
}
