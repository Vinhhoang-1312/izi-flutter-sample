import 'package:flutter/material.dart';
import '../widgets/cart_widgets/cart_item.dart'; // Cập nhật đường dẫn
import '../widgets/cart_widgets/cart_summary.dart'; // Cập nhật đường dẫn
import 'order_screen.dart'; // Import màn hình thanh toán
import 'home_screen.dart'; // Import màn hình trang chủ
import '../controllers/cart_controller.dart'; // Import CartController
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController cartController = Get.find<CartController>();
  final String userId = "user123"; // Example user ID

  bool isAllSelected = false;

  void updateQuantity(int index, int change) {
    setState(() {
      cartController.updateQuantity(
          userId, cartController.getCart(userId)[index]['id'], change);
    });
  }

  void toggleSelectAll(bool? value) {
    setState(() {
      isAllSelected = value ?? false;
      for (var item in cartController.getCart(userId)) {
        item['selected'] = isAllSelected;
      }
    });
    cartController.userCarts.refresh();
  }

  void toggleSelectItem(int index) {
    setState(() {
      cartController.getCart(userId)[index]['selected'] =
          !cartController.getCart(userId)[index]['selected'];
      isAllSelected =
          cartController.getCart(userId).every((item) => item['selected']);
    });
    cartController.userCarts.refresh();
  }

  void removeItem(int index) {
    setState(() {
      cartController.removeFromCart(
          userId, cartController.getCart(userId)[index]['id']);
    });
  }

  void clearCart() {
    setState(() {
      cartController.clearCart(userId);
    });
  }

  void navigateToPayment() {
    if (cartController.getSelectedItems(userId).isEmpty) {
      Get.snackbar(
          "Thông báo", "Vui lòng chọn ít nhất một sản phẩm để đặt hàng.");
      return;
    }
    Get.to(() => const OrderScreen());
  }

  void navigateToHome() {
    Get.off(() => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = cartController.getCart(userId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF712D),
        centerTitle: true, // Đặt tiêu đề ở giữa
        title: Text("Giỏ hàng (${cartItems.length})",
            style: const TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white, // Đổi màu icon thành trắng
          ),
          onPressed: navigateToHome, // Điều hướng về trang chủ
        ),
        actions: [
          TextButton(
            onPressed: clearCart,
            child:
                const Text("Xóa tất cả", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return CartItem(
                    item: cartItems[index],
                    onUpdateQuantity: (change) => updateQuantity(index, change),
                    onToggleSelect: () => toggleSelectItem(index),
                    onRemove: () => removeItem(index),
                    isSelected: cartItems[index]['selected'],
                  );
                },
              ),
            ),
            CartSummary(
              totalPrice: cartItems.fold<num>(
                0,
                (sum, item) => item['selected']
                    ? sum + (item['price'] as num) * (item['quantity'] as num)
                    : sum,
              ),
              isAllSelected: isAllSelected,
              onSelectAll: toggleSelectAll,
              onOrderPressed:
                  navigateToPayment, // Ensure this callback is correct
              userId: userId,
              cartItems: cartItems,
            ),
          ],
        ),
      ),
    );
  }
}
