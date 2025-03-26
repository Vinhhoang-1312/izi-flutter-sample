import 'package:flutter/material.dart';

class OrderSummaryScreen extends StatelessWidget {
  final String userId;
  final List<Map<String, dynamic>> selectedItems;

  const OrderSummaryScreen({
    super.key,
    required this.userId,
    required this.selectedItems,
  });

  @override
  Widget build(BuildContext context) {
    final totalPrice = selectedItems.fold<num>(
      0,
      (sum, item) => sum + (item['price'] as num) * (item['quantity'] as num),
    );
    final discount = 50000; // Giảm giá cố định
    final finalPrice = totalPrice - discount;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF712D),
        title: const Text(
          "Xác nhận đơn hàng",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: selectedItems.length,
              itemBuilder: (context, index) {
                final item = selectedItems[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 4,
                        spreadRadius: 1,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          item['thumbnail'] ?? "https://via.placeholder.com/90",
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'] ?? "Tên sản phẩm",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Số lượng: ${item['quantity']}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "${item['price']} đ",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tổng tiền hàng:",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      "$totalPrice đ",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Giảm giá:",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      "-$discount đ",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 24, thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tổng thanh toán:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      "$finalPrice đ",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Thêm logic POST lên API tại đây
                    print("POST sản phẩm đã chọn lên API với userId: $userId");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF712D),
                    minimumSize: const Size(double.infinity, 44),
                  ),
                  child: const Text(
                    "Xác nhận đặt hàng",
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
