import 'package:flutter_modular/flutter_modular.dart';
import 'package:transport_occurrence/features/checklist/checklist_module.dart';
import 'package:transport_occurrence/features/ocurrences/ocurrences_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module('/', module: ChecklistModule());
    r.module(OcurrencesModule.name, module: OcurrencesModule());
  }
}
