import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Định dạng số tiền VNĐ
import '../../controllers/order_controller.dart';
import 'package:get/get.dart';

class CartSummary extends StatefulWidget {
  final num totalPrice;
  final bool isAllSelected;
  final Function(bool?) onSelectAll; // Corrected type
  final VoidCallback onOrderPressed; // Thuộc tính mới
  final String userId; // ➕ Thêm userId
  final List<Map<String, dynamic>> cartItems; // ➕ Thêm cartItems

  const CartSummary({
    super.key,
    required this.totalPrice,
    required this.isAllSelected,
    required this.onSelectAll,
    required this.onOrderPressed, // Thuộc tính mới
    required this.userId, // ➕ Nhận userId
    required this.cartItems, // ➕ Nhận danh sách sản phẩm
  });

  @override
  _CartSummaryState createState() => _CartSummaryState();
}

class _CartSummaryState extends State<CartSummary> {
  final currencyFormat = NumberFormat("#,###", "vi_VN"); // Format tiền VNĐ

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 16, horizontal: 16), // Remove horizontal padding
      width: double.infinity, // Chiếm toàn bộ chiều rộng màn hình
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade400, width: 1)),
      ),
      child: Column(
        children: [
          // Nút "Áp dụng ưu đãi để được giảm giá"
          GestureDetector(
            onTap: () {
              // Thêm logic áp dụng ưu đãi ở đây
            },
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  color:
                      const Color(0xFF0015FF).withOpacity(0.1), // Xanh nhạt 10%
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "   Áp dụng ưu đãi để được giảm giá",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF0015FF), // Màu chữ xanh đậm
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 8), // Thêm khoảng cách bên phải icon
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Color(0xFF0015FF),
                      ),
                    ),
                  ],
                )),
          ),
          const SizedBox(height: 10),

          // Dùng điểm thưởng
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 20),
              const SizedBox(width: 5),
              const Text("Dùng 200 điểm thưởng"),
              const Spacer(),
              Switch(value: false, onChanged: (value) {}),
            ],
          ),
          const Divider(),

          // Checkbox chọn tất cả, tổng giá tiền và nút đặt hàng
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => widget.onSelectAll(!widget.isAllSelected),
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: widget.isAllSelected
                              ? const Color(0xFFFF712D)
                              : Colors.grey,
                          width: 2,
                        ),
                        color: widget.isAllSelected
                            ? const Color(0xFFFF712D)
                            : Colors.transparent,
                      ),
                      child: widget.isAllSelected
                          ? const Icon(Icons.check,
                              size: 16, color: Colors.white)
                          : null,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('Tất cả'),
                ],
              ),
              Row(
                children: [
                  Text(
                    "${currencyFormat.format(widget.totalPrice.round())} đ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(width: 5), // Điều chỉnh khoảng cách
                  ElevatedButton(
                    onPressed: () {
                      // ✅ Kiểm tra giá trị trước khi đặt hàng
                      print("🔍 Kiểm tra dữ liệu trước khi đặt hàng:");
                      print("📌 User ID: ${widget.userId}");
                      print("🛒 Cart Items: ${widget.cartItems}");
                      final orderController =
                          Get.find<OrderController>(); // Lấy OrderController
                      orderController.placeOrder(
                          widget.userId, widget.cartItems);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF712D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(137, 44),
                    ),
                    child: const Text("Đặt hàng",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
