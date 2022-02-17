import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_language/core/constants/memory/hive_type_constant.dart';

import '../../../view/authenticate/auth/model/user_model.dart';
import 'cache_manager_interface.dart';

class UserCacheManager extends ICacheManager<UserModel> {
  UserCacheManager(String key) : super(key);

  @override
  Future<void> addItems(List<UserModel> items) async {
    await box?.addAll(items);
  }

  @override
  Future<void> putItems(List<UserModel> items) async {
    await box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }

  @override
  UserModel? getItem(String key) {
    return box?.get(key);
  }

  @override
  Future<void> putItem(String key, UserModel item) async {
    await box?.put(key, item);
  }

  @override
  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  @override
  List<UserModel>? getValues() {
    return box?.values.toList();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveTypeConstants.userTypeId)) {
      Hive.registerAdapter(UserModelAdapter());
      Hive.registerAdapter(CompanyAdapter());
    }
  }
}
