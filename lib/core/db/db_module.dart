import 'package:flutter_modular/flutter_modular.dart';
import 'package:transport_occurrence/core/db/daos/ocurrence_dao.dart';
import 'package:transport_occurrence/core/db/db_connection.dart';

class DbModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<DatabaseConnection>(() => DatabaseConnection());
    i.addLazySingleton<OcurrenceDao>(
      () => OcurrenceDao(i.get<DatabaseConnection>()),
    );
    super.binds(i);
  }
}
