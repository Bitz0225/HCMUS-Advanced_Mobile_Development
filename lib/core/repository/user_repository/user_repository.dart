abstract class UserRepository {
  Future<User?> login(String username, String password);
  Future<User?> register(String username, String password);
  Future<User?> getUserInfo();
  Future<void> logout();
}
