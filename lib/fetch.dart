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
            List<Product> pdata = snapshot.data;
            return ListView.builder(
                itemCount: pdata.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.storage),
                    title: Text("${pdata[index].name}"),
                    subtitle: Text("${pdata[index].desc}"),
                    trailing: Text("\S ${pdata[index].price}"),

                  );
                });
          }
        },
      ),
    );
  }
}
