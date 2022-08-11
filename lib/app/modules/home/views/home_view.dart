import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0b090a), 
      appBar: AppBar(
        backgroundColor: Color(0xFF161a1d),
        title: 'Movie App'.text.bold.start.make(),
        centerTitle: true,
      ),
      body: Center(
        child: controller.obx((state) => Text(state.toString()).text.white.make())
      ),
    );
  }
}
