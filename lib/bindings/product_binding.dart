import 'package:get/get.dart';
import 'product.dart'; // Đường dẫn tới ProductController

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
