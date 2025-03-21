import 'package:flutter/material.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({super.key});

  final List<Map<String, String>> bestSellerProducts = const [
    {
      "image": "assets/images/product.jpg",
      "name": "Nike Air Max 270 full color",
      "price": "500.000đ",
      "original_price": "600.000đ",
      "discount": "30%",
      "sold": "1,2k",
      "rating": "4.9 ",
      "location": "Thành phố Hồ Chí Minh"
    },
    {
      "image": "assets/images/product.jpg",
      "name": "Nike Air Max 270 full color",
      "price": "500.000đ",
      "original_price": "600.000đ",
      "discount": "30%",
      "sold": "1,2k",
      "rating": "4.9 ",
      "location": "Thành phố Hồ Chí Minh"
    },
    {
      "image": "assets/images/product.jpg",
      "name": "Nike Air Max 270 full color",
      "price": "500.000đ",
      "original_price": "600.000đ",
      "discount": "30%",
      "sold": "1,2k",
      "rating": "4.9 ",
      "location": "Thành phố Hồ Chí Minh"
    },
    {
      "image": "assets/images/product.jpg",
      "name": "Nike Air Max 270 full color",
      "price": "500.000đ",
      "original_price": "600.000đ",
      "discount": "30%",
      "sold": "1,2k",
      "rating": "4.9 ",
      "location": "Thành phố Hồ Chí Minh"
    }
  ];

  @override
  Widget build(BuildContext context) {
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
            height: 300, // Giảm chiều cao để không bị dư khoảng trống
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bestSellerProducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8), // Thêm khoảng cách ngang và dọc
                  child: Container(
                    width: 160, // Thu nhỏ chiều rộng một chút
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
                      mainAxisSize: MainAxisSize.min, // Chặn kích thước thừa
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                bestSellerProducts[index]["image"]!,
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
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  color: Colors.red,
                                  child: Text(
                                    "-${bestSellerProducts[index]["discount"]!}",
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
                          bestSellerProducts[index]["name"]!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          bestSellerProducts[index]["price"]!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
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
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.yellow.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.yellow, // Màu viền
                                  width: 1, // Độ dày viền
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 14,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    bestSellerProducts[index]["rating"]!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "${bestSellerProducts[index]["sold"]} đã bán",
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
                              bestSellerProducts[index]["location"]!,
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
