import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class Api {
  static const baseUrl = "http://192.168.217.79/api/";

  static addproduct(Product pdata) async {
    var url = Uri.parse("${baseUrl}add_product");

    try {
      final res = await http.post(url, body: pdata.toJson());

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
    Products products;

    var url = Uri.parse("${baseUrl}get_product");

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        products = Products.fromJson(data);
        return products;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static updatePatch(Product data) async {
    var url = Uri.parse("${baseUrl}update/${data.id}");
    try {
      final res = await http.patch(url, body: jsonEncode(data.toJson()));
      if (res.statusCode == 200) {
        final updatedData = jsonDecode(res.body);
        print(updatedData);
        print("Request Payload: ${jsonEncode(data.toJson())}");
      } else {
        print("failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static deleteProduct(id) async {
    var url = Uri.parse("${baseUrl}delete/$id");
    
    final res = await http.post(url);
    if(res.statusCode == 204) {
      print(jsonDecode(res.body));
    } else {
      print('failed to delete');
    }
  }
}
