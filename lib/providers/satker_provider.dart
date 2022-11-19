import 'package:flutter/material.dart';
import 'package:security_app/repositories/model/satker_model.dart';
import 'package:security_app/repositories/service/satker_service.dart';
import 'package:security_app/utils/state.dart';

class SatkersProvider extends ChangeNotifier {
  final SatkerService satkerService;
  SatkersProvider({required this.satkerService});

  ViewState _state = ViewState.initial;
  ViewState get state => _state;

  Satkers? _satkers = Satkers(
    code: 0,
    message: '',
    data: [],
  );
  Satkers? get satkers => _satkers;

  getSatker({required int id}) async {
    _state = ViewState.loading;
    notifyListeners();
    try {
      _satkers = await satkerService.getSatker(id);
      if (_satkers!.data.isEmpty) {
        _state = ViewState.noData;
        notifyListeners();
      } else {
        _state = ViewState.hasData;
        notifyListeners();
      }
    } catch (e) {
      _state = ViewState.error;
      notifyListeners();
    }
  }
}
