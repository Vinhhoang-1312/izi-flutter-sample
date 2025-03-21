import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../screens/recheckOrder_screen.dart';

class CreateOrderSummary extends StatefulWidget {
  final int totalPrice;

  const CreateOrderSummary({super.key, required this.totalPrice});

  @override
  _CreateOrderSummaryState createState() => _CreateOrderSummaryState();
}

class _CreateOrderSummaryState extends State<CreateOrderSummary> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat("#,###", "vi_VN");

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tổng phí",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xFF677275),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Chưa tính tiền thu hộ",
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFFA4A2A2),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: currencyFormat.format(widget.totalPrice),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        children: const [
                          TextSpan(
                            text: "đ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.expand_less,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the buttons

              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.yellow.shade100, // Màu vàng nhạt sẵn có

                    fixedSize: const Size(140, 44), // Cố định kích thước
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.bookmark_outline,
                        color: Colors.black,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Lưu đơn",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16), // Adjust spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecheckOrderScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFDA00),
                    fixedSize: const Size(170, 44), // Cố định kích thước
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Tiếp tục",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
