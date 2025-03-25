import 'package:get/get.dart';
import 'cart_controller.dart'; // 🔥 Thêm dòng này để import CartController

class OrderController extends GetxController {
  final RxList<Map<String, dynamic>> orders = <Map<String, dynamic>>[].obs;

  void placeOrder(String userId, List<Map<String, dynamic>> cartItems) {
    final selectedItems = cartItems.where((item) => item['selected']).toList();

    if (selectedItems.isEmpty) {
      Get.snackbar("Thông báo", "Bạn chưa chọn sản phẩm nào để đặt hàng.");
      return;
    }

    final order = {
      'userId': userId,
      'items': selectedItems,
      'totalPrice': selectedItems.fold<num>(
          0,
          (sum, item) =>
              (sum ?? 0) +
              (((item['price'] as num?) ?? 0) *
                  ((item['quantity'] as num?) ?? 0))),
      'timestamp': DateTime.now().toString(),
    };

    orders.add(order);
    Get.snackbar("Thành công", "Đơn hàng của bạn đã được đặt.");

    // Xóa sản phẩm đã đặt khỏi giỏ hàng
    Get.find<CartController>().removeSelectedItems(userId);
  }
}
