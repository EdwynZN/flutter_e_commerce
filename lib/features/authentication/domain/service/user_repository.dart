import 'package:flutter_e_commerce/features/authentication/domain/model/user.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/user_info.dart';

abstract interface class UserRepository {
  Future<bool> exists(String email);

  Future<User> createUser(UserInfo user);
}
