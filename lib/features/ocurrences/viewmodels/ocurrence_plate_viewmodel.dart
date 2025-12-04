import 'package:transport_occurrence/core/camera/camera.dart';
import 'package:transport_occurrence/core/navigation/navigation.dart';
import 'package:transport_occurrence/features/ocurrences/ocurrences.dart';

class OcurrencePlateViewModel {
  OcurrencePlateViewModel(
    this._ocurrencePlateStore,
    this._ocurrenceStore,
    this._navigationService,
    this._cameraProvider,
  );

  final OcurrencePlateStore _ocurrencePlateStore;

  final OcurrenceStore _ocurrenceStore;

  final NavigationService _navigationService;

  final CameraProvider _cameraProvider;

  void submit() {
    if (!_ocurrencePlateStore.isButtonEnabled) return;
    _ocurrenceStore
      ..setPlate(_ocurrencePlateStore.plate)
      ..setPhotoPath(_ocurrencePlateStore.photoPath);
    _navigationService.goToSignature();
  }

  void takePhoto() async {
    try {
      final path = await _cameraProvider.takePhoto();
      if (path == null) return;
      _ocurrencePlateStore.setPhotoPath(path);
    } catch (e) {
      // do nothing by now
    }
  }
}
