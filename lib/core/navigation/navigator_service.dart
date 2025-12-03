import 'package:flutter_modular/flutter_modular.dart';
import 'package:transport_occurrence/features/checklist/checklist_module.dart';
import 'package:transport_occurrence/features/ocurrences/ocurrences_module.dart';

abstract class NavigationService {
  void goToOccurrences();

  void goToSignature();

  void goToManualSignature();

  void goToOccurrenceSuccess();

  void backToHome();

  void back<T extends Object?>([T? result]);
}

class NavigationServiceImpl implements NavigationService {
  @override
  void goToOccurrences() {
    Modular.to.pushNamed(OcurrencesModule.name + OcurrencesModuleRoutes.root);
  }

  @override
  void goToSignature() {
    Modular.to.pushNamed(
      OcurrencesModule.name + OcurrencesModuleRoutes.signature,
    );
  }

  @override
  void goToManualSignature() {
    Modular.to.pushNamed(
      OcurrencesModule.name +
          OcurrencesModuleRoutes.signature +
          OcurrencesModuleRoutes.manualSignature,
    );
  }

  @override
  void goToOccurrenceSuccess() {
    Modular.to.pushNamed(
      OcurrencesModule.name + OcurrencesModuleRoutes.success,
    );
  }

  @override
  void backToHome() {
    Modular.to.popUntil(
      (route) => route.settings.name == ChecklistModuleRoutes.root,
    );
  }

  @override
  void back<T extends Object?>([T? result]) {
    Modular.to.pop(result);
  }
}
