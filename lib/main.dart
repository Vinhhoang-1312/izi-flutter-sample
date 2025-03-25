import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'; // Import for debugPaintSizeEnabled
import 'package:get/get.dart';
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
import './controllers/auth_controller.dart'; // Import AuthController
import './controllers/product.dart';
import './controllers/cart_controller.dart'; // Import CartController

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Khởi tạo GetStorage trước khi sử dụng
  Get.put(AuthController()); // Đăng ký AuthController toàn cục
  Get.put(AuthService()); // 🛠 Đăng ký AuthService toàn cục
  Get.put(ProductController()); // 🛠 Đăng ký ProductController nếu cần
  Get.put(CartController()); // 🛠 Đăng ký CartController toàn cục

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = Get.find<AuthService>(); // Lấy AuthService

    return GetMaterialApp(
      // 🛠 Đổi từ MaterialApp sang GetMaterialApp
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: authService.isLoggedIn() ? '/home' : '/login',
      getPages: [
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        // GetPage(name: '/cart', page: () => const CartScreen()),
        GetPage(name: '/order', page: () => const OrderScreen()),
        GetPage(name: '/account', page: () => const AccountScreen()),
        GetPage(name: '/register', page: () => const RegisterScreen()),
        GetPage(name: '/createOrder', page: () => const CreateOrderScreen()),
      ],
    );
  }
}
