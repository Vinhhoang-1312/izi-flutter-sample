import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Định dạng số tiền VNĐ

class TotalSummary extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const TotalSummary({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    final currencyFormat =
        NumberFormat("#,###", "vi_VN"); // Định dạng số tiền VNĐ
    final totalPrice = cartItems.fold<int>(
      0,
      (sum, item) => item['selected']
          ? sum + (item['price'] as int) * (item['quantity'] as int)
          : sum,
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "${currencyFormat.format(totalPrice)} đ",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Thêm logic thanh toán ở đây
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF712D),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              "Proceed to Payment",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
