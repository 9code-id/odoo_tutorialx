// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:odoo_tutorial/service/partner_service/partner_service.dart';

class PartnerFormView extends StatefulWidget {
  final Map<String, dynamic>? current;
  const PartnerFormView({
    super.key,
    this.current,
  });

  @override
  State<PartnerFormView> createState() => _PartnerFormViewState();
}

class _PartnerFormViewState extends State<PartnerFormView> {
  String? name;

  bool get isEdit => widget.current != null;

  @override
  void initState() {
    super.initState();
    if (isEdit) {
      name = widget.current!['name'];
    }
  }

  Future save() async {
    if (isEdit) {
      await PartnerServiceImpl().update(id: widget.current!['id'], data: {
        'name': name!,
      });
    } else {
      await PartnerServiceImpl().create(data: {
        'name': name!,
      });
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Partner"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                initialValue: name,
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: "What's your name?",
                ),
                onChanged: (value) {
                  name = value;
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => save(),
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
