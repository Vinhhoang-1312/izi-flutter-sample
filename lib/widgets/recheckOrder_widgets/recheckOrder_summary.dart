import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecheckOrderSummary extends StatefulWidget {
  final int totalPrice;

  const RecheckOrderSummary({super.key, required this.totalPrice});

  @override
  _RecheckOrderSummaryState createState() => _RecheckOrderSummaryState();
}

class _RecheckOrderSummaryState extends State<RecheckOrderSummary> {
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
            const SizedBox(height: 16),
            Center(
              // Đưa toàn bộ nút vào Center
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFDA00),
                  minimumSize: const Size(270, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Tạo đơn hàng",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
