import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/app/routes/app_pages.dart';
import 'package:movie/app/models/film_model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:movie/app/data/constants/assetsDesign.dart';
import 'package:intl/intl.dart';

class Part extends StatelessWidget {
  final String title;
  final String path;
  final RxList<Results> listFilm;

  Part({required this.title, required this.path, required this.listFilm});

  @override
  Widget build(BuildContext context) {
    if (listFilm.length == null) {
      return CircularProgressIndicator();
    } else {
      return Padding(
        padding: const EdgeInsets.all(18),
        child: VStack([
          HStack(
            [
              '$title'.text.color(textColor).bold.size(18).make(),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.CATEGORY, arguments: [
                    title,
                    path
                  ]);
                },
                child: 'See All'.text.color(buttonTextColor).size(14).end.make(),
              ),
            ],
            alignment: MainAxisAlignment.spaceBetween,
            crossAlignment: CrossAxisAlignment.center,
            axisSize: MainAxisSize.max,
          ),
          VxBox(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: listFilm.isNotEmpty ? listFilm.length : 0,
              itemBuilder: (context, index) {
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
                      Container(
                        height: 230,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                            image: DecorationImage(
                              image: NetworkImage('http://image.tmdb.org/t/p/w500${listFilm[index].posterPath}'),
                              fit: BoxFit.cover,
                            )),
                      ).paddingOnly(bottom: 4),
                      // ).make(),
                      VStack([
                        '${listFilm[index].title}'.text.bold.color(textColor).size(16).ellipsis.make(),
                        '${DateFormat.y().format(DateTime.parse(listFilm[index].releaseDate.toString()))} ${listFilm[index].genreIds!.first}'.text.color(textColor).size(12).make(),
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
          ).padding(Vx.mLTRB(0, 12, 0, 0)).height(320).make(),
        ]),
      );
    }
  }
}
