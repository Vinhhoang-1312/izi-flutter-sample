import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'; // Import for debugPaintSizeEnabled
import 'screens/login_screen.dart'; // Import màn hình đăng nhập
import 'screens/register_screen.dart'; // Import màn hình đăng nhập
import 'screens/home_screen.dart'; // Import màn hình trang chủ
import 'screens/cart_screen.dart'; // Import màn hình giỏ hàng
import 'screens/order_screen.dart'; // Import màn hình đơn hàng
import 'screens/account_screen.dart'; // Import màn hình đơn hàng
import 'screens/createOrder_screen.dart'; // Import màn hình đơn hàng
import 'screens/screen.dart'; // Import màn hình đơn hàng
import 'package:get_storage/get_storage.dart';
import './services/auth_service.dart';

void main() async {
  await GetStorage.init();
  // Enable debug paint
  debugPaintSizeEnabled = false; // Hiển thị khung layout
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();

    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner:
          false, // Tắt(banner) "DEBUG" màu đỏ ở góc trên bên phải.
      initialRoute: authService.isLoggedIn() ? '/home' : '/login',

      home: const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/cart': (context) => const CartScreen(),
        '/order': (context) => const OrderScreen(), // Add order route
        '/account': (context) => const AccountScreen(), // Add order route
        '/register': (context) => const RegisterScreen(), // Add order route
        '/createOrder': (context) =>
            const CreateOrderScreen(), // Add order route
      },
    );
  }
}
