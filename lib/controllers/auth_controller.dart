import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final GetStorage _storage = GetStorage();

  var isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    isLoggedIn.value = _storage.hasData("user");
  }

  void login(Map<String, dynamic> userData) {
    _storage.write("user", userData);
    isLoggedIn.value = true;
  }

  void logout() {
    _storage.remove("user");
    isLoggedIn.value = false;
  }

  // Thêm hàm để lấy userId
  String? get userId {
    Map<String, dynamic>? user = _storage.read("user");
    return user?["id"]?.toString(); // Chuyển đổi id thành String
  }
}
