import 'package:flutter/material.dart';
import '../widgets/search_bar.dart';
import '../widgets/category_list.dart';
import '../widgets/flash_sale.dart';
import '../widgets/product_section.dart';
import '../widgets/banner_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 237, 237, 237), // Đặt nền trắng cho toàn bộ trang
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SearchBarWidget(), // Thanh tìm kiếm
            SizedBox(height: 20), // Khoảng cách
            BannerSlider(), // Slider có indicator
            SizedBox(height: 20),
            CategoryList(), // Danh mục sản phẩm
            SizedBox(height: 20),
            FlashSale(), // Flash Sale
            SizedBox(height: 20),
            // ProductSection(
            //   title: "Sản phẩm bán chạy",
            // ), // Danh sách sản phẩm bán chạy
            // SizedBox(height: 20),
            // ProductSection(title: "Gợi ý hôm nay"), // Gợi ý sản phẩm hôm nay
          ],
        ),
      ),
    );
  }
}
