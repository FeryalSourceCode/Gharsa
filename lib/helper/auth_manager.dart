import 'package:get/get.dart';
import 'cache_manager.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;
  final isViewed = 1.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(String? token) async {
    isLogged.value = true;
    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }

   void onBoardStatus(int? viewed) async {
    isViewed.value = 0;
    await saveOnBoardStatus(viewed);
  }

    void checkOnBoardStatus() {
    final viewing = getOnBoardStatus();
    if (viewing != null) {
      isViewed.value = 0;
    }
  }
}
