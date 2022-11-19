import 'package:flutter/material.dart';
import 'package:security_app/repositories/model/articles_model.dart';
import 'package:security_app/repositories/service/articles_service.dart';
import 'package:security_app/utils/state.dart';

import '../repositories/model/activities_model.dart';
import '../repositories/service/activities_service.dart';

class ActivitiesProvider extends ChangeNotifier {
  final ActivitiesService activitiesService;
  ActivitiesProvider({required this.activitiesService}) {
    getAllActivities();
  }

  ViewState _state = ViewState.initial;
  ViewState get state => _state;

  Activities? _activities = Activities(
    code: 0,
    message: '',
    data: [],
  );
  Activities? get activities => _activities;

  getAllActivities() async {
    _state = ViewState.loading;
    notifyListeners();
    try {
      _activities = await activitiesService.getAllActivities();
      if (_activities!.data.isEmpty) {
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
