import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/category_controller.dart';
import 'package:movie/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:movie/app/data/constants/assetsDesign.dart';

class CategoryView extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondColor,
        appBar: AppBar(
          backgroundColor: secondColor,
          title: '${controller.title}'.text.bold.start.make(),
          centerTitle: true,
        ),
        body: Center(
          child: controller.obx((data) => ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                controller: controller.scrollController,
                itemCount: controller.listFilm.length + 1,
                itemBuilder: (context, index) {
                  var film = controller.listFilm.value;
                  if (index < controller.listFilm.length && controller.nextPage == true) {
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
                            " ${film[index].voteAverage}".text.color(textColor).size(10).make(),
                            " (${film[index].voteCount})".text.color(textColor).size(10).make(),
                          ])
                        ])),
                        Icon(
                          Icons.bookmark_add_outlined,
                          color: buttonTextColor,
                        ).paddingOnly(right: 8)
                      ])).padding(Vx.mOnly(top: 20)).height(175).color(secondColor).make(),
                    );
                  } else {
                    if (controller.nextPage == false) {
                      return Center(child: 'No More Data to Load'.text.size(14).color(textColor).make());
                    } else {
                      return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 32),
                          child: Center(child: CircularProgressIndicator(),),
                        );
                    }
                  }
                },
              )),
        ));
  }
}
