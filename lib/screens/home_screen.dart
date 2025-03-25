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
  int _selectedIndex = 0; // Chỉ số của trang hiện tại
  int cartItemCount = 5; // Số lượng sản phẩm trong giỏ hàng

  final AuthController authController =
      Get.find<AuthController>(); // Lấy AuthController

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    // Kiểm tra và gán userId
    final String? userId = authController.userId.isNotEmpty
        ? authController.userId
        : null; // Kiểm tra nếu userId rỗng

    if (userId == null) {
      // Điều hướng về trang đăng nhập nếu userId không hợp lệ
      Future.delayed(Duration.zero, () {
        Get.offAll(() => const LoginScreen());
      });
    } else {
      // Khởi tạo _pages nếu userId hợp lệ
      _pages = [
        HomePage(),
        const OrderScreen(),
        CartScreen(userId: userId), // Truyền userId hợp lệ
        const AccountScreen(),
      ];
    }
  }

  // Định nghĩa phương thức _onItemTapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Cập nhật chỉ số của trang hiện tại
    });
  }

  @override
  Widget build(BuildContext context) {
    // Hiển thị màn hình tạm thời nếu _pages chưa được khởi tạo
    if (!authController.isLoggedIn.value || authController.userId.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // Hiển thị vòng tròn chờ
        ),
      );
    }

    return Scaffold(
      body:
          _pages[_selectedIndex], // Hiển thị trang tương ứng với _selectedIndex
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped, // Truyền phương thức _onItemTapped
        cartItemCount: cartItemCount, // Truyền số lượng giỏ hàng
      ),
    );
  }
}
