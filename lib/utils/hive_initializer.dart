import 'package:flutter_e_commerce/features/cart/domain/model/cart.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String credentialsBox = 'credentials';

Future<void> initHive([String? subDir]) async {
  await Hive.initFlutter(subDir);
  Hive
    ..registerAdapter<PurchasedItem>(PurchasedItemAdapter()) //0
    ..registerAdapter<ItemProduct>(ItemProductAdapter()); //1
}
