import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false; // Biến trạng thái loading

  bool _isObscure = true; // Biến điều khiển ẩn/hiện mật khẩu
// Hàm xử lý đăng nhập
  void _login() async {
    setState(() {
      _isLoading = true;
    });

    String phone = _phoneController.text.trim();
    String password = _passwordController.text.trim();

    if (phone.isEmpty || password.isEmpty) {
      _showMessage("Vui lòng nhập đầy đủ thông tin!");
      setState(() {
        _isLoading = false;
      });
      return;
    }

    var user = await _authService.login(phone, password);
    if (user != null) {
      Navigator.pushReplacementNamed(
          context, "/home"); // Chuyển sang trang home
    } else {
      _showMessage("Sai tài khoản hoặc mật khẩu!");
    }

    setState(() {
      _isLoading = false;
    });
  }

// Hàm hiển thị thông báo lỗi
  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // Cho phép cuộn lên khi cần thiết nếu màn hình nhỏ
        child: Column(
          children: [
            // Phần logo & tiêu đề
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.png",
                      height: 140), // Logo của app
                  const SizedBox(height: 20),
                  const Text(
                    "Đăng nhập",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold), // Tiêu đề đăng nhập
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Chào mừng bạn đến với AppBanHang",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(
                          255, 55, 54, 54), // Chào mừng người dùng
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),

            // Form đăng nhập
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  top: 2, bottom: 20), // Padding cho container
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, -5), // Tạo bóng cho container
                  ),
                ],
              ),
              child: Center(
                child: SizedBox(
                  width: 340, // Đảm bảo chiều rộng form đăng nhập cố định
                  child: Column(
                    mainAxisSize: MainAxisSize
                        .min, // Giữ các phần bên trong không vượt quá kích thước màn hình
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "Đăng nhập với số điện thoại",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Ô nhập số điện thoại
                      TextField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Colors.green,
                          ),

                          hintText:
                              "Số điện thoại", // Hướng dẫn nhập số điện thoại
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[100], // Màu nền cho ô nhập
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Ô nhập mật khẩu với nút ẩn/hiện mật khẩu
                      TextField(
                        obscureText: _isObscure, // Điều khiển hiển thị mật khẩu
                        controller: _passwordController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.green,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons
                                      .visibility_off // Nếu mật khẩu ẩn thì dùng biểu tượng này
                                  : Icons
                                      .visibility, // Nếu mật khẩu hiện thì dùng biểu tượng này
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure =
                                    !_isObscure; // Thay đổi trạng thái ẩn/hiện mật khẩu
                              });
                            },
                          ),
                          hintText: "Mật khẩu", // Hướng dẫn nhập mật khẩu
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor:
                              Colors.grey[100], // Màu nền cho ô nhập mật khẩu
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Hàng chứa "Ghi nhớ tài khoản" và "Quên mật khẩu"
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                activeColor: Colors
                                    .green, // Màu của checkbox khi được chọn
                                onChanged: (value) {},
                              ),
                              const Text(
                                  "Ghi nhớ tài khoản"), // Văn bản cho checkbox
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Quên mật khẩu?",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Nút Đăng nhập
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: _isLoading
                              ? null
                              : () async {
                                  _login();
                                },

                          // onPressed: () {
                          //   Navigator.pushNamed(context,
                          //       '/home'); // Chuyển đến màn hình Home khi đăng nhập
                          // },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Đăng nhập",
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Hàng chứa divider với chữ "Hoặc đăng nhập với"
                      Row(
                        children: [
                          Expanded(child: Divider(thickness: 1)),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                                "Hoặc đăng nhập với"), // Văn bản "Hoặc đăng nhập với"
                          ),
                          Expanded(child: Divider(thickness: 1)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Nút đăng nhập bằng Google & Apple
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: ClipOval(
                              child: Image.asset(
                                "assets/images/google.png", // Hình ảnh biểu tượng Google
                                height: 40,
                              ),
                            ),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 110),
                          IconButton(
                            icon: ClipOval(
                              child: Image.asset(
                                "assets/images/apple.png", // Hình ảnh biểu tượng Apple
                                height: 40,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      // Phần đăng ký tài khoản & trải nghiệm không cần đăng nhập (vẫn nằm trong container)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Bạn chưa có tài khoản?"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context,
                                        '/register'); // Chuyển đến màn hình Home khi đăng nhập
                                  },
                                  child: const Text(
                                    "Tạo ngay.",
                                    style: TextStyle(
                                        fontWeight: FontWeight
                                            .bold), // Văn bản "Tạo ngay"
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 337,
                              child: Divider(
                                  thickness: 1,
                                  color: Colors.grey), // Divider giữa các phần
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/home');
                              },
                              child: const Text(
                                "Trải nghiệm không cần đăng nhập", // Văn bản "Trải nghiệm không cần đăng nhập"
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
