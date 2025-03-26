import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/order_summary_screen.dart'; // Import lại OrderSummaryScreen
import 'screens/account_screen.dart';
import 'screens/createOrder_screen.dart';
import './services/auth_service.dart';
import './controllers/auth_controller.dart';
import './controllers/cart_controller.dart';
import 'package:flutter/rendering.dart'; // Thêm dòng này
import './screens/screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Khởi tạo GetStorage trước khi sử dụng
  Get.put(AuthController()); // Đăng ký AuthController toàn cục
  Get.put(AuthService()); // Đăng ký AuthService toàn cục
  Get.put(CartController()); // Đăng ký CartController toàn cục
  debugPaintSizeEnabled = false; // Bật khung debug
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/register', page: () => const RegisterScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/screen', page: () => NavigationScreen()),
        GetPage(
          name: '/cart',
          page: () => const CartScreen(userId: ''),
          middlewares: [AuthMiddleware()],
        ),
        GetPage(
          name: '/order',
          page: () => OrderSummaryScreen(
            userId: Get.find<AuthController>().userId,
            selectedItems: [], // Truyền danh sách sản phẩm mặc định
          ),
          middlewares: [AuthMiddleware()],
        ),
        GetPage(
          name: '/account',
          page: () => const AccountScreen(),
          middlewares: [AuthMiddleware()],
        ),
        GetPage(
          name: '/homeDetail',
          page: () => const CreateOrderScreen(),
          middlewares: [AuthMiddleware()],
        ),
      ],
    );
  }
}

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final AuthController authController = Get.find<AuthController>();
    if (!authController.isLoggedIn.value) {
      return const RouteSettings(name: '/login');
    }
    return null;
  }
}
