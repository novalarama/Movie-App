import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/app/routes/app_pages.dart';
import 'package:movie/app/models/film_model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:movie/app/data/constants/assetsDesign.dart';

class Swiper extends StatelessWidget {
  //prepare data from home_view
  final String title;
  final String path;
  final RxList<Results> listFilm;

  Swiper({required this.title,  required this.path, required this.listFilm,});

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
          VxSwiper.builder(
              itemCount: listFilm.isNotEmpty ? listFilm.length : 0,
              itemBuilder: (context, index) {
                if (listFilm[index] != null) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.DETAIL, arguments: listFilm[index].id);
                    },
                    child: VxContinuousRectangle(
                      radius: 16,
                      backgroundImage: DecorationImage(
                        image: NetworkImage('http://image.tmdb.org/t/p/w500${listFilm[index].backdropPath!}'),
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                        fit: BoxFit.cover,
                      ),
                      backgroundColor: Colors.black,
                      child: VStack([
                        VxContinuousRectangle(
                          // width: 300,
                          radius: 24,
                          backgroundImage: DecorationImage(
                            image: NetworkImage('http://image.tmdb.org/t/p/w500${listFilm[index].posterPath}'),
                            fit: BoxFit.cover,
                            // alignment: Alignment.center
                          ),
                        ),
                        "${listFilm[index].title}".text.color(textColor).size(18).bold.ellipsis.make().pOnly(top: 10),
                        listFilm[index].genreIds!.join(" • ").text.color(textColor).size(10).ellipsis.make(),
                        HStack([
                          Icon(Icons.star, color: Colors.yellow.shade600, size: 10),
                          "${listFilm[index].voteAverage}".text.color(textColor).size(10).make(),
                          " (${listFilm[index].voteCount})".text.color(textColor).size(10).make(),
                        ])
                      ]).p8(),
                    ).p8(),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(32),
                    child: Center(
                      child: VStack(
                        [CircularProgressIndicator(), 'Film mu akan siap...'.text.color(textColor).size(12).make()],
                        alignment: MainAxisAlignment.spaceEvenly,
                        crossAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                  );
                }
              })
        ]),
      );
    }
  }
}
