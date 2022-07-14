import 'package:flutter/cupertino.dart';

class BaseViewModel extends ChangeNotifier {
  bool loading = false;
  setLoading() {
    loading = !loading;
    notifyListeners();
  }
}
