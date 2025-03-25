import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import thư viện định dạng số

class OrderItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final Function(int) onUpdateQuantity;
  final Function() onRemove;
  final Function() onToggleSelect;

  const OrderItem({
    super.key,
    required this.item,
    required this.onUpdateQuantity,
    required this.onRemove,
    required this.onToggleSelect,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat("#,###", "vi_VN"); // Định dạng số tiền

    return Padding(
      key: ValueKey(item['id']), // Đảm bảo key duy nhất
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hình ảnh sản phẩm
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(
                    item["image"]), // Use AssetImage for local images
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Cột chứa thông tin sản phẩm
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["name"],
                  style: const TextStyle(fontSize: 16),
                  maxLines: 2, // Limit to 2 lines
                  overflow:
                      TextOverflow.ellipsis, // Show ellipsis if text overflows
                ),
                const SizedBox(height: 4),

                // Hàng chứa giá tiền và số lượng, dùng spaceBetween để căn góc
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Giá tiền màu cam
                    Text(
                      "${currencyFormat.format(item["price"])}đ",
                      style: const TextStyle(
                        color: Color(0xFFFF712D),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Số lượng sản phẩm
                    Text(
                      "x${item["quantity"]}",
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),

                // Giá gốc nếu có
                if (item["original_price"] != null)
                  Text(
                    "${currencyFormat.format(item["original_price"])}đ",
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
