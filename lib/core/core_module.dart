import 'package:flutter_modular/flutter_modular.dart';
import 'package:transport_occurrence/core/camera/camera_provider.dart';
import 'package:transport_occurrence/core/db/db_module.dart';
import 'package:transport_occurrence/core/navigation/navigator_service.dart';
import 'package:transport_occurrence/core/signature/signature_provider.dart';

class CoreModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<NavigationService>(NavigationServiceImpl.new);
    i.addLazySingleton<CameraProvider>(CameraProviderImpl.new);
    i.addLazySingleton<SignatureProvider>(SignatureProviderImpl.new);
    super.binds(i);
  }

  @override
  List<Module> get imports => [DbModule()];
}
