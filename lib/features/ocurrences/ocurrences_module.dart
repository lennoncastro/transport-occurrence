import 'package:flutter_modular/flutter_modular.dart';
import 'package:transport_occurrence/features/ocurrences/pages/manual_signature_page.dart';
import 'package:transport_occurrence/features/ocurrences/pages/ocurrence_page.dart';
import 'package:transport_occurrence/features/ocurrences/pages/signature_page.dart';

mixin OcurrencesModuleRoutes {
  static final root = '/';

  static final signature = '/signature';

  static final manualSignature = '/manual-signature';

  static final success = '/success';
}

class OcurrencesModule extends Module {
  static final String name = '/ocurrence';

  @override
  void routes(r) {
    r.child(OcurrencesModuleRoutes.root, child: (context) => OcurrencePage());
    r.child(
      OcurrencesModuleRoutes.signature,
      child: (context) => SignaturePage(),
      children: [
        ChildRoute(
          OcurrencesModuleRoutes.manualSignature,
          child: (context) => const ManualSignaturePage(),
        ),
      ],
    );
    r.child(
      OcurrencesModuleRoutes.success,
      child: (context) => OcurrencePage(),
    );
  }
}
