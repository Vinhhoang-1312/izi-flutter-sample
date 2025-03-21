import 'package:flutter/material.dart';
import '../widgets/payment_widgets/payment_item.dart'; // Đổi tên import
import '../widgets/payment_widgets/total_summary.dart'; // Đổi tên import

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  final List<Map<String, dynamic>> cartItems = [
    {
      "name": "Sản phẩm A",
      "image": "assets/images/calimero.png",
      "price": 150000,
      "original_price": 200000,
      "quantity": 1,
      "selected": false,
    },
    {
      "name": "Sản phẩm A",
      "image": "assets/images/calimero.png",
      "price": 150000,
      "original_price": 200000,
      "quantity": 1,
      "selected": false,
    },
    {
      "name": "Sản phẩm B",
      "image": "assets/images/calimero.png",
      "price": 250000,
      "original_price": 300000,
      "quantity": 2,
      "selected": true,
    },
  ];

  void updateQuantity(int index, int change) {
    if (cartItems[index]["quantity"] + change > 0) {
      cartItems[index]["quantity"] += change;
    }
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
  }

  void toggleSelect(int index) {
    cartItems[index]["selected"] = !cartItems[index]["selected"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Thanh Toán")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return PaymentItem(
                  // Đổi tên class widget
                  item: cartItems[index],
                  onUpdateQuantity: (change) => updateQuantity(index, change),
                  onRemove: () => removeItem(index),
                  onToggleSelect: () => toggleSelect(index),
                );
              },
            ),
          ),
          TotalSummary(cartItems: cartItems),
        ],
      ),
    );
  }
}
