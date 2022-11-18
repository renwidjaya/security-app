import 'package:flutter/material.dart';
import 'package:security_app/repositories/model/login_model.dart';
import 'package:security_app/repositories/service/login_services.dart';
import 'package:security_app/utils/state.dart';

class LoginProvider extends ChangeNotifier {
  final LoginServices loginServices;
  LoginProvider({required this.loginServices});

  ViewState _state = ViewState.loading;
  ViewState get state => _state;

  LoginModel? _loginData;
  LoginModel? get loginData => _loginData;

  String _message = '';
  String get message => _message;

  login({required String password}) async {
    _state = ViewState.hasData;
    final result = await loginServices.login(password);
    _loginData = result;
    notifyListeners();

    // _state = ViewState.loading;
    // notifyListeners();
    // try {
    //   _state = ViewState.hasData;
    //   final result = await loginServices.login(password);
    //   print("ini result lo $result");
    //   _loginData = result;
    //   notifyListeners();
    // } catch (e) {
    //   _state = ViewState.error;
    //   _message = "User tidak tersedia pada sistem";
    //   notifyListeners();
    // }
  }
}
