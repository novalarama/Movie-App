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
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: secondColor,
        title: 'Movie App'.text.bold.start.make(),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: controller.obx((data) {
            if (controller.listNowPlaying.isNotEmpty && controller.listPopular.isNotEmpty && controller.listTopRated.isNotEmpty && controller.listUpcoming.isNotEmpty) {
              return VStack([
                Swiper(title: 'Now Playing', path: 'now_playing', listFilm: controller.listNowPlaying),
                Part(title: 'Popular', path: 'popular', listFilm: controller.listPopular),
                Part(title: 'Top Rated', path: 'top_rated', listFilm: controller.listTopRated),
                Part(title: 'Upcoming', path: 'upcoming', listFilm: controller.listUpcoming),
              ]);
            } else {
              return Padding(
                padding: const EdgeInsets.all(32),
                child: Center(child: CircularProgressIndicator()),
              );
            }
          },
              onLoading: Padding(
                padding: const EdgeInsets.all(32),
                child: Center(
                  child: VStack(
                    [CircularProgressIndicator(), 'Film mu akan siap...'.text.color(textColor).size(12).make()],
                    alignment: MainAxisAlignment.spaceEvenly,
                    crossAlignment: CrossAxisAlignment.center,
                  ),
                ),
              ),
              onError: (error) => "Error : $error".text.color(textColor).makeCentered()),
        ),
      ),
    );
  }
}
