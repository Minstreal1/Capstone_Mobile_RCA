import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_schedule_controller.dart';

class NewScheduleView extends GetView<NewScheduleController> {
  const NewScheduleView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewScheduleView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewScheduleView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
