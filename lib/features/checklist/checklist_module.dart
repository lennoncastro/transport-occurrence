import 'package:flutter_modular/flutter_modular.dart';
import 'package:transport_occurrence/features/checklist/pages/checklist_page.dart';

class ChecklistModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => ChecklistPage());
  }
}
