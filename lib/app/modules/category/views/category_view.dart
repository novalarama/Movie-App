import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/category_controller.dart';
import 'package:movie/app/routes/app_pages.dart';
import 'package:movie/app/models/film_model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:movie/app/data/constants/assetsDesign.dart';

class CategoryView extends GetView<CategoryController> {
  final Map<String, String> title = Get.arguments[0];
  final RxList<Results> listFilm = Get.arguments[1];
  @override
  Widget build(BuildContext context) {
    if (listFilm != null || title != null) {
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
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.DETAIL, arguments: film[index].id);
                      },
                      child: VxBox(
                          child: VxInlineBlock(children: <Widget>[
                        VxContinuousRectangle(
                          width: 100,
                          height: 150,
                          radius: 16,
                          backgroundImage: DecorationImage(image: NetworkImage('http://image.tmdb.org/t/p/w500${film[index].posterPath}'), fit: BoxFit.cover),
                        ).paddingOnly(
                          right: 15,
                          left: 20,
                        ),
                        Expanded(
                            child: VStack([
                          '${film[index].title}'.text.color(textColor).ellipsis.overflow(TextOverflow.visible).bold.size(24).lineHeight(1).make(),
                          '${film[index].releaseDate}'.text.color(buttonTextColor).size(11).make(),
                          film[index].genreIds!.join(", ").text.color(textColor).size(8).ellipsis.overflow(TextOverflow.ellipsis).make(),
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
                        ])),
                        Icon(
                          Icons.bookmark_add_outlined,
                          color: buttonTextColor,
                        ).paddingOnly(right: 8)
                      ])).height(175).color(secondColor).make(),
                    );
                },
              )
            ]),
          ));
    } else {
      return Center(
        child: ElevatedButton.icon(onPressed: () => Get.toNamed(Routes.HOME), icon: Icon(Icons.arrow_back), label: 'Kembali'.text.make()),
      );
    }
  }
}
