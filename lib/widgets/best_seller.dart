import 'package:flutter/material.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({super.key});

  final List<Map<String, String>> bestSellerProducts = const [
    {
      "image": "assets/images/product.jpg",
      "brand": "MAYBELINE",
      "name": "Son Lì Maybelline Mịn Môi Siêu Nhẹ 1299 Đỏ Cam Đất 1.7g",
      "price": "130.000đ",
      "original_price": "149.000đ",
      "discount": "30%",
      "sold": "127"
    },
    {
      "image": "assets/images/product.jpg",
      "brand": "MAYBELINE",
      "name": "Son Lì Maybelline Mịn Môi Siêu Nhẹ 1299 Đỏ Cam Đất 1.7g",
      "price": "130.000đ",
      "original_price": "149.000đ",
      "discount": "30%",
      "sold": "127"
    },
    {
      "image": "assets/images/product.jpg",
      "brand": "MAYBELINE",
      "name": "Son Lì Maybelline Mịn Môi Siêu Nhẹ 1299 Đỏ Cam Đất 1.7g",
      "price": "130.000đ",
      "original_price": "149.000đ",
      "discount": "30%",
      "sold": "127"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Sản Phẩm Bán Chạy   ",
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
              itemCount: bestSellerProducts.length,
              itemBuilder: (context, index) {
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
                            bestSellerProducts[index]["image"]!,
                            width: 140,
                            height: 140,
                            fit: BoxFit
                                .cover, // Đảm bảo hình ảnh bao phủ toàn bộ khu vực của widget.
                          ),
                          Positioned(
                            // Đặt widget ở góc trên bên phải của Stack.
                            top: 0,
                            right: 0,
                            child: ClipPath(
                              clipper:
                                  ArrowClipper(), // Cắt hình theo đường viền tùy chỉnh
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                color: Colors.red,
                                child: Text(
                                  "  -${bestSellerProducts[index]["discount"]!}",
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
                      const SizedBox(height: 5),
                      // Text(
                      //   bestSellerProducts[index]["brand"]!,
                      //   textAlign: TextAlign.center,
                      //   style: const TextStyle(
                      //     fontSize: 12,
                      //     fontWeight: FontWeight.bold,
                      //     color: Color(0xFF259329),
                      //   ),
                      // ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          bestSellerProducts[index]["brand"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF259329),
                          ),
                        ),
                      ),
                      Text(
                        bestSellerProducts[index]["name"]!,
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
                            bestSellerProducts[index]["price"]!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        bestSellerProducts[index]["original_price"]!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Đã bán ${bestSellerProducts[index]["sold"]}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
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
  @override
  Path getClip(Size size) {
    double radius = 6; // Độ cong của góc
    double arrowWidth = 12; // Tăng độ rộng mũi tên
    double heightAdjust = 0; // Giảm chiều cao xuống một chút

    Path path = Path();

    path.moveTo(0, (size.height - heightAdjust) / 2); // Bắt đầu từ mũi tên
    path.lineTo(arrowWidth, 0); // Đẩy mũi tên lên cao hơn chút
    path.lineTo(size.width - radius, 0); // Vẽ sang phải

    // Bo góc trên phải
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    path.lineTo(size.width, size.height - radius - heightAdjust);

    // Bo góc dưới phải
    path.quadraticBezierTo(size.width, size.height - heightAdjust,
        size.width - radius, size.height - heightAdjust);

    path.lineTo(arrowWidth, size.height - heightAdjust); // Sang trái
    path.lineTo(0, (size.height - heightAdjust) / 2); // Kết thúc ở mũi tên

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
