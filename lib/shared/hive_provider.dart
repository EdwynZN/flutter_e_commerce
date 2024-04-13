import 'package:flutter_e_commerce/features/authentication/domain/model/user.dart';
import 'package:flutter_e_commerce/shared/hive_boxes_name.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final hiveAuthProvider = Provider<Box<UserCredential>>(
  (_) => Hive.box<UserCredential>(credentialsBox),
  name: 'HiveAuth',
);

final hivePreferencesProvider = Provider<Box<Object>>(
  (_) => Hive.box<Object>(preferencesBox),
  name: 'HivePreferences',
);