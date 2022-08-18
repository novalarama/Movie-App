import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/app/routes/app_pages.dart';
import 'package:movie/app/models/film_model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:movie/app/data/constants/assetsDesign.dart';
import 'package:intl/intl.dart';

class Part extends StatelessWidget {
  final String title;
  final RxList<Results> listFilm;

  Part({required this.title, required this.listFilm});

  @override
  Widget build(BuildContext context) {
    if (listFilm == null) {
      return CircularProgressIndicator();
    } else {
      return VxBox(
          child: VStack([
        HStack(
          [
            '$title'.text.color(textColor).bold.size(18).make().pLTRB(20, 15, 220, 8),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.CATEGORY, arguments: [
                  {'title': title},
                  listFilm,
                ]);
              },
              child: 'See All'.text.color(buttonTextColor).size(14).end.make().pLTRB(0, 20, 0, 8),
            ),
          ],
        ),
        VxBox(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: listFilm.isNotEmpty ? listFilm.length - (listFilm.length ~/ 2) : 0,
            itemBuilder: (context, index) {
              List listGenre = listFilm[index].genreIds!.where((element) => element.runtimeType != int).toList();
              return InkWell(
                onTap: () {
                  Get.toNamed(
                    Routes.DETAIL,
                    arguments: listFilm[index].id,
                  );
                },
                child: VxContinuousRectangle(
                  width: 160,
                  radius: 16,
                  backgroundColor: secondColor,
                  child: VStack([
                    // VxBox(
                    Container(
                      height: 230,
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                          image: DecorationImage(
                            image: NetworkImage('http://image.tmdb.org/t/p/w500${listFilm[index].posterPath}'),
                            fit: BoxFit.cover,
                          )),
                    ).paddingOnly(bottom: 4),
                    // ).make(),
                    VStack([
                      '${listFilm[index].title}'.text.bold.color(textColor).size(16).ellipsis.make(),
                      '${DateFormat.y().format(DateTime.parse(listFilm[index].releaseDate.toString()))} ${listGenre.first}'.text.color(textColor).size(12).make(),
                      HStack([
                        Icon(Icons.star, color: Colors.yellow.shade600, size: 10),
                        "${listFilm[index].voteAverage}".text.color(textColor).size(10).make(),
                        " (${listFilm[index].voteCount})".text.color(textColor).size(10).make(),
                      ])
                    ]).paddingOnly(left: 8, top: 4),
                  ]),
                ).p4(),
              );
            },
          ).scrollHorizontal(),
        ).height(320).make(),
      ])).make().centered();
    }
  }
}
