import 'package:hive_flutter/hive_flutter.dart';

const String credentialsBox = 'credentials';

Future<void> initHive() async {
  await Hive.initFlutter();
}
