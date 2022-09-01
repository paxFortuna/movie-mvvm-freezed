import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/about_movie_model.dart';

class MovieApi {
  Future<List<AboutMovieModel>> getMovieList() async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1');

    http.Response response = await http.get(url);
    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    Iterable result = json['results'];
    return result.map((e) => AboutMovieModel.fromJson(e)).toList();
  }
}