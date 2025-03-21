import 'package:flutter/material.dart';
import '../widgets/cart_widgets/cart_item.dart'; // Cập nhật đường dẫn
import '../widgets/cart_widgets/cart_summary.dart'; // Cập nhật đường dẫn
import 'order_screen.dart'; // Import màn hình thanh toán
import 'home_screen.dart'; // Import màn hình trang chủ

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {
      "image": "assets/images/calimero.png",
      "name": "Calimero mix màu - 59091",
      "price": 47000,
      "original_price": null,
      "quantity": 1,
      "selected": false,
    },
    {
      "image": "assets/images/calimero.png",
      "name": "Sữa tắm Lifebuoy sữa dưỡng ấm 1.4kg - 75858",
      "price": 47000,
      "original_price": 69000,
      "quantity": 1,
      "selected": false,
    },
    {
      "image": "assets/images/calimero.png",
      "name": "Sữa tắm Lifebuoy sữa dưỡng ấm 1.4kg - 75858",
      "price": 47000,
      "original_price": 69000,
      "quantity": 1,
      "selected": false,
    },
    {
      "image": "assets/images/calimero.png",
      "name": "Bánh Mandu CJ Bibigo thịt bắp 350g - 01350",
      "price": 37900,
      "original_price": 54600,
      "quantity": 1,
      "selected": false,
    },
    {
      "image": "assets/images/calimero.png",
      "name": "Sandwich sữa 300g - 55120",
      "price": 14000,
      "original_price": null,
      "quantity": 2,
      "selected": false,
    },
  ];

  bool isAllSelected = false; // Trạng thái mới

  void updateQuantity(int index, int change) {
    setState(() {
      cartItems[index]['quantity'] += change;
      if (cartItems[index]['quantity'] <= 0) {
        cartItems.removeAt(index);
      }
    });
  }

  void toggleSelectAll(bool? value) {
    setState(() {
      isAllSelected = value ?? false;
      for (var item in cartItems) {
        item['selected'] = isAllSelected;
      }
    });
  }

  void toggleSelectItem(int index) {
    setState(() {
      cartItems[index]['selected'] = !cartItems[index]['selected'];
      isAllSelected = cartItems.every((item) => item['selected']);
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void clearCart() {
    setState(() {
      cartItems.clear();
    });
  }

  void navigateToPayment() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OrderScreen()),
    );
  }

  void navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          )
        ],
      ),
      body: SafeArea(
        // Bọc với SafeArea
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
                    isSelected: cartItems[index]
                        ['selected'], // Truyền thuộc tính mới
                  );
                },
              ),
            ),
            CartSummary(
              totalPrice: cartItems.fold<int>(
                0,
                (sum, item) => item['selected']
                    ? sum + (item['price'] as int) * (item['quantity'] as int)
                    : sum,
              ),
              onSelectAll: toggleSelectAll, // Truyền thuộc tính mới
              isAllSelected: isAllSelected, // Truyền thuộc tính mới
              onOrderPressed: navigateToPayment, // Truyền thuộc tính mới
            ),
          ],
        ),
      ),
    );
  }
}
