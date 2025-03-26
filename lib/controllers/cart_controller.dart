import 'package:get/get.dart';
import 'package:dio/dio.dart';

class CartController extends GetxController {
  var userCarts = <String, List<Map<String, dynamic>>>{}.obs;
  final Dio _dio = Dio();
  final RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;

  List<Map<String, dynamic>> getCart(String userId) {
    if (userId.isEmpty) {
      Get.snackbar("Lỗi", "userId không hợp lệ. Vui lòng đăng nhập lại.");
      return [];
    }
    return userCarts[userId] ?? [];
  }

  List<Map<String, dynamic>> getSelectedItems(String userId) {
    return userCarts[userId]
            ?.where((item) => item['selected'] == true)
            .toList() ??
        [];
  }

  void addToCart(String userId, Map<String, dynamic> product) {
    if (userId.isEmpty) {
      Get.snackbar("Lỗi", "userId không hợp lệ. Vui lòng đăng nhập lại.");
      return;
    }

    if (!userCarts.containsKey(userId)) {
      userCarts[userId] = [];
    }

    int index =
        userCarts[userId]!.indexWhere((item) => item['id'] == product['id']);
    if (index >= 0) {
      userCarts[userId]![index]['quantity'] += 1;
    } else {
      userCarts[userId]!.add({...product, 'quantity': 1, 'selected': false});
    }

    userCarts.refresh();
  }

  Future<void> updateQuantity(
      String userId, dynamic productId, int change) async {
    if (!userCarts.containsKey(userId) || userCarts[userId] == null) return;

    var cart = userCarts[userId]!;
    int index = cart
        .indexWhere((item) => item['id'].toString() == productId.toString());

    if (index >= 0) {
      int currentQuantity = (cart[index]['quantity'] as num).toInt();
      int newQuantity = (currentQuantity + change).clamp(1, 999);

      if (newQuantity == 1 && change < 0) {
        // Nếu số lượng là 1 và nhấn "-", không giảm nữa
        Get.snackbar("Thông báo", "Không thể giảm số lượng dưới 1.");
        return;
      }

      try {
        // Gửi yêu cầu PUT đến API để cập nhật số lượng
        await _dio.put(
          'https://dummyjson.com/carts/$userId',
          data: {
            'productId': productId,
            'quantity': newQuantity,
          },
        );

        cart[index]['quantity'] = newQuantity;
        userCarts.refresh(); // Làm mới danh sách
      } catch (e) {
        print('Lỗi khi cập nhật số lượng: $e');
      }
    } else {
      print('Sản phẩm không tồn tại trong giỏ hàng.');
    }
  }

  Future<void> removeFromCart(String userId, dynamic productId) async {
    if (!userCarts.containsKey(userId)) return;

    // Gửi yêu cầu DELETE đến API để xóa sản phẩm
    try {
      await _dio.delete('https://dummyjson.com/carts/$userId', data: {
        'productId': productId,
      });

      userCarts[userId]!
          .removeWhere((item) => item['id'].toString() == productId.toString());
      userCarts.refresh();
    } catch (e) {
      print('Lỗi khi xóa sản phẩm: $e');
    }
  }

  void clearCart(String userId) {
    userCarts[userId] = [];
    userCarts.refresh();
  }

  void removeSelectedItems(String userId) {
    if (userCarts.containsKey(userId)) {
      userCarts[userId]!.removeWhere((item) => item['selected']);
      userCarts.refresh();
    }
  }

  void addItems(List<Map<String, dynamic>> items) {
    cartItems.assignAll(items);
  }

  List<Map<String, dynamic>> get selectedItems =>
      cartItems.where((item) => item['selected'] == true).toList();
}
