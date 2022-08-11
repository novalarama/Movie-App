import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_controller.dart';

class ListView extends GetView<ListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
