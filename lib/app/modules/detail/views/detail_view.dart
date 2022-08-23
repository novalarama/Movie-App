import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_controller.dart';
import 'package:movie/app/data/constants/assetsDesign.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    if (controller.detailFilm == null) {
      return CircularProgressIndicator();
    } else {
      return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: mainColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: secondColor.withOpacity(0.01),
            centerTitle: true,
          ),
      body: Center(
        child: VxScrollVertical(
          child: controller.obx((data) => VStack([
                VxBox(
                  child: Image(
                    image: NetworkImage('http://image.tmdb.org/t/p/w500${controller.detailFilm.value.posterPath}'),
                    fit: BoxFit.cover,
                  )
                ).make(),
                HStack([
                  Expanded(
                    flex: 5,
                    child: VStack([
                    '${controller.detailFilm.value.title}'.text.color(textColor).bold.size(32).overflow(TextOverflow.visible).lineHeight(1.2).make(),

                    HStack([
                              VxRating(
                                onRatingUpdate: (val) {},
                                value: controller.detailFilm.value.voteAverage! / 2,
                                count: 5,
                                maxRating: 5,
                                normalColor: Colors.grey.shade500,
                                selectionColor: Colors.yellow,
                              ),
                              " ${controller.detailFilm.value.voteAverage}".text.color(textColor).size(14).make(),
                              " (${controller.detailFilm.value.voteCount})".text.color(textColor).size(14).make(),
                    ]),
                    controller.detailFilm.value.genres!.map((e) => e.name).toList().join(" | ").text.color(textColor).size(14).ellipsis.overflow(TextOverflow.ellipsis).make(),
                    '${controller.detailFilm.value.releaseDate}'.text.color(buttonTextColor).size(11).make(),
                    HStack([
                      Icon(Icons.timelapse, color: buttonTextColor, size: 14,),
                      ' ${controller.detailFilm.value.runtime} minutes'.text.color(textColor).size(11).make(),
                    ])
                  ]),
                  ),
                  Icon(Icons.bookmark_add_outlined, color: buttonTextColor, size: 20,)
                ]).p16(),
                VStack([
                  'Overview'.text.color(textColor).size(20).bold.make(),
                  '${controller.detailFilm.value.overview}'.text.color(textColor).size(12).make()
                ]).pLTRB(16, 0, 16, 16),
              ]),
              onLoading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: VStack([CircularProgressIndicator(), 'detail film mu akan siap...'.text.color(textColor).size(12).makeCentered()], alignment: MainAxisAlignment.center, crossAlignment: CrossAxisAlignment.center,),
                    )
              ),
              onError: (error) => "Error : $error".text.color(textColor).makeCentered()
              ),
        ),
      )
    );
    }
  }
}
