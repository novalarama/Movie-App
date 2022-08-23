import 'package:get/get.dart';
import 'package:movie/app/providers/get_api.dart';

class CategoryRepository extends GetConnect {
  final connect = GetApi();
  final api_key = GetApi().api_key;

  Future<Response> getFilm(String path, var currentPage) => connect.getData('movie/$path', {'api_key':api_key, 'page':currentPage.toString()});
  Future<Response> getGenre() => connect.getData('genre/movie/list', {'api_key':api_key});
}
