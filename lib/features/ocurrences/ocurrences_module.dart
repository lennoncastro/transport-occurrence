import 'package:flutter_modular/flutter_modular.dart';
import 'package:transport_occurrence/core/camera/camera_provider.dart';
import 'package:transport_occurrence/core/navigation/navigator_service.dart';
import 'package:transport_occurrence/core/signature/signature_provider.dart';
import 'package:transport_occurrence/data/data_module.dart';
import 'package:transport_occurrence/data/repositories/ocurrence_repository.dart';
import 'package:transport_occurrence/features/ocurrences/pages/manual_signature_page.dart';
import 'package:transport_occurrence/features/ocurrences/pages/ocurrence_plate_page.dart';
import 'package:transport_occurrence/features/ocurrences/pages/signature_page.dart';
import 'package:transport_occurrence/features/ocurrences/pages/success_page.dart';
import 'package:transport_occurrence/features/ocurrences/stores/manual_signature_store.dart';
import 'package:transport_occurrence/features/ocurrences/stores/ocurrence_plate_store.dart';
import 'package:transport_occurrence/features/ocurrences/stores/ocurrence_store.dart';
import 'package:transport_occurrence/features/ocurrences/stores/signature_store.dart';
import 'package:transport_occurrence/features/ocurrences/stores/success_store.dart';
import 'package:transport_occurrence/features/ocurrences/viewmodels/manual_signature_viewmodel.dart';
import 'package:transport_occurrence/features/ocurrences/viewmodels/ocurrence_plate_viewmodel.dart';
import 'package:transport_occurrence/features/ocurrences/viewmodels/signature_viewmodel.dart';
import 'package:transport_occurrence/features/ocurrences/viewmodels/success_viewmodel.dart';

mixin OcurrencesModuleRoutes {
  static final root = '/';

  static final signature = '/signature';

  static final manualSignature = '/manual-signature';

  static final success = '/success';
}

class OcurrencesModule extends Module {
  static final String name = '/ocurrence';

  @override
  void binds(Injector i) {
    i.addLazySingleton<OcurrenceStore>(() => OcurrenceStore());
    i.addLazySingleton<OcurrencePlateStore>(
      () => OcurrencePlateStore(i.get<OcurrenceStore>()),
    );
    i.addLazySingleton<SignatureStore>(
      () => SignatureStore(i.get<OcurrenceStore>()),
    );
    i.addLazySingleton<ManualSignatureStore>(
      () => ManualSignatureStore(i.get<OcurrenceStore>()),
    );
    i.addLazySingleton<SuccessStore>(
      () => SuccessStore(i.get<OcurrenceStore>()),
    );
    i.add<OcurrencePlateViewModel>(
      () => OcurrencePlateViewModel(
        i.get<OcurrencePlateStore>(),
        i.get<OcurrenceStore>(),
        Modular.get<NavigationService>(),
        Modular.get<CameraProvider>(),
      ),
    );
    i.add<SignatureViewModel>(
      () => SignatureViewModel(
        i.get<OcurrenceStore>(),
        i.get<SignatureStore>(),
        Modular.get<NavigationService>(),
        Modular.get<OcurrenceRepository>(),
      ),
    );
    i.add<ManualSignatureViewModel>(
      () => ManualSignatureViewModel(
        i.get<OcurrenceStore>(),
        i.get<ManualSignatureStore>(),
        Modular.get<NavigationService>(),
        Modular.get<SignatureProvider>(),
      ),
    );
    i.add<SuccessViewModel>(
      () => SuccessViewModel(Modular.get<NavigationService>()),
    );
    super.binds(i);
  }

  @override
  void routes(r) {
    r.child(
      OcurrencesModuleRoutes.root,
      child: (context) => OcurrencePlatePage(),
    );
    r.child(
      OcurrencesModuleRoutes.signature,
      child: (context) => SignaturePage(),
    );
    r.child(
      OcurrencesModuleRoutes.manualSignature,
      child: (context) => const ManualSignaturePage(),
    );
    r.child(OcurrencesModuleRoutes.success, child: (context) => SuccessPage());
  }

  @override
  List<Module> get imports => [DataModule()];
}
