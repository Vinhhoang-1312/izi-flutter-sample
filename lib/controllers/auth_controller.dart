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

  void login(String username, String password) {
    // Giả lập phản hồi API
    if (username == "user1" && password == "password1") {
      final userData = {"id": "1", "username": username};
      _storage.write("user", userData); // Lưu thông tin người dùng
      isLoggedIn.value = true;
      userId = userData["id"]!; // Gán userId
      update(); // Cập nhật trạng thái
      Get.snackbar("Thành công", "Đăng nhập thành công!");
    } else {
      Get.snackbar("Lỗi", "Tài khoản hoặc mật khẩu không đúng.");
    }
  }

  void logout() {
    // Xóa thông tin người dùng khỏi GetStorage
    _storage.remove("user");
    isLoggedIn.value = false;
    userId = ""; // Xóa userId khi đăng xuất
    update(); // Cập nhật trạng thái
  }
}
