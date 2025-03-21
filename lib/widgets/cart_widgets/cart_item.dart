import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import thư viện định dạng số

class CartItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final Function(int) onUpdateQuantity;
  final Function() onRemove;
  final Function() onToggleSelect;
  final bool isSelected; // Thuộc tính mới
  final EdgeInsetsGeometry quantityPadding; // Thuộc tính mới

  const CartItem({
    super.key,
    required this.item,
    required this.onUpdateQuantity,
    required this.onRemove,
    required this.onToggleSelect,
    required this.isSelected, // Thuộc tính mới
    this.quantityPadding = const EdgeInsets.symmetric(
        horizontal: 4, vertical: 2), // Giá trị điều chỉnh
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat("#,###", "vi_VN"); // Định dạng số tiền

    return Container(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 90,
            child: GestureDetector(
              onTap: onToggleSelect,
              child: Center(
                // Sử dụng Center để căn giữa phần tử
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0xFFFF712D), width: 2),
                  ),
                  child: isSelected
                      ? const Icon(Icons.circle,
                          color: Color(0xFFFF712D), size: 16)
                      : null,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0), // Thêm padding
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item["image"],
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item["name"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xFF0015FF)),
                        color: Color(0xFFF6F6F7),
                        // #F6F6F7
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: onRemove,
                        icon: const Icon(Icons.delete,
                            color: Color(0xFF0015FF), size: 20),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                // Hiển thị giá có dấu phẩy và số lượng
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${currencyFormat.format(item["price"])}đ", // Định dạng giá
                          style: const TextStyle(
                            color: Color(0xFFFF712D),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (item["original_price"] != null)
                          Text(
                            "${currencyFormat.format(item["original_price"])}đ", // Định dạng giá gốc
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        // Nút giảm số lượng (-)
                        Container(
                          width: 28,
                          height: 28,
                          decoration: const BoxDecoration(
                            color: Colors.white, // Nền trắng
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                            border: Border(
                              top: BorderSide(
                                  color: Color(0xFFA4A2A2), width: 0.7),
                              left: BorderSide(
                                  color: Color(0xFFA4A2A2), width: 0.7),
                              bottom: BorderSide(
                                  color: Color(0xFFA4A2A2), width: 0.7),
                            ),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () => onUpdateQuantity(-1),
                            icon: const Icon(Icons.remove,
                                size: 14, color: Colors.black),
                          ),
                        ),

                        // Ô số lượng
                        Container(
                          width: 44,
                          height: 28,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF3ED), // Nền cam nhạt
                            border: Border.all(
                                color: Color(0xFFA4A2A2), width: 0.7),
                          ),
                          child: Text(
                            "${item["quantity"]}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xFFFF712D), // Màu cam
                            ),
                          ),
                        ),

                        // Nút tăng số lượng (+)
                        Container(
                          width: 28,
                          height: 28,
                          decoration: const BoxDecoration(
                            color: Colors.white, // Nền trắng
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            border: Border(
                              top: BorderSide(
                                  color: Color(0xFFA4A2A2), width: 0.7),
                              right: BorderSide(
                                  color: Color(0xFFA4A2A2), width: 0.7),
                              bottom: BorderSide(
                                  color: Color(0xFFA4A2A2), width: 0.7),
                            ),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () => onUpdateQuantity(1),
                            icon: const Icon(Icons.add,
                                size: 14, color: Colors.black),
                          ),
                        ),
                      ],
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
