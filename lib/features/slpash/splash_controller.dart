import 'package:financy_app/services/secure_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:financy_app/features/slpash/splash_state.dart';
import 'package:flutter/material.dart';

class SplashController extends ChangeNotifier {

  final SecureStorage _service;

  SplashController(this._service);

  SplashState _state = SplashInitialState();

  SplashState get state => _state;

  void _changeState(SplashState newState) {
    _state = newState;
    notifyListeners();
  }

  void isUserLogged() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await _service.readOne(key: 'CURRENT_USER');
    if(result != null) {
      _changeState(SplashSuccessState());
    } else {
      _changeState(SplashErrorState());
    }
  }
}
