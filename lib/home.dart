import 'package:flutter/material.dart';
import 'package:node/create.dart';

import 'fetch.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateData(),
                    ));
              },
              child: const Text("CREATE")),
          ElevatedButton(onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => const FetchData()));}, child: const Text("READ")),
          ElevatedButton(onPressed: () {}, child: const Text("UPDATE")),
          ElevatedButton(onPressed: () {}, child: const Text("DELETE")),
        ],
      ),
    );
  }
}
