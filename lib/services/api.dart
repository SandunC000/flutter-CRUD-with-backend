import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "http://192.168.54.79/api/";

  static addproduct(Map pdata) async {
    var url = Uri.parse("${baseUrl}add_product");

    try {
      final res = await http.post(url, body: pdata);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Failed response");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static getProduct() async {
    var url = Uri.parse("${baseUrl}get_product");

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
      } else {}
    } catch (e) {
      print(e.toString());
    }
  }
}
