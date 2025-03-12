import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Import màn hình đăng nhập
import 'screens/home_screen.dart'; // Import màn hình trang chủ
import 'screens/cart_screen.dart'; // Import màn hình giỏ hàng

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //Tắt(banner) "DEBUG" màu đỏ ở góc trên bên phải.
      home: LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}
