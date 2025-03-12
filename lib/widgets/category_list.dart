import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final PageController _pageController =
      PageController(viewportFraction: 0.32); // Điều chỉnh kích thước hiển thị
  int activeIndex = 0;

  final List<Map<String, String>> categories = [
    {"image": "assets/images/manshirt.jpg", "name": "Man Shirt"},
    {"image": "assets/images/dress.jpg", "name": "Dress"},
    {
      "image": "assets/images/manworkequipment.jpg",
      "name": "Man Work Equipment"
    },
    {"image": "assets/images/womanbag.jpg", "name": "Woman Bag"},
    {"image": "assets/images/manshop.jpg", "name": "Man Shop"},
    {"image": "assets/images/shoes.jpg", "name": "Shoes"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 5), // Thêm padding để tránh dính mép
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// **Tiêu đề + Nút Xem Thêm**
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Danh mục sản phẩm",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  // TODO: Thêm chức năng "Xem thêm"
                },
                child: const Row(
                  children: [
                    Text(
                      "Xem thêm",
                      style: TextStyle(color: Colors.green, fontSize: 14),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: 14, color: Colors.green),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          /// **Danh mục trượt ngang - Căn trái**
          Align(
            alignment: Alignment.centerLeft, // Đẩy danh mục về bên trái
            child:

                /// **Danh mục trượt ngang**
                SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Cuộn ngang
                itemCount: categories.length,
                padding:
                    const EdgeInsets.only(left: 10), // Giữ khoảng cách bên trái
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        right: 10), // Khoảng cách giữa các mục
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage(categories[index]["image"]!),
                        ),
                        SizedBox(
                          width: 70,
                          child: Text(
                            categories[index]["name"]!,
                            style: const TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),

          /// **Indicator trượt động theo danh mục**
          Center(
            child: SmoothPageIndicator(
              controller: _pageController, // Gắn với PageViewController
              count: categories.length,
              effect: const ScrollingDotsEffect(
                // Tạo hiệu ứng cuộn theo danh mục
                dotWidth: 8,
                dotHeight: 8,
                spacing: 6,
                activeDotColor: Colors.green,
                dotColor: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
