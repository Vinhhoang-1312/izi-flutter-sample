import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Định dạng số tiền VNĐ
import 'package:flutter_switch/flutter_switch.dart';

class OrderSummary extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final num totalPrice;
  final num discount;
  final num finalPrice;

  const OrderSummary({
    super.key,
    required this.cartItems,
    required this.totalPrice,
    required this.discount,
    required this.finalPrice,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat =
        NumberFormat("#,###", "vi_VN"); // Định dạng số tiền VNĐ

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ), // Remove horizontal padding
      width: double.infinity, // Chiếm toàn bộ chiều rộng màn hình
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16), // Add horizontal padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none, // Cho phép phần tử tràn ra một chút
                  children: [
                    // Container chính
                    Container(
                      padding: const EdgeInsets.fromLTRB(
                          12, 16, 12, 12), // Tạo khoảng trống trên
                      decoration: BoxDecoration(
                        color: const Color(0x1A0015FF), // Màu xanh lam nhạt
                        borderRadius:
                            BorderRadius.circular(12), // Bo góc tổng thể
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10), // Đẩy nội dung xuống một chút
                          Text(
                            "Mã giảm giá 30k đơn hàng ở BHX từ 450k - Thực phẩm tươi sống",
                            style: TextStyle(
                                color: Color(0xFF0015FF), fontSize: 14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),

                    // Nhãn "-30,000đ" ở góc trên bên trái
                    Positioned(
                      top: 1, // Giữ nó nằm trong khung
                      left: 1, // Giữ nó sát mép nhưng không tràn ra ngoài
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: const BoxDecoration(
                          color: Color(0xFF0015FF), // Màu nền xanh
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10), // Bo góc trên trái
                            bottomRight:
                                Radius.circular(10), // Bo góc dưới phải
                          ),
                        ),
                        child: const Text(
                          "-30,000đ",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    // Mũi tên ở góc trên bên phải
                    Positioned(
                      top: 6, // Điều chỉnh cho nó không bị lệch
                      right: 6, // Đẩy vào trong một chút để không tràn ra ngoài
                      child: Container(
                        padding: const EdgeInsets.all(
                            4), // Cho icon có chút không gian
                        decoration: const BoxDecoration(
                          // color: Color(
                          //     0x1A0015FF), // 10% độ trong suốt của màu xanh
                          shape: BoxShape.circle, // Làm bo tròn icon cho đẹp
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Color(0xFF0015FF),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 24,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Dùng 200 điểm thưởng",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    FlutterSwitch(
                      width: 32, // Chiều rộng công tắc
                      height: 18, // Chiều cao công tắc
                      toggleSize: 12, // Kích thước nút tròn bên trong
                      value: true,
                      activeColor: const Color(0xFF259329), // Màu khi bật
                      onToggle: (bool value) {
                        // Thêm logic thay đổi điểm thưởng ở đây
                      },
                    )
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(
            width: double.infinity, // Chiếm toàn bộ chiều rộng màn hình
            child: Divider(
              thickness: 0.25, // Độ dày của đường gạch
              color: Color(0xFFA4A2A2), // Màu xám
              height: 1, // Chiều cao của Divider
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16), // Add horizontal padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Tổng tiền hàng:",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        Text(
                          "${currencyFormat.format(totalPrice)} đ",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Giảm giá:",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        Text(
                          "-${currencyFormat.format(discount)} đ",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(height: 24, thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Tổng thanh toán:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.red),
                        ),
                        Text(
                          "${currencyFormat.format(finalPrice)} đ",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Thêm logic thanh toán ở đây
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF712D),
                        minimumSize:
                            const Size(201, 44), // Set width and height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Bo góc 8px
                        ),
                      ),
                      child: const Text(
                        "Đặt hàng",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
