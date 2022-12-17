import 'package:stealth_startup_technical_exam/app/data/models/user.dart';
import 'package:stealth_startup_technical_exam/app/data/provider/api.dart';

class UserRepository {
  final MyApi api;

  UserRepository(this.api);

  Future<List<User>> getUsers() async => await api.getUsers();
}
