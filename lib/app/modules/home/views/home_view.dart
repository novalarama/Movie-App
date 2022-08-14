import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:movie/app/data/constants/assetsDesign.dart';

class HomeView extends GetView<HomeController> {
  final RxList<Results> listFilm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: secondColor,
        title: 'Movie App'.text.bold.start.make(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: VStack([
          // now playing
          Center(
            child: controller.obx(
                (data) => VStack([
                      // now playing film
                      HStack(
                        [
                          'Now Playing'.text.color(textColor).bold.size(18).make().pLTRB(20, 15, 180, 8),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.LIST, arguments: [
                                {'title': 'Now Playing'},
                                {listFilm : controller.listNowPlaying}
                              ]);
                            },
                            child: 'See All'.text.color(buttonTextColor).size(14).end.make().pLTRB(0, 20, 0, 8),
                          ),
                        ],
                      ),
                      VxSwiper.builder(
                          itemCount: controller.listNowPlaying.length - 10,
                          itemBuilder: (context, index) {
                            List listGenre = controller.listNowPlaying[index].genreIds!.where((element) => element.runtimeType != int).toList();
                            return InkWell(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL, arguments: controller.listNowPlaying[index]);
                              },
                              child: VxContinuousRectangle(
                                radius: 16,
                                backgroundImage: DecorationImage(
                                  image: NetworkImage('http://image.tmdb.org/t/p/w500${controller.listNowPlaying[index].backdropPath}'),
                                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                                  fit: BoxFit.cover,
                                ),
                                backgroundColor: Colors.black,
                                child: VStack([
                                  VxContinuousRectangle(
                                    // width: 300,
                                    radius: 24,
                                    backgroundImage: DecorationImage(
                                      image: NetworkImage('http://image.tmdb.org/t/p/w500${controller.listNowPlaying[index].posterPath}'),
                                      fit: BoxFit.cover,
                                      // alignment: Alignment.center
                                    ),
                                  ),
                                  "${controller.listNowPlaying[index].title}".text.color(textColor).size(18).bold.ellipsis.make().pOnly(top: 10),
                                  listGenre.join("  ").text.color(textColor).size(10).ellipsis.make(),
                                  HStack([
                                    Icon(Icons.star, color: Colors.yellow.shade600, size: 10),
                                    "${controller.listNowPlaying[index].voteAverage}".text.color(textColor).size(10).make(),
                                    " (${controller.listNowPlaying[index].voteCount})".text.color(textColor).size(10).make(),
                                  ])
                                ]).pLTRB(32, 16, 32, 8),
                              ).p8(),
                            );
                          })
                    ]),
                onLoading: Center(
                  child: VStack([CircularProgressIndicator(), 'Film mu akan siap...'.text.color(textColor).size(12).makeCentered()]),
                )),
          ),

          // popular film
          Center(
            child: controller.obx((data) => VStack([
                  HStack(
                    [
                      'Popular'.text.color(textColor).bold.size(18).make().pLTRB(20, 15, 220, 8),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.LIST, arguments: [
                            {'title': 'Popular'},
                            controller.listPopular,
                          ]);
                        },
                        child: 'See All'.text.color(buttonTextColor).size(14).end.make().pLTRB(0, 20, 0, 8),
                      ),
                    ],
                  ),
                  VxBox(
                    child: ListView.builder(
                      // shrinkWrap: true,
                      itemCount: controller.listPopular.length - 10,
                      itemBuilder: (context, index) {
                        print(controller.listUpcoming);
                        List listGenre = controller.listPopular[index].genreIds!.where((element) => element.runtimeType != int).toList();
                        return InkWell(
                          onTap: () {
                            Get.toNamed(
                              Routes.DETAIL,
                              arguments: controller.listPopular,
                            );
                          },
                          child: VxContinuousRectangle(
                            width: 130,
                            radius: 16,
                            backgroundColor: secondColor,
                            child: VStack([
                              Container(
                                child: Container(
                                  height: 175,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      image: DecorationImage(
                                        image: NetworkImage('http://image.tmdb.org/t/p/w500${controller.listPopular[index].posterPath}'),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                              VStack(['${controller.listPopular[index].title}'.text.color(textColor).size(14).ellipsis.make()])
                            ]),
                          ),
                        );
                      },
                    ).scrollHorizontal(),
                  ).height(250).make(),
                ])),
          ),
        ]).scrollVertical(),
      ),
    );
  }
}

// // popular film
//
//
