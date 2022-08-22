import 'package:get/get.dart';

class GetApi extends GetConnect {
  @override

  Future<Response> getDataFilm(var path, var page) => get('https://api.themoviedb.org/3/${path}?api_key=81728309a12b337c7334a06681733deb&page=$page');
  Future<Response> getDetailFilm(var path, var id) => get('https://api.themoviedb.org/3/${path}/${id}?api_key=81728309a12b337c7334a06681733deb&page');
}
