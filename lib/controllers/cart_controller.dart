import 'package:get/get.dart';

class CartController extends GetxController {
  var userCarts = <String, List<Map<String, dynamic>>>{}.obs;
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

  void updateQuantity(String userId, dynamic productId, int change) {
    if (!userCarts.containsKey(userId) || userCarts[userId] == null) return;

    var cart = userCarts[userId]!;
    int index = cart
        .indexWhere((item) => item['id'].toString() == productId.toString());

    if (index >= 0) {
      int currentQuantity = (cart[index]['quantity'] as num).toInt();
      int newQuantity = (currentQuantity + change).clamp(1, 999);

      cart[index]['quantity'] = newQuantity;

      if (newQuantity == 1 && change < 0) {
        cart.removeAt(index);
      }

      userCarts.refresh();
    }
  }

  void removeFromCart(String userId, dynamic itemId) {
    if (userCarts.containsKey(userId)) {
      userCarts[userId]!
          .removeWhere((item) => item['id'].toString() == itemId.toString());
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
