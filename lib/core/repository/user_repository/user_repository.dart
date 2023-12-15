import 'package:dio/dio.dart';
import 'package:lettutor/core/app_config/dependency.dart';
import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/output/user_model.dart';
import 'package:lettutor/core/repository/base_repository.dart';

class UserRepository extends BaseRepository{
  UserRepository() : super('/user');

  Future<DataState<User>> getUser() {
    return get(
      path: '/info',
      parseJsonFunction: User.fromJson,
    );
  }
}
