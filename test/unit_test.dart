import 'package:flutter_test/flutter_test.dart';
import 'package:stealth_startup_technical_exam/app/data/models/user.dart';
import 'package:stealth_startup_technical_exam/app/data/provider/api.dart';
import 'package:stealth_startup_technical_exam/app/modules/users/controllers/user_controller.dart';
import 'package:stealth_startup_technical_exam/app/modules/users/repository/user_repository.dart';

void main() {
  final MyApi myApi = MyApi();
  final UserRepository userRepository = UserRepository(myApi);
  final UserController userController = UserController(userRepository);
  test('testing repository', () async {
    List<User> users = await userRepository.getUsers();
    expect(users.length, 4);
  });
  test('testing removing duplicates in the repository', () async {
    await userController.getUsers();
    expect(userController.users.length, 3);
  });
}
