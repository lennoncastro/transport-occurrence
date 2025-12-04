import 'package:transport_occurrence/core/navigation/navigation.dart';

class SuccessViewModel {
  SuccessViewModel(this._navigationService);

  final NavigationService _navigationService;

  void backToHome() {
    _navigationService.backToHome();
  }
}
