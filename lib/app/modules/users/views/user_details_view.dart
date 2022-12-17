import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stealth_startup_technical_exam/app/data/models/user.dart';
import 'package:stealth_startup_technical_exam/core/values/strings.dart';

import '../controllers/user_controller.dart';

class UserDetailsView extends GetView<UserController> {
  const UserDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        init: controller,
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: Text(userDetailsString),
                centerTitle: true,
              ),
              body: Obx(
                () => controller.isLoading.isTrue
                    ? const Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: userInformation(controller.currentUser!),
                      ),
              ));
        });
  }

  Widget userInformation(User user) {
    return Column(
      children: [
        Center(
          child: Image.network(
            user.imageUrl,
            width: 120,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(user.name, style: Get.textTheme.headline5),
        const Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$userIdString ${user.id}',
              style: Get.textTheme.bodyMedium,
            ),
            Text('$imageUrlString ${user.imageUrl}')
          ],
        )
      ],
    );
  }
}
