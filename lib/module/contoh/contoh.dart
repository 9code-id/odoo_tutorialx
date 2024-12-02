// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ContohView extends StatefulWidget {
  const ContohView({super.key});

  @override
  State<ContohView> createState() => _ContohViewState();
}

class _ContohViewState extends State<ContohView> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "$counter",
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  counter++;
                  print("counter: $counter");
                  setState(() {});
                  // mrefresh halaman
                  // rebuild halaman
                },
                child: const Text("Increment"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
