import 'package:lettutor/core/data_source/network/models/input/auth_form.dart';
import 'package:lettutor/core/data_source/network/models/output/user_model.dart';
import 'package:lettutor/core/repository/base_repository.dart';

class AuthRepository extends BaseRepository {
  AuthRepository() : super('/auth');

  Future<AuthOutput> login(AuthForm input) async {
    final response = await post<AuthOutput>(
      path: '/login',
      parseJsonFunction: AuthOutput.fromJson,
      data: input.toJson(),
    );
    return response;
  }

  Future<AuthOutput> register(AuthForm input) async {
    final response = await post<AuthOutput>(
      path: '/register',
      parseJsonFunction: AuthOutput.fromJson,
      data: {
        ...input.toJson(),
        ...{'source': 'https://www.google.com/'}
      },
    );
    return response;
  }
}
