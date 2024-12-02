// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:odoo_tutorial/module/partner/partner_form/partner_form.dart';
import 'package:odoo_tutorial/service/partner_service/partner_service.dart';

/*
StatefulWidget
- Kalau ada state yang akan berubah, dan ketika berubah kita ingin halamannya itu di rebuild ulang / atau halamannya ke refresh
- Kita butuh menjalankan kode pada lifecycle seperti initState
*/
class PartnerListView extends StatefulWidget {
  const PartnerListView({super.key});

  @override
  State<PartnerListView> createState() => _PartnerListViewState();
}

class _PartnerListViewState extends State<PartnerListView> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  bool loading = true;
  List<dynamic> items = [];
  Future getData() async {
    loading = true;
    setState(() {});

    items = await PartnerServiceImpl().getAll();

    loading = false;
    setState(() {});
  }

  Future delete(int id) async {
    await PartnerServiceImpl().delete(id: id);
  }

  @override
  Widget build(BuildContext context) {
    if (loading)
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Partner List"),
        actions: const [],
      ),
      body: ListView.builder(
        itemCount: items.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var item = items[index];
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (e) {
              delete(item["id"]);
              items.removeAt(index);
              setState(() {});
            },
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PartnerFormView(
                            current: item,
                          )),
                );
                await getData();
              },
              child: Card(
                child: ListTile(
                  title: Text(item["name"]),
                  subtitle: Text(item["type"]),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PartnerFormView()),
          );
          await getData();
        },
      ),
    );
  }
}
