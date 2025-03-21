import 'package:flutter/material.dart';

class AccountCategory extends StatelessWidget {
  const AccountCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // Giữ nguyên 2 cột
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Ngăn cuộn riêng lẻ
      crossAxisSpacing: 10, // Khoảng cách ngang giữa các ô
      mainAxisSpacing: 10, // Khoảng cách dọc giữa các ô
      childAspectRatio: 2, // Tỷ lệ chiều rộng/chiều cao (Giúp ô nhỏ lại)
      children: [
        _buildGridItem('Quản lý khách hàng',
            'assets/images/quanlykhachhang.png', Color(0xFF416D19)),
        _buildGridItem('Quản lý sản phẩm', 'assets/images/quanlysanpham.png',
            Color(0xFFFCC135)),
        _buildGridItem('Quản lý đơn hàng', 'assets/images/quanlydonhang.png',
            Color(0xFFAC104E)),
        _buildGridItem(
            'Doanh thu', 'assets/images/doanhthu.png', Color(0xFF0E793E)),
        _buildGridItem(
            'Quản lý nợ', 'assets/images/quanlyno.png', Color(0xFF433878)),
        _buildGridItem('Quản lý trả hàng', 'assets/images/quanlytrahang.png',
            Color(0xFF0A639B)),
      ],
    );
  }

  Widget _buildGridItem(String title, String imagePath, Color borderColor) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 140, // Giới hạn chiều rộng
        maxHeight: 70, // Giới hạn chiều cao (giúp nhỏ lại)
      ),
      decoration: BoxDecoration(
        color: borderColor.withOpacity(0.1), // Màu nền nhạt (10% màu chính)
        borderRadius: BorderRadius.circular(8), // Bo góc
      ),
      child: Row(
        children: [
          // Thanh bên trái màu đậm
          Container(
            width: 8, // Thanh dọc nhỏ bên trái
            decoration: BoxDecoration(
              color: borderColor, // Màu chính
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(imagePath,
                      width: 24, height: 24), // Giảm kích thước icon
                  const SizedBox(height: 4),
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 12, // Giảm kích thước chữ
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
