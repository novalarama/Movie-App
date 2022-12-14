import 'package:get/get.dart';
import 'package:movie/app/providers/get_api.dart';

class HomeRepository extends GetConnect {
  final connect = GetApi();
  final api_key = '81728309a12b337c7334a06681733deb';

  Future<Response> getNowPlaying() => connect.getData(
        "movie/now_playing",
        {
          "api_key": api_key,
          "page": "1",
        },
      );
  Future<Response> getPopular() => connect.getData("movie/popular", {"api_key": api_key, "page": "1"});
  Future<Response> getTopRated() => connect.getData("movie/top_rated", {"api_key": api_key, "page": "1"});
  Future<Response> getUpcoming() => connect.getData("movie/upcoming", {"api_key": api_key, "page": "1"});
  Future<Response> getGenre() => connect.getData("genre/movie/list", {"api_key": api_key});
}
