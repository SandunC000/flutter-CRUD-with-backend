import 'package:flutter/material.dart';
import 'package:node/services/api.dart';

import 'model/product_model.dart';

class EditView extends StatefulWidget {
  final Product data;

  const EditView({super.key, required this.data});

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.data.name.toString();
    priceController.text = widget.data.price.toString();
    descController.text = widget.data.desc.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "name"),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(hintText: "desc"),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(hintText: "price"),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  Product newProduct = Product(
                      id: widget.data.id,
                      name: nameController.text,
                      price: priceController.text,
                      desc: descController.text);

                  Api.updatePatch(newProduct);
                },
                child: const Text("Update"))
          ],
        ),
      ),
    );
  }
}
