import 'dart:convert';

import '../model/search_movie_model.dart';
import 'package:http/http.dart' as http;

class SearchApi {
  Future<List<SearchMovie>> getSearchMovieList(String query) async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/search/movie?language=ko-KR&api_key=a64533e7ece6c72731da47c9c8bc691f&query=$query');

    http.Response response = await http.get(url);
    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);

    Iterable result = json['results'];
    return result.map((e) => SearchMovie.fromJson(e)).toList();
  }
}