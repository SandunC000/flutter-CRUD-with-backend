import 'package:flutter/material.dart';
import 'package:node/services/api.dart';

import 'model/product_model.dart';

class FetchData extends StatelessWidget {
  const FetchData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Api.getProduct(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            Products pdata = snapshot.data;
            return ListView.builder(
                itemCount: pdata.products?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.storage),
                    title: Text("${pdata.products?[index].name}"),
                    subtitle: Text("${pdata.products?[index].desc}"),
                    trailing: Text("\$ ${pdata.products?[index].price}"),

                  );
                });
          }
        },
      ),
    );
  }
}
