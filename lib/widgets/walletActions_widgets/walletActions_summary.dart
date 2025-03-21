import 'package:flutter/material.dart';

class WalletActionsSummary extends StatefulWidget {
  const WalletActionsSummary({super.key});

  @override
  _WalletActionsSummaryState createState() => _WalletActionsSummaryState();
}

class _WalletActionsSummaryState extends State<WalletActionsSummary> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE0FB9D),
              minimumSize:
                  const Size(327, 55), // ✅ Đảm bảo chiều cao nút đủ lớn
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
        ),
      ),
    );
  }
}
