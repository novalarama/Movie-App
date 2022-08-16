import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_controller.dart';
import 'package:intl/intl.dart';
import 'package:movie/app/data/constants/assetsDesign.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
          appBar: AppBar(
            backgroundColor: secondColor.withOpacity(0.01),
            centerTitle: true,
          ),
      body: VxScrollVertical(
        child: VStack([
          Center(
            child: controller.obx((data) => VStack([
              VxBox(
                child: Image(
                  image: NetworkImage('http://image.tmdb.org/t/p/w500${controller.listFilm.posterPath}'),
                  fit: BoxFit.cover,
                )
              ).make(),
              HStack([
                Expanded(
                  flex: 5,
                  child: VStack([
                  '${controller.listFilm.title}'.text.color(textColor).bold.size(32).overflow(TextOverflow.visible).lineHeight(1.2).make(),
                  HStack([
                            VxRating(
                              onRatingUpdate: (val) {},
                              value: controller.listFilm.voteAverage! / 2,
                              count: 5,
                              maxRating: 5,
                              normalColor: Colors.grey.shade500,
                              selectionColor: Colors.yellow,
                            ),
                            " ${controller.listFilm.voteAverage}".text.color(textColor).size(14).make(),
                            " (${controller.listFilm.voteCount})".text.color(textColor).size(14).make(),
                  ]),
                  controller.listFilm.genreIds!.join(", ").text.color(textColor).size(14).ellipsis.overflow(TextOverflow.ellipsis).make(),
                  '${controller.listFilm.releaseDate}'.text.color(textColor).size(14).make(),
                  HStack([
                    Icon(Icons.timelapse, color: buttonTextColor, size: 14,),
                    ' ${controller.runtime} minutes'.text.color(textColor).size(14).make(),
                  ])
                ]),
                ),
                Icon(Icons.bookmark_add_outlined, color: buttonTextColor, size: 20,)
              ]).p16(),
              VStack([
                'Overview'.text.color(textColor).size(20).bold.make(),
                '${controller.listFilm.overview}'.text.color(textColor).size(12).make()
              ]).pLTRB(16, 0, 16, 16),
            ]),
            onLoading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: VStack([CircularProgressIndicator(), 'Film mu akan siap...'.text.color(textColor).size(12).makeCentered()]),
                  )
            ),
            onError: (error) => "Error : $error".text.color(textColor).makeCentered()
            ),
          )
        ]),
      )
    );
  }
}
