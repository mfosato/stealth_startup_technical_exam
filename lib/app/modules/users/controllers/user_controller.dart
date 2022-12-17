import 'package:get/get.dart';
import 'package:stealth_startup_technical_exam/app/data/models/user.dart';
import 'package:stealth_startup_technical_exam/app/modules/users/repository/user_repository.dart';
import 'package:stealth_startup_technical_exam/app/routes/app_pages.dart';
import 'package:stealth_startup_technical_exam/core/utils/functions/remove_duplicates_in_list.dart';

class UserController extends GetxController {
  final UserRepository repository;
  UserController(this.repository);
  RxList<User> users = RxList();
  RxBool isLoading = RxBool(false);

  User? get currentUser =>
      users.where((user) => user.id == Get.arguments).first;

  Future<void> getUsers() async {
    isLoading.value = true;

    List<User> usersList = (await repository.getUsers());
    users.value = removeDuplicatesInList(usersList);

    isLoading.value = false;
  }

  void viewUserDetails(String id) {
    Get.toNamed(Routes.USER_DETAIL, arguments: id);
  }
}
