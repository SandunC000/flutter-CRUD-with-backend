import 'package:flutter/material.dart';
import 'package:node/edit_view.dart';
import 'package:node/services/api.dart';

import 'model/product_model.dart';

class UpdateView extends StatelessWidget {
  const UpdateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: Api.getProduct(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditView(data: pdata.products![index],)));
                        },
                        icon: const Icon(Icons.edit),
                      ),
                    );
                  });
            }
          },
        ));
  }
}
