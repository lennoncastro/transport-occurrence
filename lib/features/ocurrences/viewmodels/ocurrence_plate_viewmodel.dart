import 'package:transport_occurrence/core/camera/camera_provider.dart';
import 'package:transport_occurrence/core/navigation/navigator_service.dart';
import 'package:transport_occurrence/features/ocurrences/stores/ocurrence_plate_store.dart';
import 'package:transport_occurrence/features/ocurrences/stores/ocurrence_store.dart';

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
