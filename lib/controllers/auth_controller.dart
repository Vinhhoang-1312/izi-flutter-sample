import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final GetStorage _storage = GetStorage();

  var isLoggedIn = false.obs;
  String userId = ""; // Lưu userId sau khi đăng nhập

  @override
  void onInit() {
    super.onInit();
    // Khôi phục trạng thái đăng nhập và userId từ GetStorage
    isLoggedIn.value = _storage.hasData("user");
    if (isLoggedIn.value) {
      final userData = _storage.read("user");
      userId = userData?["id"]?.toString() ?? ""; // Khôi phục userId
    }
  }

  void login(Map<String, dynamic> userData) {
    // Lưu thông tin người dùng vào GetStorage
    _storage.write("user", userData);
    isLoggedIn.value = true;
    userId = userData["id"].toString(); // Gán userId khi đăng nhập thành công
    update(); // Cập nhật trạng thái
  }

  void logout() {
    // Xóa thông tin người dùng khỏi GetStorage
    _storage.remove("user");
    isLoggedIn.value = false;
    userId = ""; // Xóa userId khi đăng xuất
    update(); // Cập nhật trạng thái
  }
}
