import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/app/routes/app_pages.dart';
import 'package:movie/app/models/FilmModel.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:movie/app/data/constants/assetsDesign.dart';

class Swiper extends StatelessWidget {
  //prepare data from home_view
  final String title;
  final RxList<Results> listFilm;

  Swiper({required this.title, required this.listFilm});

  @override
  Widget build(BuildContext context) {
    if (listFilm == null) {
      return CircularProgressIndicator();
    } else {
      return VxBox(
          child: VStack([
        HStack(
          [
            'Now Playing'.text.color(textColor).bold.size(18).make().pLTRB(20, 15, 180, 8),
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
        VxSwiper.builder(
            itemCount: listFilm.isNotEmpty ? listFilm.length-10 : 0,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.DETAIL, arguments: listFilm[index]);
                },
                child: VxContinuousRectangle(
                  radius: 16,
                  backgroundImage: DecorationImage(
                    image: NetworkImage('http://image.tmdb.org/t/p/w500${listFilm[index].backdropPath}'),
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
                    listFilm[index].genreIds!.join(" ").text.color(textColor).size(10).ellipsis.make(),
                    HStack([
                      Icon(Icons.star, color: Colors.yellow.shade600, size: 10),
                      "${listFilm[index].voteAverage}".text.color(textColor).size(10).make(),
                      " (${listFilm[index].voteCount})".text.color(textColor).size(10).make(),
                    ])
                  ]).pLTRB(32, 16, 32, 8),
                ).p8(),
              );
            })
      ])).make().centered();
    }
  }
}