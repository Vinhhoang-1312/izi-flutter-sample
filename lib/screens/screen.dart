import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/auth_controller.dart';
import 'package:my_app/screens/account_screen.dart';
import 'package:my_app/screens/login_screen.dart';
import 'package:my_app/screens/wallet_screen.dart';
import 'package:my_app/screens/createOrder_screen.dart';
import 'package:my_app/screens/cart_screen.dart';

class NavigationScreen extends StatelessWidget {
  final AuthController authController =
      Get.find<AuthController>(); // Lấy AuthController

  @override
  Widget build(BuildContext context) {
    String userId =
        authController.userId ?? ""; // Lấy userId, nếu null thì dùng ""

    return Scaffold(
      appBar: AppBar(title: const Text("Chọn Section")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildNavButton(context, "Section 1", LoginScreen()),
            buildNavButton(context, "Section 2",
                CartScreen(userId: userId)), // Truyền userId
            buildNavButton(
                context, "Section 3", CreateOrderScreen()), // Truyền userId
            buildNavButton(context, "Section 4", AccountScreen()),
            buildNavButton(context, "Section 5", WalletScreen()),
          ],
        ),
      ),
    );
  }

  Widget buildNavButton(BuildContext context, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Text(title),
      ),
    );
  }
}
