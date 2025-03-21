import 'package:flutter/material.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({super.key});

  final List<Map<String, dynamic>> flashSaleProducts = const [
    {
      "image": "assets/images/product.jpg",
      "brand": "MAYBELINE",
      "name": "Son Lì Maybelline Mịn Môi Siêu Nhẹ 1299 Đỏ Cam Đất 1.7g",
      "price": "130.000đ",
      "original_price": "149.000đ",
      "discount": "30%",
      "sold": 127,
      "total": 500,
    },
    {
      "image": "assets/images/product.jpg",
      "brand": "MAYBELINE",
      "name": "Son Lì Maybelline Mịn Môi Siêu Nhẹ 1299 Đỏ Cam Đất 1.7g",
      "price": "130.000đ",
      "original_price": "149.000đ",
      "discount": "30%",
      "sold": 300,
      "total": 500,
    },
    {
      "image": "assets/images/product.jpg",
      "brand": "MAYBELINE",
      "name": "Son Lì Maybelline Mịn Môi Siêu Nhẹ 1299 Đỏ Cam Đất 1.7g",
      "price": "130.000đ",
      "original_price": "149.000đ",
      "discount": "30%",
      "sold": 127,
      "total": 500,
    },
    {
      "image": "assets/images/product.jpg",
      "brand": "MAYBELLINE",
      "name": "Son Lì Maybelline Mịn Môi Siêu Nhẹ 1299 Đỏ Cam Đất 1.7g",
      "price": "130.000đ",
      "original_price": "149.000đ",
      "discount": "30%",
      "sold": 127,
      "total": 500,
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    // Icon(Icons.timer, color: Colors.green, size: 16),
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
              itemCount: flashSaleProducts.length,
              itemBuilder: (context, index) {
                final product = flashSaleProducts[index];
                final int sold = product['sold'];
                final int total = product['total'];
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
                        // Stack cho phép bạn đặt các widget chồng lên nhau.
                        children: [
                          Image.asset(
                            // Hiển thị hình ảnh từ gói tài sản.
                            product["image"]!,
                            width: 140,
                            height: 140,
                            fit: BoxFit
                                .cover, // Đảm bảo hình ảnh bao phủ toàn bộ khu vực của widget.
                          ),
                          Positioned(
                            // Đặt widget ở góc trên bên phải của Stack.
                            top: 0,
                            right: 0,
                            child: Container(
                              // Container để chứa văn bản "Freeship 40k".
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                // Trang trí Container với nền màu xanh lá và góc bo tròn.
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                // Widget Text để hiển thị "Freeship 40k".
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
                          product["brand"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF259329),
                          ),
                        ),
                      ),
                      Text(
                        product["name"]!,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // Căn giữa theo chiều ngang
                        children: [
                          Text(
                            product["price"]!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ClipPath(
                            clipper: ArrowClipper(
                                heightScale: 0.7,
                                widthScale:
                                    1.0), // Giảm chiều cao & chiều ngang
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              color: Colors.red,
                              child: const Text(
                                "-30%",
                                style: TextStyle(
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
                        product["original_price"]!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Text(
                      //   "Đã bán $sold",
                      //   style: const TextStyle(
                      //     fontSize: 12,
                      //     color: Colors.grey,
                      //   ),
                      // ),
                      Container(
                        height: 20, // Tăng chiều cao để nhìn rõ hơn
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              255, 243, 240, 240), // Nền trắng
                          borderRadius:
                              BorderRadius.circular(10), // Bo góc ngoài
                          // border: Border.all(
                          //     color: Colors.grey.shade300), // Viền nhẹ
                        ),
                        child: Stack(
                          children: [
                            // Thanh tiến trình màu xanh lá
                            LayoutBuilder(
                              builder: (context, constraints) {
                                double progressWidth =
                                    constraints.maxWidth * progress;
                                return Container(
                                  width: progressWidth,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color(0xFF72A834), // Màu xanh lá
                                    borderRadius:
                                        BorderRadius.circular(10), // Bo góc
                                  ),
                                );
                              },
                            ),
                            // Chữ "Đã bán xxx" ở giữa
                            Center(
                              child: Text(
                                "Đã bán $sold",
                                style: const TextStyle(
                                  fontSize: 14, // Chữ to hơn
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black, // Màu chữ
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
