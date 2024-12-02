import 'package:odoo_tutorial/core/util/odoo_client/odoo_client.dart';

/*
Warnanya merah
Bannya ukuran 17
Kaca-nya dibuat 4
*/

/*
- Ada proses yang berjalan secara async
> HTTP Request
> Baca File
> Ambil lokasi user
*/

abstract class ProjectTaskService {
  String get model;
  Future<dynamic> getAll();
  Future<int> create({
    required Map<String, dynamic> data,
  });
  Future<bool> update({
    required int id,
    required Map<String, dynamic> data,
  });
  Future<bool> delete({
    required int id,
  });
}

class ProjectTaskServiceImpl implements ProjectTaskService {
  @override
  String get model => 'project.task';

  @override
  Future getAll({
    List<String>? fields,
    int? limit,
  }) async {
    var res = await client.callKw({
      'model': model,
      'method': 'search_read',
      'args': [],
      'kwargs': {
        'context': {'bin_size': true},
        'domain': [],
        'fields': fields,
        'limit': limit ?? 20,
      },
    });
    return res;
  }

  @override
  Future<int> create({required Map<String, dynamic> data}) async {
    var partnerId = await client.callKw({
      'model': model,
      'method': 'create',
      'args': [
        data,
      ],
      'kwargs': {},
    });
    return partnerId;
  }

  @override
  Future<bool> update(
      {required int id, required Map<String, dynamic> data}) async {
    var res = await client.callKw({
      'model': model,
      'method': 'write',
      'args': [
        id,
        data,
      ],
      'kwargs': {},
    });
    return res;
  }

  @override
  Future<bool> delete({required int id}) async {
    var res = await client.callKw({
      'model': model,
      'method': 'unlink',
      'args': [
        id,
      ],
      'kwargs': {},
    });
    return res;
  }
}
