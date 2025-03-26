import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../widgets/bottom_navbar.dart';
import 'cart_screen.dart';
import 'order_summary_screen.dart'; // Import lại OrderSummaryScreen
import 'home_page.dart';
import 'account_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Chỉ số của trang hiện tại
  int cartItemCount = 5; // Số lượng sản phẩm trong giỏ hàng

  final AuthController authController = Get.find<AuthController>();

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    // Khởi tạo _pages
    _pages = [
      HomePage(),
      OrderSummaryScreen(
        userId: authController.userId,
        selectedItems: [], // Truyền danh sách sản phẩm mặc định
      ),
      CartScreen(userId: authController.userId), // Truyền userId hợp lệ
      const AccountScreen(),
    ];
  }

  // Định nghĩa phương thức _onItemTapped
  void _onItemTapped(int index) {
    if (index != 0 && !authController.isLoggedIn.value) {
      // Nếu người dùng chưa đăng nhập và chọn trang yêu cầu đăng nhập
      Get.to(() => const LoginScreen());
      return;
    }

    setState(() {
      _selectedIndex = index; // Cập nhật chỉ số của trang hiện tại
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomePage(key: ValueKey("home_page")), // Đảm bảo key duy nhất
          OrderSummaryScreen(
            userId: authController.userId,
            selectedItems: [], // Truyền danh sách sản phẩm mặc định
            key: ValueKey("order_summary_screen"),
          ),
          CartScreen(
              userId: authController.userId, key: ValueKey("cart_screen")),
          AccountScreen(key: ValueKey("account_screen")),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped, // Truyền phương thức _onItemTapped
        cartItemCount: cartItemCount, // Truyền số lượng giỏ hàng
      ),
    );
  }
}
