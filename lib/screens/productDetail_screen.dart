import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';
import '../controllers/cart_controller.dart'; // Import CartController

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;
  final String userId;
  final AuthService _authService = AuthService();
  final CartController cartController =
      Get.put(CartController()); // Sử dụng GetX

  ProductDetailScreen({super.key, required this.product, required this.userId});

  @override
  Widget build(BuildContext context) {
    if (!_authService.isLoggedIn()) {
      Future.delayed(Duration.zero, () {
        Get.offAll(() => const LoginScreen());
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(product["title"])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product["thumbnail"], height: 200, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text("Giá: ${product["price"]}đ",
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold)),
            Text("Giảm giá: -${product["discountPercentage"]}%",
                style: const TextStyle(fontSize: 16, color: Colors.green)),
            Text("Đánh giá: ⭐ ${product["rating"].toStringAsFixed(1)}",
                style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 10),
            Text("User ID: $userId"),
            const SizedBox(height: 20),

            // Nút thêm vào giỏ hàng
            ElevatedButton.icon(
              onPressed: () {
                print("Thêm sản phẩm: ${product.toString()}"); // Debug dữ liệu

                if (product["title"] == null ||
                    product["thumbnail"] == null ||
                    product["price"] == null) {
                  Get.snackbar("Lỗi", "Dữ liệu sản phẩm không hợp lệ!");
                  return;
                }
                cartController.addToCart(userId, product); // Thêm theo userId
                Get.snackbar(
                  "Thành công",
                  "Sản phẩm đã được thêm vào giỏ hàng",
                  snackPosition: SnackPosition.TOP,
                  duration:
                      const Duration(seconds: 2), // Hiện thông báo trong 2 giây
                );
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text("Thêm vào giỏ hàng"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
