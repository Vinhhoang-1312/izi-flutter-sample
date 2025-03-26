import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import 'order_summary_screen.dart';
import 'home_screen.dart';
import '../widgets/cart_widgets/cart_item.dart';
import '../widgets/cart_widgets/cart_summary.dart';

class CartScreen extends StatefulWidget {
  final String userId;

  const CartScreen({super.key, required this.userId});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    final cartItems = cartController.getCart(widget.userId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF712D),
        title: const Text("Giỏ hàng"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Get.back(), // Thay thế Navigator.pop(context)
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItem(
                  key: ValueKey(cartItems[index]['id']),
                  item: cartItems[index],
                  onUpdateQuantity: (change) async {
                    await cartController.updateQuantity(
                        widget.userId, cartItems[index]['id'], change);
                    setState(() {}); // Làm mới giao diện sau khi cập nhật
                  },
                  onRemove: () async {
                    await cartController.removeFromCart(
                        widget.userId, cartItems[index]['id']);
                    setState(() {}); // Làm mới giao diện sau khi xóa
                  },
                  onToggleSelect: () {
                    setState(() {
                      cartItems[index]['selected'] =
                          !(cartItems[index]['selected'] ?? false);
                    });
                  },
                  isSelected: cartItems[index]['selected'] ?? false,
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
            isAllSelected: cartItems.every((item) => item['selected'] == true),
            onSelectAll: (value) {
              setState(() {
                for (var item in cartItems) {
                  item['selected'] = value;
                }
              });
            },
            onOrderPressed: () {
              final selectedItems =
                  cartController.getSelectedItems(widget.userId);
              if (selectedItems.isEmpty) {
                Get.snackbar(
                    "Thông báo", "Vui lòng chọn sản phẩm để đặt hàng.");
                return;
              }
              Get.to(() => OrderSummaryScreen(
                    userId: widget.userId,
                    selectedItems: selectedItems,
                  ));
            },
            userId: widget.userId,
            cartItems: cartItems,
          ),
        ],
      ),
    );
  }
}
