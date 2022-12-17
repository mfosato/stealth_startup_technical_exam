import 'package:get/get.dart';
import 'package:stealth_startup_technical_exam/app/data/provider/api.dart';
import 'package:stealth_startup_technical_exam/app/modules/users/repository/user_repository.dart';

import '../controllers/user_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => MyApi())
      ..lazyPut(() => UserRepository(Get.find<MyApi>()))
      ..lazyPut<UserController>(
        () => UserController(Get.find<UserRepository>()),
      );
  }
}
