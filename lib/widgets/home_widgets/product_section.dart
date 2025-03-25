import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/product.dart'; // Đường dẫn tới ProductController

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Khởi tạo ProductController
    final ProductController productController = Get.find<ProductController>();

    return Obx(() {
      // Kiểm tra trạng thái tải dữ liệu
      if (productController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(), // Hiển thị vòng tròn loading
        );
      }

      // Kiểm tra nếu không có sản phẩm
      if (productController.productList.isEmpty) {
        return const Center(
          child: Text(
            "Không có sản phẩm nào!",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        );
      }

      // Hiển thị danh sách sản phẩm
      return Container(
        padding: const EdgeInsets.all(8),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tiêu đề "Gợi ý hôm nay"
            const Row(
              children: [
                SizedBox(height: 10),
                Text(
                  "Gợi ý hôm nay",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "Xem thêm >",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // GridView hiển thị danh sách sản phẩm
            GridView.builder(
              shrinkWrap: true, // Cho phép GridView co giãn theo nội dung
              physics:
                  const NeverScrollableScrollPhysics(), // Ngăn scroll riêng lẻ
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width / 2.1,
                childAspectRatio: 0.56, // Tỷ lệ khung hình của mỗi sản phẩm
                crossAxisSpacing: 8, // Khoảng cách ngang giữa các sản phẩm
                mainAxisSpacing: 8, // Khoảng cách dọc giữa các sản phẩm
              ),
              itemCount: productController.productList.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: productController.productList[index],
                );
              },
            ),
          ],
        ),
      );
    });
  }
}

class ProductCard extends StatelessWidget {
  final dynamic product; // Dữ liệu từ API
  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // // Hiển thị ảnh sản phẩm
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(10),
          //   child: AspectRatio(
          //     aspectRatio: 1, // Giữ tỷ lệ vuông cho ảnh
          //     child: Image.network(
          //       product["thumbnail"], // Lấy ảnh từ API
          //       fit: BoxFit.cover,
          //       width: double.infinity,
          //     ),
          //   ),
          // ),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product["thumbnail"],
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: ClipPath(
                  clipper: ArrowClipper(),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.red,
                    child: Text(
                      "-${product["discountPercentage"]}%",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Hiển thị tên sản phẩm
          Text(
            product["title"], // Lấy tên sản phẩm từ API
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),

          // Hiển thị giá sản phẩm
          Text(
            "${product["price"]}đ", // Lấy giá sản phẩm từ API
            style: const TextStyle(
                fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold),
          ),

          // Hiển thị giảm giá
          Text(
            "${product["discountPercentage"]}% giảm giá", // Lấy giảm giá từ API
            style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough),
          ),
          const SizedBox(height: 4),

          // Hiển thị đánh giá và số lượng còn lại
          Row(
            children: [
              Container(
                width: 45,
                height: 22,
                decoration: BoxDecoration(
                  color: Colors.yellow.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.yellow,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    // const Icon(
                    //   Icons.star,
                    //   color: Colors.amber,
                    //   size: 14,
                    // ),
                    // const SizedBox(width: 4),
                    // Text(
                    //   "${product["rating"]}",
                    //   style: const TextStyle(
                    //     fontSize: 12,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    Text(
                      " ⭐ ${product["rating"].toStringAsFixed(1)} ",
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "${product["sold"]} đã bán",
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.orange,
                size: 12,
              ),
              const SizedBox(width: 4),
              Text(
                "${product["location"]} ",
                // bestSellerProducts[index]["location"]!,
                style: const TextStyle(
                  fontSize: 10.5,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 6;
    double arrowWidth = 12;
    double heightAdjust = 0;

    Path path = Path();
    path.moveTo(0, (size.height - heightAdjust) / 2);
    path.lineTo(arrowWidth, 0);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);
    path.lineTo(size.width, size.height - radius - heightAdjust);
    path.quadraticBezierTo(size.width, size.height - heightAdjust,
        size.width - radius, size.height - heightAdjust);
    path.lineTo(arrowWidth, size.height - heightAdjust);
    path.lineTo(0, (size.height - heightAdjust) / 2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
