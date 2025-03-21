import 'package:flutter/material.dart';
import 'package:my_app/screens/account_screen.dart';
import 'package:my_app/screens/login_screen.dart';
import 'package:my_app/screens/wallet_screen.dart';
import './createOrder_screen.dart';

import './cart_screen.dart';

class NavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chọn Section")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildNavButton(context, "Section 1", LoginScreen()),
            buildNavButton(context, "Section 2", CartScreen()),
            buildNavButton(context, "Section 3", CreateOrderScreen()),
            buildNavButton(context, "Section 4", AccountScreen()),
            buildNavButton(context, "Section 5", WalletScreen()),
          ],
        ),
      ),
    );
  }

  Widget buildNavButton(BuildContext context, String title, Widget screen) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
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
