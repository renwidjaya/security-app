import 'package:flutter/material.dart';
import 'package:security_app/repositories/model/articles_model.dart';
import 'package:security_app/repositories/service/articles_service.dart';
import 'package:security_app/utils/state.dart';

class ArticlesProvider extends ChangeNotifier {
  final ArticlesService articlesService;
  ArticlesProvider({required this.articlesService}) {
    getAllArticles();
  }

  ViewState _state = ViewState.initial;
  ViewState get state => _state;

  Articles? _articles = Articles(
    code: 0,
    message: '',
    data: [],
  );
  Articles? get articles => _articles;

  getAllArticles() async {
    _state = ViewState.loading;
    notifyListeners();
    try {
      _articles = await articlesService.getAllArticles();
      if (_articles!.data.isEmpty) {
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
