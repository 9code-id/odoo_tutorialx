import 'dart:convert';
import 'dart:io';

import 'package:odoo_tutorial/service/auth_service/auth_service.dart';
import 'package:odoo_tutorial/service/partner_service/partner_service.dart';

void main() async {
  var isSuccess = await AuthServiceImpl().login(
    username: "demo21@mailinator.com",
    password: "OdooPassword123",
  );

  print(isSuccess ? "Login berhasil" : "Login gagal");

  var res = await PartnerServiceImpl().getAll(
    fields: ['id', 'name', 'email', 'message_follower_ids'],
    limit: 5,
  );

  // File("result.json").writeAsStringSync(jsonEncode(res));

  print("getAll: $res");

  // var partnerId = await PartnerServiceImpl().create(data: {
  //   'name': 'James Wood',
  // });
  // print("partnerId: $partnerId");

  // var isUpdateSuccess = await PartnerServiceImpl().update(id: partnerId, data: {
  //   'name': 'John Doe',
  // });
  // print("isUpdateSuccess: $isUpdateSuccess");

  // var isDeleteSuccess = await PartnerServiceImpl().delete(id: partnerId);
  // print("isDeleteSuccess: $isDeleteSuccess");
}
