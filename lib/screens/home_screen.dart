import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../widgets/bottom_navbar.dart';
import 'cart_screen.dart';
import 'order_screen.dart';
import 'home_page.dart';
import 'account_screen.dart';

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
    _pages = [
      HomePage(),
      // const OrderScreen(),
      CartScreen(
          userId:
              authController.userId ?? ""), // Truyền userId từ AuthController
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
