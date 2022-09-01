import 'package:flutter/material.dart';

import '../../data/model/about_movie_model.dart';
import '../../data/model/detail_movie_model.dart';

class MovieDetailViewModel extends ChangeNotifier {
  final AboutMovieModel movie;

  MovieDetailViewModel(this.movie);

  String getPosterUrl(DetailMovie movie) {
    return 'https://image.tmdb.org/t/p/w500${movie.posterPath}';
  }

  String getMoviesName(DetailMovie movie) {
    return movie.title!;
  }
}