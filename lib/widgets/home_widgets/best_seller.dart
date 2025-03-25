import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/product.dart'; // Import ProductController

class BestSeller extends StatefulWidget {
  const BestSeller({super.key});

  @override
  _BestSellerState createState() => _BestSellerState();
}

class _BestSellerState extends State<BestSeller> {
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (productController.bestSellingProducts.isEmpty) {
        return const Center(
          child: Text(
            "Không có sản phẩm bán chạy!",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        );
      }

      return Container(
        padding: const EdgeInsets.all(8),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  "Sản phẩm bán chạy",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "Xem thêm >",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productController.bestSellingProducts.length,
                itemBuilder: (context, index) {
                  var product = productController.bestSellingProducts[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Container(
                      width: 160,
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  product["thumbnail"],
                                  width: 140,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: ClipPath(
                                  clipper: ArrowClipper(),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
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
                          Text(
                            product["title"],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                "${product["price"]}đ",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                  width: 6), // Khoảng cách giữa hai giá
                              Text(
                                "${(product["price"] + 15).toStringAsFixed(0)}đ",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFA4A2A2), // Màu tối hơn
                                  fontWeight:
                                      FontWeight.w500, // Đậm hơn để dễ thấy
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Color(
                                      0xFFA4A2A2), // Đảm bảo vạch gạch có màu rõ
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
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
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
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
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
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
