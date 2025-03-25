import 'package:flutter/material.dart';
import '../services/auth_service.dart'; // Import AuthService để xử lý đăng ký tài khoản

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isObscure = true; // Biến kiểm soát việc hiển thị hoặc ẩn mật khẩu
  final TextEditingController _nameController =
      TextEditingController(); // Bộ điều khiển cho ô nhập họ tên
  final TextEditingController _phoneController =
      TextEditingController(); // Bộ điều khiển cho ô nhập số điện thoại
  final TextEditingController _passwordController =
      TextEditingController(); // Bộ điều khiển cho ô nhập mật khẩu
  final AuthService _authService =
      AuthService(); // Khởi tạo AuthService để xử lý đăng ký

  // Hàm xử lý đăng ký tài khoản
  void _register() async {
    String name = _nameController.text.trim(); // Lấy dữ liệu từ ô nhập họ tên
    String phone =
        _phoneController.text.trim(); // Lấy dữ liệu từ ô nhập số điện thoại
    String password =
        _passwordController.text.trim(); // Lấy dữ liệu từ ô nhập mật khẩu

    // Kiểm tra nếu có ô nào bị bỏ trống
    if (name.isEmpty || phone.isEmpty || password.isEmpty) {
      _showMessage("Vui lòng điền đầy đủ thông tin!");
      return;
    }

    // Gọi API đăng ký từ AuthService
    var result = await _authService.register(name, phone, password);
    if (result != null) {
      _showMessage("Đăng ký thành công!");
      Navigator.pushNamed(context, '/login'); // Chuyển sang màn hình đăng nhập
    } else {
      _showMessage("Đăng ký thất bại, thử lại!");
    }
  }

  // Hàm hiển thị thông báo (Snackbar)
  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  Image.asset("assets/images/logo.png",
                      height: 140), // Logo của ứng dụng
                  const SizedBox(height: 20),
                  const Text("Đăng ký",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text("Chào mừng bạn đến với AppBanHang",
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 50),

            // Khung chứa các ô nhập liệu và nút đăng ký
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 2, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Center(
                child: SizedBox(
                  width: 340,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 20),
                      const Text("Đăng ký tài khoản",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),

                      // Ô nhập họ tên
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.person, color: Colors.green),
                          hintText: "Họ và tên",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Ô nhập số điện thoại (username)
                      TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.phone, color: Colors.green),
                          hintText: "Số điện thoại",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Ô nhập mật khẩu
                      TextField(
                        controller: _passwordController,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.lock, color: Colors.green),
                          suffixIcon: IconButton(
                            icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                          hintText: "Mật khẩu",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Nút đăng ký
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: _register,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text("Đăng ký",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Chuyển sang đăng nhập
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Bạn đã có tài khoản?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: const Text("Đăng nhập ngay",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const SizedBox(
                          width: 337,
                          child: Divider(thickness: 1, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
