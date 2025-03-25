import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../widgets/order_widgets/order_item.dart';
import '../widgets/order_widgets/order_summary.dart';
import 'cart_screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF712D),
        title: const Text(
          "Thanh toán đơn hàng",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cartController.cartItems.length,
        itemBuilder: (context, index) {
          return OrderItem(
            item: cartController.cartItems[index],
            onUpdateQuantity: (change) {},
            onRemove: () {},
            onToggleSelect: () {},
          );
        },
      ),
    );
  }
}
