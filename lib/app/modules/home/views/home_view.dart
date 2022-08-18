import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:movie/app/data/constants/assetsDesign.dart';
import 'package:movie/app/modules/home/views/widgets/swiper_home_view.dart';
import 'package:movie/app/modules/home/views/widgets/part_home_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        // backgroundColor: secondColor,
        title: 'Movie App'.text.bold.start.make(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: VStack([
          // now playing
          Center(
            child: controller.obx(
                (data) => VStack([
                      Swiper(title: 'Now Playing', listFilm: controller.listNowPlaying),
                      Part(title: 'Popular', listFilm: controller.listPopular),
                      Part(title: 'Top Rated', listFilm: controller.listTopRated),
                      Part(title: 'Upcoming', listFilm: controller.listUpcoming),
                    ]),
                onLoading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: VStack([CircularProgressIndicator(), 'Film mu akan siap...'.text.color(textColor).size(12).makeCentered()]),
                  ),
                ),
                onError: (error) => "Error : $error".text.color(textColor).makeCentered()
              ),
          ),
        ]).scrollVertical(),
      ),
    );
  }
}
