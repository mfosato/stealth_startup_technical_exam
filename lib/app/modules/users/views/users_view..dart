// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stealth_startup_technical_exam/app/data/models/user.dart';
import 'package:stealth_startup_technical_exam/app/modules/users/controllers/user_controller.dart';
import 'package:stealth_startup_technical_exam/core/values/strings.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        init: controller,
        initState: (state) {
          controller.getUsers();
        },
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: Text(usersString),
                centerTitle: true,
              ),
              body: Obx(
                () => controller.isLoading.isTrue
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          if (controller.users.isEmpty)
                            Text(genericErrorMessage),
                          for (User user in controller.users) userWidget(user)
                        ],
                      ),
              ));
        });
  }

  Widget userWidget(User user) {
    return ListTile(
        onTap: () {
          controller.viewUserDetails(user.id);
        },
        contentPadding: const EdgeInsets.all(16),
        leading: Image.network(
          user.imageUrl,
          width: 80,
        ),
        title: Text(user.name),
        subtitle: Text(user.imageUrl),
        trailing: const Icon(Icons.chevron_right));
  }
}
