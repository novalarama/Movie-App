import 'package:get/get.dart';
import 'package:movie/app/models/FilmModel.dart';
import 'package:movie/app/repository/providers/data_film_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:movie/app/models/genre_model.dart';
import 'dart:convert';

class HomeController extends GetxController with StateMixin<Map> {
  final DataFilmProvider dataFilmProvider;
  HomeController({required this.dataFilmProvider});

  final listNowPlaying = <Results>[].obs;
  final listPopular = <Results>[].obs;
  final listTopRated = <Results>[].obs;
  final listUpcoming = <Results>[].obs;

  List<dynamic> listGenre = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNowPlayingFilm();
    fetchPopularFilm();
    fetchTopRatedFilm();
    fetchUpcomingFilm();
    getDataGenre();
  }

  void fetchNowPlayingFilm() {
    dataFilmProvider.getNowPlaying().then((result) {
      listNowPlaying.value = FilmModel.fromJson(result.body).results!;
      print(listPopular);
      // if (listGenre[0]['name']) {

      // } // change type string to object
      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void fetchPopularFilm() {
    dataFilmProvider.getPopular().then((result) {
      listPopular.value = FilmModel.fromJson(result.body).results!; // change type string to object
      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void fetchTopRatedFilm() {
    dataFilmProvider.getTopRated().then((result) {
      listTopRated.value = FilmModel.fromJson(result.body).results!; // change type string to object
      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void fetchUpcomingFilm() {
    dataFilmProvider.getUpcoming().then((result) {
      listUpcoming.value = FilmModel.fromJson(result.body).results!; // change type string to object
      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  getDataGenre() async {
    Future<String> data = rootBundle.loadString('assets/models/genre.json');
    String allGenre = await data;
    List<dynamic> dataGenre = json.decode(allGenre)['genres'];

    for (var e in dataGenre) {
      listGenre.add(e);
    }
  }

  // void changeGenre(int? idGenre) async {

  //   if(idGenre == ){
  //     results = allCity;
  //   }else {
  //     results = allCity
  //               .where((element) => element['name']
  //                 .toString()
  //                 .toLowerCase()
  //                 .contains(cityName.toLowerCase()))
  //               .toList();
  //   }

  //   foundCity = results;
  //   update();
  // }
}
