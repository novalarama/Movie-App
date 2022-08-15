import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/category_controller.dart';
import 'package:movie/app/routes/app_pages.dart';
import 'package:movie/app/models/FilmModel.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:movie/app/data/constants/assetsDesign.dart';

class CategoryView extends GetView<CategoryController> {
  final Map<String, String> title = Get.arguments[0];
  final RxList<Results> listFilm = Get.arguments[1];
  @override
  Widget build(BuildContext context) {
    if (listFilm != null) {
      return Scaffold(
          backgroundColor: mainColor,
          appBar: AppBar(
            backgroundColor: secondColor,
            title: '${title['title']}'.text.bold.start.make(),
            centerTitle: true,
          ),
          body: VxScrollVertical(
            child: VStack([
              ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: listFilm.isNotEmpty ? listFilm.length : 0,
                itemBuilder: (context, index) {
                  var film = listFilm;
                  if (film != null) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.DETAIL, arguments: film[index]);
                      },
                      child: VxBox(
                          child: HStack([
                        VxContinuousRectangle(
                          width: 100,
                          height: 150,
                          radius: 16,
                          backgroundImage: DecorationImage(image: NetworkImage('http://image.tmdb.org/t/p/w500${film[index].posterPath}'), fit: BoxFit.cover),
                        ).paddingOnly(
                          right: 15,
                          left: 20,
                        ),
                        VStack([
                          Expanded(
                            child: VStack([
                          '${film[index].title}'.text.color(textColor).ellipsis.bold.size(18).make(),
                          '${film[index].releaseDate}'.text.color(buttonTextColor).size(11).make(),
                          film[index].genreIds!.join(", ").text.color(textColor).size(8).ellipsis.make(),
                          HStack([
                            VxRating(
                              onRatingUpdate: (val) {},
                              value: film[index].voteAverage! / 2,
                              count: 5,
                              maxRating: 5,
                              normalColor: Colors.grey.shade500,
                              selectionColor: Colors.yellow,
                            ),
                            " ${listFilm[index].voteAverage}".text.color(textColor).size(10).make(),
                            " (${listFilm[index].voteCount})".text.color(textColor).size(10).make(),
                          ])
                        ]).paddingOnly(top: 10)
                        ),
                        ])
                      ])).height(175).color(secondColor).make(),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              )
            ]),
          ));
    } else {
      return CircularProgressIndicator();
    }
  }
}
