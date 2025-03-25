import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/product.dart'; // Import ProductController

class FlashSale extends StatefulWidget {
  const FlashSale({super.key});
  @override
  _FlashSaleState createState() => _FlashSaleState();
}

class _FlashSaleState extends State<FlashSale> {
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (productController.highestDiscountProducts.isEmpty) {
        return const Center(
          child: Text(
            "Không có sản phẩm flash sale!",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        );
      }

      return Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFBBFBE6), Color(0xFFC6EF97)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "FlashSale   ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 4),
                      Text(
                        "02 : 12 : 49 : 15",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                const Spacer(),
                const Text(
                  "Xem thêm >  ",
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
              height: 320,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productController.highestDiscountProducts.length,
                itemBuilder: (context, index) {
                  final product =
                      productController.highestDiscountProducts[index];
                  final int total = product['totalStock'];
                  final int sold = product['soldStock'];
                  final double progress = sold / total;

                  return Container(
                    width: 160,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
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
                        Stack(
                          children: [
                            Image.network(
                              product["thumbnail"] ?? "",
                              width: 140,
                              height: 140,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.error),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text(
                                  "Freeship 40k",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            product["brand"] ?? '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF259329),
                            ),
                          ),
                        ),
                        Text(
                          product["title"] ?? '',
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${(product["price"] as num?)?.toStringAsFixed(2) ?? '0.00'}đ",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ClipPath(
                              clipper: ArrowClipper(
                                  heightScale: 0.7, widthScale: 1.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                color: Colors.red,
                                child: Text(
                                  "-${product['discountPercentage']}%",
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "${((product["price"] as num?) ?? 0 + 15).toStringAsFixed(2)}đ",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 243, 240, 240),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  double progressWidth =
                                      constraints.maxWidth * progress;
                                  return Container(
                                    width: progressWidth,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF72A834),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  );
                                },
                              ),
                              Center(
                                child: Text(
                                  "Đã bán $sold/$total",
                                  // "${product["sold"]} đã bán",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
  final double heightScale; // Tỉ lệ giảm chiều cao thân
  final double widthScale; // Tỉ lệ giảm chiều ngang tổng thể

  ArrowClipper({this.heightScale = 1.0, this.widthScale = 1.0});

  @override
  Path getClip(Size size) {
    double radius = 6; // Độ cong của góc
    double arrowWidth = 8; // Giữ nguyên độ rộng mũi tên
    double newHeight =
        size.height * heightScale; // Điều chỉnh chiều cao phần thân
    double heightAdjust = (size.height - newHeight) / 2; // Canh giữa phần thân
    double newWidth = size.width * widthScale; // Điều chỉnh chiều ngang
    double widthAdjust = (size.width - newWidth) / 2; // Căn giữa phần ngang

    Path path = Path();

    path.moveTo(widthAdjust, size.height / 2); // Bắt đầu từ mũi tên
    path.lineTo(widthAdjust + arrowWidth, heightAdjust); // Mũi tên hướng lên
    path.lineTo(widthAdjust + newWidth - radius, heightAdjust); // Vẽ sang phải

    // Bo góc trên phải
    path.quadraticBezierTo(widthAdjust + newWidth, heightAdjust,
        widthAdjust + newWidth, heightAdjust + radius);
    path.lineTo(widthAdjust + newWidth, size.height - radius - heightAdjust);

    // Bo góc dưới phải
    path.quadraticBezierTo(widthAdjust + newWidth, size.height - heightAdjust,
        widthAdjust + newWidth - radius, size.height - heightAdjust);

    path.lineTo(
        widthAdjust + arrowWidth, size.height - heightAdjust); // Sang trái
    path.lineTo(widthAdjust, size.height / 2); // Kết thúc ở mũi tên

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
