import 'package:flutter/material.dart';
import 'package:node/services/api.dart';

class CreateData extends StatefulWidget {
  const CreateData({super.key});

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: "name",
            ),
          ),
          TextField(
            controller: priceController,
            decoration: const InputDecoration(
              hintText: "price",
            ),
          ),
          TextField(
            controller: descController,
            decoration: const InputDecoration(
              hintText: "desc",
            ),
          ),
          ElevatedButton(onPressed: () {
            var data = {
              "pname" :nameController.text,
              "pprice" : priceController.text,
              "pdesc" : descController.text,
            };

            Api.addproduct(data);
          }, child: const Text("Create Data")),
        ],
      ),
    );
  }
}
