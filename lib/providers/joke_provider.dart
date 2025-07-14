import 'package:flutter/material.dart';
import 'package:joke_app/model/joke_model.dart';
import 'package:joke_app/services/api_services.dart';
import 'package:joke_app/static/jokes_category_data.dart';

class JokeProvider extends ChangeNotifier {
  String _currentCategory = JokesCategoryData.categoryData[0]['name'];
  String get currentCategory => _currentCategory;

  List<Joke> _jokes = [];
  List<Joke> get jokes => _jokes;

  /// Set new category and await joke fetching
  Future<void> setCurrentCategory(String categoryName) async {
    _currentCategory = categoryName;
    await getJokes(); // Now awaiting this Future
    notifyListeners();
  }

  /// Fetch jokes and return as Future
  Future<void> getJokes() async {
    _jokes = await ApiServices().getJokesByCategory(_currentCategory);
    notifyListeners();
  }
}
