import 'package:lettutor/core/data_source/network/models/output/user_model.dart';

abstract class UserRepository {
  Future<User?> login(String username, String password);
  Future<User?> register(String username, String password);
  Future<User?> getUserInfo();
  Future<void> logout();
}
