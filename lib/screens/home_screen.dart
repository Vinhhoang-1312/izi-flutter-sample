import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../widgets/bottom_navbar.dart';
import 'cart_screen.dart';
import 'order_screen.dart';
import 'home_page.dart';
import 'account_screen.dart';
import 'login_screen.dart'; // Import màn hình đăng nhập

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int cartItemCount = 5; // Số lượng sản phẩm trong giỏ hàng

  final AuthController authController =
      Get.find<AuthController>(); // Lấy AuthController

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    // Kiểm tra và gán userId
    final String userId = authController.userId;
    if (userId.isEmpty) {
      Get.snackbar("Lỗi", "Không tìm thấy userId. Vui lòng đăng nhập lại.");
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAll(() => const LoginScreen()); // Điều hướng về trang đăng nhập
      });
      return;
    }

    _pages = [
      HomePage(),
      const OrderScreen(),
      CartScreen(userId: userId), // Truyền userId hợp lệ
      const AccountScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        cartItemCount: cartItemCount, // Truyền số lượng giỏ hàng
      ),
    );
  }
}
