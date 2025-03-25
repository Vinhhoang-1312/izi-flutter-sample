import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final GetStorage _storage = GetStorage();

  var isLoggedIn = false.obs;
  String userId = ""; // Lưu userId sau khi đăng nhập

  @override
  void onInit() {
    super.onInit();
    isLoggedIn.value = _storage.hasData("user");
    if (isLoggedIn.value) {
      final userData = _storage.read("user");
      userId = userData["id"].toString(); // Khôi phục userId từ GetStorage
    }
  }

  void login(Map<String, dynamic> userData) {
    _storage.write("user", userData);
    isLoggedIn.value = true;
    userId = userData["id"].toString(); // Gán userId khi đăng nhập thành công
    update(); // Cập nhật trạng thái
  }

  void logout() {
    _storage.remove("user");
    isLoggedIn.value = false;
    userId = ""; // Xóa userId khi đăng xuất
    update(); // Cập nhật trạng thái
  }
}
