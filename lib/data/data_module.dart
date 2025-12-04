import 'package:flutter_modular/flutter_modular.dart';
import 'package:transport_occurrence/core/core_module.dart';
import 'package:transport_occurrence/core/db/daos/ocurrence_dao.dart';
import 'package:transport_occurrence/core/network/network.dart';
import 'package:transport_occurrence/data/repositories/ocurrence_repository.dart';
import 'package:transport_occurrence/data/services/ocurrence_service.dart';

class DataModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<OcurrenceRepository>(
      () => OcurrenceRepositoryImpl(i.get<OcurrenceDao>()),
    );
    i.addLazySingleton<OcurrenceService>(
      () => OcurrenceServiceImpl(i.get<HttpClient>()),
    );
    super.binds(i);
  }

  @override
  List<Module> get imports => [CoreModule()];
}
