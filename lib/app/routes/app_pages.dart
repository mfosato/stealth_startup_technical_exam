// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:stealth_startup_technical_exam/app/modules/users/views/user_details_view.dart';

import '../modules/users/bindings/home_binding.dart';
import '../modules/users/views/users_view..dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.USER;

  static final routes = [
    GetPage(
        name: _Paths.USER,
        page: () => const UserView(),
        binding: HomeBinding(),
        children: [
          GetPage(
            name: _Paths.USER_DETAIL,
            page: () => const UserDetailsView(),
            binding: HomeBinding(),
          ),
        ]),
  ];
}
