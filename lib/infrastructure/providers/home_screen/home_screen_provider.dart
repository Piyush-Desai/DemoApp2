import 'package:flutter/cupertino.dart';

class HomeScreenProvider with ChangeNotifier{

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int value){
    _selectedIndex = value;
    notifyListeners();
  }

}