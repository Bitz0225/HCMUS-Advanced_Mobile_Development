import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/input/auth_form.dart';
import 'package:lettutor/core/data_source/network/models/input/update_password_form.dart';
import 'package:lettutor/core/data_source/network/models/output/user_model.dart';
import 'package:lettutor/core/repository/base_repository.dart';

class AuthRepository extends BaseRepository {
  AuthRepository() : super('/auth');

  Future<DataState<AuthOutput>> login(AuthForm input) async {
    return post<AuthOutput>(
      path: '/login',
      parseJsonFunction: AuthOutput.fromJson,
      data: input.toJson(),
    );
  }

  Future<DataState<AuthOutput>> register(AuthForm input) async {
    return post<AuthOutput>(
      path: '/register',
      parseJsonFunction: AuthOutput.fromJson,
      data: {
        ...input.toJson(),
        ...{'source': 'https://www.google.com/'}
      },
    );
  }

  Future<DataState<Message>> updatePassword(ChangePasswordForm input) async {
    return post<Message>(
      path: '/change-password',
      parseJsonFunction: Message.fromJson,
      data: input.toJson()
    );
  }

  Future<DataState<AuthOutput>> signInWithFacebook(String? token) async {
    return post<AuthOutput>(
      path: '/facebook',
      parseJsonFunction: AuthOutput.fromJson,
      data: {'access_token': token},
    );
  }

  Future<DataState<AuthOutput>> signInWithGoogle(String? token) async {
    return post<AuthOutput>(
      path: '/google',
      parseJsonFunction: AuthOutput.fromJson,
      data: {'access_token': token},
    );
  }
}
