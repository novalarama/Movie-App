import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/app/modules/category/repositories/category_repository.dart';
import 'package:movie/app/models/film_model.dart';
import 'package:movie/app/models/genre_model.dart';

class CategoryController extends GetxController with StateMixin {
  final CategoryRepository categoryRepository;
  CategoryController({required this.categoryRepository});

  //get title and path
  String title = Get.arguments[0];
  String path = Get.arguments[1];

  // prepare for film data
  final listFilm = <Results>[].obs;

  //prepare for genre data
  final listGenre = <AllGenres>[].obs;

  // variable for page
  var currentPage = 1;
  var nextPage = true;

  // final refresh
  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getDataGenre();
    getAllFilm(path, currentPage);
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.offset) {
        currentPage++;
        return getAllFilm(path, currentPage);
      }
    });
  }

  void dispose() {
    super.dispose();
    scrollController.dispose();
    listFilm.remove(value);
  }

  // function for fetch genreIds data with genre film
  void getDataGenre() async {
    await categoryRepository.getGenre().then((result) {
      listGenre.value = Genre.fromJson(result.body).genres!;
      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  // function for replace genreids with genre names
  void replaceGenreIdsWithGenreNames(List<Results> results) async {
    listGenre.forEach((data) {
      results.forEach((value) {
        for (var i = 0; i < value.genreIds!.length; i++) {
          if (data.id == value.genreIds![i]) {
            value.genreIds![i] = data.name;
          }
        }
      });
    });
  }

  // fetch data film from all pages
  void getAllFilm(String path, var currentPage) async {
    await categoryRepository.getFilm(path, currentPage).then((result) {
      nextPage = true;
      listFilm.addAll(FilmModel.fromJson(result.body).results!);
      replaceGenreIdsWithGenreNames(listFilm);
      change(null, status: RxStatus.success());
    }, onError: (err) {
      nextPage = false;
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
