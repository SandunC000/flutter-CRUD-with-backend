import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/product_model.dart';

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
    List<Product> products = [];

    var url = Uri.parse("${baseUrl}get_product");

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        data['products'].forEach((value) => {
              products.add(Product(
                id: value['id'].toString(),
                name: value['pname'],
                desc: value['pdesc'],
                price: value['pprice'],
              ))
            });

        return products;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static updatePut(id, body) async {
    var url = Uri.parse("${baseUrl}update/$id");
    try {
      final res = await http.put(url, body: body);
      if (res.statusCode == 200) {
        print(jsonDecode(res.body));
      } else {
        print("failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
