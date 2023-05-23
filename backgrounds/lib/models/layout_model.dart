import 'package:flutter/material.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = Container();

  Widget get currentPage => _currentPage;

  set currentPage(Widget page) {
    _currentPage = page;
    notifyListeners();
  }
}
