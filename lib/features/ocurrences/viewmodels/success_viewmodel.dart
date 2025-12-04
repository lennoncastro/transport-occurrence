import 'package:transport_occurrence/core/navigation/navigator_service.dart';

class SuccessViewModel {
  SuccessViewModel(this._navigationService);

  final NavigationService _navigationService;

  void backToHome() {
    _navigationService.backToHome();
  }
}
