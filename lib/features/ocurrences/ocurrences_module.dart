import 'package:flutter_modular/flutter_modular.dart';
import 'package:transport_occurrence/features/ocurrences/pages/manual_signature_page.dart';
import 'package:transport_occurrence/features/ocurrences/pages/ocurrence_page.dart';
import 'package:transport_occurrence/features/ocurrences/pages/signature_page.dart';

class OcurrencesModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => OcurrencePage());
    r.child(
      '/signature',
      child: (context) => SignaturePage(),
      children: [
        ChildRoute(
          '/manual-signature',
          child: (context) => const ManualSignaturePage(),
        ),
      ],
    );
    r.child('/success', child: (context) => OcurrencePage());
  }
}
