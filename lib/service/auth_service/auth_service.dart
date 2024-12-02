import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:odoo_tutorial/core/util/odoo_client/odoo_client.dart';
import 'package:odoo_tutorial/env.dart';

abstract class AuthService {
  Future<bool> login({
    required String username,
    required String password,
  });
  Future<void> logout();
}

class AuthServiceImpl implements AuthService {
  @override
  Future<bool> login({
    required String username,
    required String password,
  }) async {
    try {
      await client.authenticate(Env.database, username, password);
      final res = await client.callRPC('/web/session/modules', 'call', {});
      return true;
    } on OdooException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> logout() async {
    await client.destroySession();
  }
}
