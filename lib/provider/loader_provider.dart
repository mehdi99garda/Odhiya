import 'package:flutter/foundation.dart';

class LoderProvider with ChangeNotifier {
  bool _isApiCallProcess = false;
  bool get isApiCallProcess => _isApiCallProcess;

  setLoadingStatus(bool status) {
    _isApiCallProcess = status;
    notifyListeners();
  }
}
