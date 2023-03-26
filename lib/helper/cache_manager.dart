import 'dart:ffi';

import 'package:get_storage/get_storage.dart';
mixin CacheManager{

  Future<bool> saveToken(String? token) async{
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  String? getToken(){
    final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  Future<void> removeToken() async{
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());
  }
}

Future<bool> saveOnBoardStatus(int? viewed) async {
  final box = GetStorage();
  await box.write(CacheManagerKey.VIEWED.toString(), viewed);
  return true;
}

int getOnBoardStatus() {
  final box = GetStorage();
  return box.read(CacheManagerKey.VIEWED.toString());
}

// ignore: constant_identifier_names
enum CacheManagerKey {TOKEN, VIEWED}