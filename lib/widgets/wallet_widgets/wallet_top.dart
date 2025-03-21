import 'package:flutter/material.dart';
import 'package:my_app/screens/walletActions_screen.dart';

class WalletTop extends StatelessWidget {
  const WalletTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      height: 130, // Độ cao tổng thể
      color: const Color(0xFFE0FB9D), // Màu nền bao phủ toàn màn hình
      child: Center(
        // Căn giữa hoàn toàn
        child: Container(
          width: MediaQuery.of(context).size.width *
              0.85, // 85% chiều rộng màn hình
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            // color: const Color(0xFF4A752C), // Màu xanh
            gradient: const LinearGradient(
              begin: Alignment.topLeft, // Bắt đầu từ góc trên bên trái
              end: Alignment.bottomRight, // Kết thúc ở góc dưới bên phải
              colors: [
                Color(0xFF6A9E47), // Màu xanh nhạt hơn
                Color(0xFF4A752C), // Màu xanh đậm hơn
              ],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Phần hiển thị số dư
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Số dư',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '200.000đ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              // Nút "Nạp/Rút"
              ElevatedButton.icon(
                onPressed: () {
                  // Hành động khi bấm nút
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WalletActionsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(
                  Icons.account_balance_wallet,
                  color: Colors.green,
                  size: 18,
                ),
                label: const Text(
                  'Nạp/Rút',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
