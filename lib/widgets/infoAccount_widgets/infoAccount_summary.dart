import 'package:flutter/material.dart';

class InfoAccountSummary extends StatefulWidget {
  const InfoAccountSummary({super.key});

  @override
  _InfoAccountSummaryState createState() => _InfoAccountSummaryState();
}

class _InfoAccountSummaryState extends State<InfoAccountSummary> {
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
              backgroundColor: const Color(0xFFD2C2CF),
              minimumSize:
                  const Size(327, 55), // ✅ Đảm bảo chiều cao nút đủ lớn
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
      ),
    );
  }
}
