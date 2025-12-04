import 'package:transport_occurrence/core/camera/camera_provider.dart';
import 'package:transport_occurrence/core/navigation/navigator_service.dart';
import 'package:transport_occurrence/features/ocurrences/stores/ocurrence_plate_store.dart';

class OcurrencePlateViewModel {
  OcurrencePlateViewModel(
    this._store,
    this._navigationService,
    this._cameraProvider,
  );

  final OcurrencePlateStore _store;

  final NavigationService _navigationService;

  final CameraProvider _cameraProvider;

  void submit() {
    if (!_store.isButtonEnabled) return;
    _navigationService.goToSignature();
  }

  void takePhoto() async {
    try {
      final path = await _cameraProvider.takePhoto();
      if (path == null) return;
      _store.setPhotoPath(path);
    } catch (e) {
      // do nothing by now
    }
  }
}
