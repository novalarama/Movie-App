import 'package:get/get.dart';
import 'package:movie/app/providers/get_api.dart';

class HomeRepository extends GetConnect {
  @override
  final connect = GetApi();

  Future<Response> getNowPlaying() => connect.getDataFilm('movie/now_playing', 1);
  Future<Response> getPopular() => connect.getDataFilm('movie/popular', 1);
  Future<Response> getTopRated() => connect.getDataFilm('movie/top_rated', 1);
  Future<Response> getUpcoming() => connect.getDataFilm('movie/upcoming', 1);
  Future<Response> getGenre() => connect.getDataFilm('genre/movie/list', 1);
}
