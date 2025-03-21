import 'package:flutter/material.dart';

class WalletItem extends StatelessWidget {
  const WalletItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDateSection("Lịch Sử Giao Dịch"),
          _buildDateSection("16/10/2023"),
          _buildTransactionItem("Yêu cầu rút tiền", "Thất bại", "200,000 đ",
              Colors.red, Icons.error),
          _buildTransactionItem("Nạp tiền vào ví", "Thành công", "+200,000 đ",
              Colors.green, Icons.check_circle),
          _buildTransactionItem("Nạp tiền vào ví", "Chờ duyệt", "200,000 đ",
              Colors.orange, Icons.hourglass_bottom),
          const SizedBox(height: 8),
          _buildDateSection("14/10/2023"),
          _buildTransactionItem("Yêu cầu rút tiền", "Thất bại", "200,000 đ",
              Colors.red, Icons.error),
          _buildTransactionItem("Nạp tiền vào ví", "Thành công", "+200,000 đ",
              Colors.green, Icons.check_circle),
          const SizedBox(height: 8),
          _buildDateSection("13/10/2023"),
          _buildTransactionItem("Yêu cầu rút tiền", "Thất bại", "200,000 đ",
              Colors.red, Icons.error),
          _buildTransactionItem("Nạp tiền vào ví", "Thành công", "+200,000 đ",
              Colors.green, Icons.check_circle),
          const SizedBox(height: 8),
          _buildDateSection("12/10/2023"),
          _buildTransactionItem("Yêu cầu rút tiền", "Thất bại", "200,000 đ",
              Colors.red, Icons.error),
          _buildTransactionItem("Nạp tiền vào ví", "Thành công", "+200,000 đ",
              Colors.green, Icons.check_circle),
        ],
      ),
    );
  }

  Widget _buildDateSection(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        date,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildTransactionItem(String title, String status, String amount,
      Color statusColor, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, color: statusColor),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  status,
                  style: TextStyle(
                      fontSize: 14,
                      color: statusColor,
                      fontWeight: FontWeight.w500),
                ),
                const Text(
                  "15:45 - 10/12/2022",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: statusColor),
          ),
        ],
      ),
    );
  }
}
