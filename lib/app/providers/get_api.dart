import 'package:get/get.dart';

class GetApi extends GetConnect {
  @override
  final url = 'https://api.themoviedb.org/3/';
  final api_key = '81728309a12b337c7334a06681733deb';

  Future<Response> getDataFilm(var path, var currentPage) => get('https://api.themoviedb.org/3/${path}?api_key=81728309a12b337c7334a06681733deb&page=$currentPage');
  Future<Response> getDetailFilm(var path, var id) => get('https://api.themoviedb.org/3/${path}/${id}?api_key=81728309a12b337c7334a06681733deb&page');
  Future<Response> getGenreFilm(var path) => get('https://api.themoviedb.org/3/${path}?api_key=81728309a12b337c7334a06681733deb&page');

  Future<Response> getData(var endpoint, Map<String, dynamic> path) => get('${url}${endpoint}', query: path);
}
