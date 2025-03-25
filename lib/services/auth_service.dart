import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  final Dio _dio = Dio();
  final GetStorage _storage = GetStorage(); // Lưu thông tin user

  Future<Map<String, dynamic>?> login(String phone, String password) async {
    try {
      Response response = await _dio.post(
        'https://dummyjson.com/auth/login',
        data: {
          'username': phone, // DummyJSON yêu cầu username, không phải phone
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        _storage.write("user", response.data); // Lưu user vào GetStorage
        return response.data; // Trả về thông tin user
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

// Đăng ký (Register)
  Future<Map<String, dynamic>?> register(
      String name, String phone, String password) async {
    try {
      Response response = await _dio.post(
        'https://dummyjson.com/users/add',
        data: {
          'firstName': name, // DummyJSON dùng firstName
          'username': phone, // DummyJSON yêu cầu username
          'password': password,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data; // Trả về thông tin user mới tạo
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  // Kiểm tra xem user đã đăng nhập chưa
  bool isLoggedIn() {
    return _storage.hasData("user");
  }

  // Đăng xuất
  void logout() {
    _storage.remove("user");
  }
}
