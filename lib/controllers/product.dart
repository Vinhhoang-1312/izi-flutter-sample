import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'dart:math'; // Import thư viện để random
import '../services/api_service.dart';
import '../models/product.dart';
import '../services/auth_service.dart';

class ProductController extends GetxController {
  late AuthService authService;
  var productList = [].obs; // Danh sách sản phẩm
  var isLoading = false.obs; // Trạng thái tải dữ liệu
  // var cart = <Product>[].obs; // 🔥 Giỏ hàng lưu danh sách sản phẩm
  final Dio _dio = Dio(); // Khởi tạo Dio
  var bestSellingProducts = [].obs; // Danh sách sản phẩm bán chạy nhất
  var highestDiscountProducts =
      [].obs; // Danh sách sản phẩm có discount cao nhất
  // final ApiService _apiService = ApiService();

  final String baseUrl = 'https://dummyjson.com/products'; // URL API

  @override
  void onInit() {
    fetchProducts(); // Lấy danh sách sản phẩm khi khởi tạo
    super.onInit();
  }

  // Lấy toàn bộ danh sách sản phẩm
  void fetchProducts() async {
    try {
      isLoading(true);
      var response = await _dio.get(baseUrl);
      if (response.statusCode == 200) {
        List<dynamic> products = response.data['products'];

        // 🟢 Danh sách thành phố để chọn ngẫu nhiên
        List<String> locations = [
          "Thành phố Hồ Chí Minh",
          "Thành phố Đà Nẵng",
          "Hà Nội",
          "Huế"
        ];
        //  Danh sách thành phố để chọn ngẫu nhiên
        List<String> sold = ["1,1k", "1,2k", "930", "1k"];

        Random random = Random(); // Khởi tạo đối tượng Random

        // 🟢 Thêm location /sold ngẫu nhiên cho từng sản phẩm
        for (var product in products) {
          product['location'] = locations[random.nextInt(locations.length)];
          product['sold'] = sold[random.nextInt(sold.length)];
          // Làm tròn rating chỉ lấy 1 số sau dấu phẩy
          if (product.containsKey('rating') && product['rating'] is double) {
            product['rating'] =
                double.parse(product['rating'].toStringAsFixed(1));
          }
        }

        // 🟢 Lưu danh sách gốc để tránh bị thay đổi
        List<dynamic> originalProducts = List.from(products);

        // 🟢 Sắp xếp productList theo A-Z
        products.sort(
            (a, b) => a['title'].toString().compareTo(b['title'].toString()));
        productList.value = products;

        // 🟢 Lọc danh sách bán chạy từ bản gốc (không sắp xếp A-Z)
        fetchBestSellingProducts(originalProducts);

        // 🟢 Lọc danh sách sản phẩm có discount cao nhất
        fetchHighestDiscountProducts(originalProducts);
      }
    } catch (e) {
      print("Error fetching products: $e");
    } finally {
      isLoading(false);
    }
  }

// // 🔥 Thêm sản phẩm vào giỏ hàng
//   void addToCart(Product product) {
//     cart.add(product);
//     Get.snackbar("Giỏ hàng", "Đã thêm ${product.title} vào giỏ!");
//   }

//   // 🔥 Xóa sản phẩm khỏi giỏ hàng
//   void removeFromCart(Product product) {
//     cart.remove(product);
//     Get.snackbar("Giỏ hàng", "Đã xóa ${product.title} khỏi giỏ!");
//   }

//   // 🔥 Xóa toàn bộ giỏ hàng
//   void clearCart() {
//     cart.clear();
//     Get.snackbar("Giỏ hàng", "Đã xóa toàn bộ giỏ hàng!");
//   }

  void fetchBestSellingProducts(List<dynamic> products) {
    List<dynamic> sortedProducts = List.from(products);

    // 🟢 Sắp xếp theo số lượng đánh giá giảm dần
    sortedProducts
        .sort((a, b) => (b['reviews'].length).compareTo(a['reviews'].length));

    bestSellingProducts.value =
        sortedProducts; // Cập nhật danh sách sản phẩm bán chạy
  }

  void fetchHighestDiscountProducts(List<dynamic> products) {
    List<dynamic> sortedProducts = List.from(products);
    Random random = Random();
    // 🟢 Sắp xếp theo discountPercent giảm dần
    sortedProducts.sort(
        (a, b) => b['discountPercentage'].compareTo(a['discountPercentage']));
    // Cập nhật số lượng đã bán random
    for (var product in sortedProducts) {
      int totalStock = random.nextInt(300) + 200; // Giả sử có từ 200 - 500 sp
      int soldStock = random.nextInt(totalStock ~/ 2) +
          50; // Đã bán từ 50 đến một nửa tổng số
      product['totalStock'] = totalStock;
      product['soldStock'] = soldStock;
    }
    // 🟢 Đảm bảo danh sách có đủ sản phẩm
    highestDiscountProducts.value = sortedProducts.length >= 6
        ? sortedProducts.take(6).toList()
        : sortedProducts;

    // 🟢 Debug in danh sách
    print("Sản phẩm có discount cao nhất: ${highestDiscountProducts.length}");
  }

  // CREATE: Thêm sản phẩm mới
  Future<void> addProduct(Map<String, dynamic> newProduct) async {
    try {
      isLoading(true);
      var response = await _dio.post(baseUrl, data: newProduct);
      if (response.statusCode == 200 || response.statusCode == 201) {
        productList.add(response.data); // Thêm sản phẩm vào danh sách
      }
    } catch (e) {
      print("Error adding product: $e");
    } finally {
      isLoading(false);
    }
  }

  // UPDATE: Cập nhật sản phẩm
  Future<void> updateProduct(
      int id, Map<String, dynamic> updatedProduct) async {
    try {
      isLoading(true);
      var response = await _dio.put('$baseUrl/$id', data: updatedProduct);
      if (response.statusCode == 200) {
        // Tìm sản phẩm trong danh sách và cập nhật
        int index = productList.indexWhere((product) => product['id'] == id);
        if (index != -1) {
          productList[index] = response.data;
        }
      }
    } catch (e) {
      print("Error updating product: $e");
    } finally {
      isLoading(false);
    }
  }

  // DELETE: Xóa sản phẩm
  Future<void> deleteProduct(int id) async {
    try {
      isLoading(true);
      var response = await _dio.delete('$baseUrl/$id');
      if (response.statusCode == 200) {
        // Xóa sản phẩm khỏi danh sách
        productList.removeWhere((product) => product['id'] == id);
      }
    } catch (e) {
      print("Error deleting product: $e");
    } finally {
      isLoading(false);
    }
  }
}
