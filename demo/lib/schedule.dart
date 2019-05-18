import 'dart:io';
import 'package:flutter/foundation.dart';

class MySchedule with ChangeNotifier{

  bool _stateManegment = false;
  File _image;

  File get archivo => _image;
  set archivo(File nuevo){
    _image = nuevo;
    notifyListeners();
  }

  bool get estado => _stateManegment;
  set estado(bool nuevoEstado){
    _stateManegment = nuevoEstado;
    notifyListeners();
  }
}