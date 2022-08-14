import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/list_controller.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:movie/app/data/constants/assetsDesign.dart';

class ListView extends GetView<ListController> {
  List<dynamic> receivedData = Get.arguments;

  late Map<String, dynamic> title = receivedData[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: secondColor,
        title: '${title['title']}'.text.bold.start.make(),
        centerTitle: true,
      ),
      body: 
      ),
    );
  }
}
