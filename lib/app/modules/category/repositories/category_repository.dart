import 'package:get/get.dart';
import 'package:movie/app/providers/get_api.dart';

class CategoryRepository extends GetConnect {
  final connect = GetApi();

  Future<Response> getFilm(String path, var currentPage) => connect.getDataFilm('movie/$path', currentPage);
  Future<Response> getGenre() => connect.getGenreFilm('genre/movie/list');
}
