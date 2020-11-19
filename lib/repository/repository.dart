import 'package:dio/dio.dart';
import 'package:lovemoviescubos/models/atores_response.dart';
import 'package:lovemoviescubos/models/response_filme.dart';

class FilmesRepository {
  final String apiKey = "";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();

  var getPopularUrl = "$mainUrl/movie/top_rated";
  var getMoviesUrl = "$mainUrl/discover/movie";
  var getPlayingUrl = "$mainUrl/movie/now_playing";
  var getGeneroUrl = "$mainUrl/genero/movie/list";
  var getPersonagensUrl = "$mainUrl/trending/person/week";

  Future<FilmeResponse> getFilmes() async {
    var params = {"api_key": apiKey, "language": "en-US", "page:": 1};

    try {
      Response response =
          await _dio.get(getPopularUrl, queryParameters: params);
      return FilmeResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception ocurred: $error stacktrace: $stacktrace");
      return FilmeResponse.withError("$error");
    }
  }

  Future<FilmeResponse> getPlayingFilmes() async {
    var params = {"api_key": apiKey, "language": "en-US", "page:": 1};

    try {
      Response response =
          await _dio.get(getPlayingUrl, queryParameters: params);
      return FilmeResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception ocurred: $error stacktrace: $stacktrace");
      return FilmeResponse.withError("$error");
    }
  }

  Future<FilmeResponse> getPopulares() async {
    var params = {"api_key": apiKey, "language": "en-US", "page:": 1};

    try {
      Response response =
          await _dio.get(getPopularUrl, queryParameters: params);
      return FilmeResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception ocurred: $error stacktrace: $stacktrace");
      return FilmeResponse.withError("$error");
    }
  }

  Future<AtoresResponse> getAtores() async {
    var params = {
      "api_key": apiKey,
    };

    try {
      Response response =
          await _dio.get(getPersonagensUrl, queryParameters: params);
      return AtoresResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception ocurred: $error stacktrace: $stacktrace");
      return AtoresResponse.withError("$error");
    }
  }

  Future<FilmeResponse> getFilmesPorGenero(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page:": 1,
      "with_genres": id
    };

    try {
      Response response = await _dio.get(getGeneroUrl, queryParameters: params);
      return FilmeResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception ocurred: $error stacktrace: $stacktrace");
      return FilmeResponse.withError("$error");
    }
  }
}