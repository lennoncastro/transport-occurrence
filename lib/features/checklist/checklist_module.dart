import 'package:flutter_modular/flutter_modular.dart';
import 'package:transport_occurrence/features/checklist/checklist.dart';
import 'package:transport_occurrence/features/ocurrences/ocurrences_module.dart';

mixin ChecklistModuleRoutes {
  static const root = '/';
}

class ChecklistModule extends Module {
  @override
  void routes(r) {
    r.child(ChecklistModuleRoutes.root, child: (context) => ChecklistPage());
    r.module(OcurrencesModule.name, module: OcurrencesModule());
  }
}
