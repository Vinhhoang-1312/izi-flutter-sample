import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  final Dio _dio = Dio();
  final GetStorage _storage = GetStorage(); // Lưu thông tin user

  Future<Map<String, dynamic>?> login(String phone, String password) async {
    try {
      // Gửi yêu cầu POST đến API dummyJSON
      Response response = await _dio.post(
        'https://dummyjson.com/auth/login',
        data: {
          'username': phone,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final userData = response.data;
        _storage.write("user", userData); // Lưu thông tin người dùng
        return userData; // Trả về dữ liệu người dùng
      } else {
        return null; // Trả về null nếu đăng nhập thất bại
      }
    } catch (e) {
      print('Lỗi khi đăng nhập: $e'); // In lỗi để kiểm tra
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
          'lastName': 'Test', // DummyJSON có thể yêu cầu lastName
          'username': phone, // DummyJSON yêu cầu username
          'password': password,
          'email': '$phone@example.com', // DummyJSON có thể yêu cầu email
          'gender': 'male', // Thêm giới tính (hoặc 'female' nếu cần)
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data; // Trả về thông tin user mới tạo
      } else {
        return null;
      }
    } catch (e) {
      print('Lỗi khi đăng ký: $e'); // In lỗi để kiểm tra
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
