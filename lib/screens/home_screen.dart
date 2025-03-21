import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart'; // Import BottomNavBar
import 'cart_screen.dart'; // Import màn hình giỏ hàng
import 'order_screen.dart'; // Import màn hình đơn hàng
import 'home_page.dart'; // Import trang chủ

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int cartItemCount = 5; // Số lượng sản phẩm trong giỏ hàng (ví dụ)

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomePage(),
      const OrderScreen(), // Chuyển sang màn hình đơn hàng
      const CartScreen(), // Chuyển sang màn hình giỏ hàng
      const Center(child: Text("Tài khoản")),
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
