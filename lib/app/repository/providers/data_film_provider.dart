import 'package:get/get.dart';

class DataFilmProvider extends GetConnect {
  @override
  
  Future<Response> getNowPlaying() => get('https://api.themoviedb.org/3/movie/now_playing?api_key=81728309a12b337c7334a06681733deb');
  Future<Response> getPopular() => get('https://api.themoviedb.org/3/movie/popular?api_key=81728309a12b337c7334a06681733deb');
  Future<Response> getTopRated() => get('https://api.themoviedb.org/3/movie/top_rated?api_key=81728309a12b337c7334a06681733deb');
  Future<Response> getUpcoming() => get('https://api.themoviedb.org/3/movie/upcoming?api_key=81728309a12b337c7334a06681733deb');
  Future<Response> getGenre() => get('https://api.themoviedb.org/3/genre/movie/list?api_key=81728309a12b337c7334a06681733deb');
  Future<Response> getDuration(var idFilm) => get('https://api.themoviedb.org/3/movie/${idFilm}?api_key=81728309a12b337c7334a06681733deb&language=en-US');
}
