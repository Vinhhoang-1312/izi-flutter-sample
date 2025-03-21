import 'package:flutter/material.dart';

class AccountTop extends StatelessWidget {
  const AccountTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.3, -1), // Góc theo thiết kế
          end: Alignment(1, 1),
          colors: [
            Color(0x66D6C8F4), // Màu RGBA 40% opacity
            Color(0x667E60BF),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Giữ hình tròn
              border: Border.all(
                color: Color(0xFF7E60BF), // Màu viền, có thể đổi thành màu khác
                width: 2, // Độ dày của viền
              ),
            ),
            child: const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/anhdaidien.png'),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Hi, Phuong Anh Hoang',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 6), // Khoảng cách giữa chữ và ảnh
                  Image.asset(
                    'assets/images/vaytay.png',
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
              const Text(
                'Chúc bạn một ngày tốt lành',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: 103,
                height: 24,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0x407E60BF), // Màu có 25% opacity
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  '0987654323',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
