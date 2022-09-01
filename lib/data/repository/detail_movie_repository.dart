import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/detail_movie_model.dart';

class DetailApi {
  Future<DetailMovie> getMovieDetail(String query) async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/$query?api_key=a64533e7ece6c72731da47c9c8bc691f');

    http.Response response = await http.get(url);
    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    return DetailMovie.fromJson(json);
  }
}