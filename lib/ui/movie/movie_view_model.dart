import 'package:flutter/material.dart';

import '../../data/model/about_movie_model.dart';
import '../../data/repository/movie_repository.dart';

class MovieViewModel extends ChangeNotifier {
  final _movieRepository = MovieRepository();
  List<AboutMovieModel> movieList = [];

  MovieViewModel() {
    getList();
    notifyListeners();
  }

  Future getList() async {
    movieList = await _movieRepository.getSearchResult();
    notifyListeners();
    movieList.forEach((element) {
      print(element);
    });
  }
}