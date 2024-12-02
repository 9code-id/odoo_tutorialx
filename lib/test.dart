import 'dart:io';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:odoo_tutorial/env.dart';

main() async {
  final client = OdooClient(Env.host);
  try {
    await client.authenticate(Env.database, Env.username, Env.password);
    final res = await client.callRPC('/web/session/modules', 'call', {});
    // print('Installed modules: \n$res');
  } on OdooException catch (e) {
    print(e);
    client.close();
    exit(-1);
  }

  var res = await client.callKw({
    'model': 'res.partner',
    'method': 'search_read',
    'args': [],
    'kwargs': {
      'context': {'bin_size': true},
      'domain': [],
      'fields': ['id', 'name', 'email'],
      'limit': 80,
    },
  });
  print(res);

  // var partnerId = await client.callKw({
  //   'model': 'res.partner',
  //   'method': 'create',
  //   'args': [
  //     {
  //       'name': 'James Wood',
  //     },
  //   ],
  //   'kwargs': {},
  // });
  // print("partnerId: $partnerId");

  // Update partner by id
  // var res = await client.callKw({
  //   'model': 'res.partner',
  //   'method': 'write',
  //   'args': [
  //     7,
  //     {
  //       'name': 'Allan Wood',
  //     },
  //   ],
  //   'kwargs': {},
  // });
  // print(res);

  // Delete partner by id
  // var res = await client.callKw({
  //   'model': 'res.partner',
  //   'method': 'unlink',
  //   'args': [
  //     8,
  //   ],
  //   'kwargs': {},
  // });
  // print(res);

  client.close();
}


// MVC+S

// Service


// Clean Architecture
// data
//   remote
//     parnter_remote_data_source