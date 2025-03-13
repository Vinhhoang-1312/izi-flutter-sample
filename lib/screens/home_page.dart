import 'package:flutter/material.dart';
import '../widgets/search_bar.dart';
import '../widgets/category_list.dart';
import '../widgets/flash_sale.dart';
import '../widgets/product_section.dart';
import '../widgets/banner_slider.dart';
import '../widgets/best_seller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:
          Color.fromARGB(255, 255, 255, 255), // Đặt nền trắng cho toàn bộ trang
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30), // Khoảng cách

            SearchBarWidget(), // Thanh tìm kiếm
            SizedBox(height: 5), // Khoảng cách
            BannerSlider(), // Slider có indicator
            SizedBox(height: 5),
            CategoryList(), // Danh mục sản phẩm
            SizedBox(height: 5),
            FlashSale(), // Flash Sale
            SizedBox(height: 5),
            BestSeller(), // Best Seller
            SizedBox(height: 5),
            ProductSection(), // Product  Section
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
