import 'package:flutter/material.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({super.key});

  final List<Map<String, String>> flashSaleProducts = const [
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
        gradient: LinearGradient(
          colors: [Color(0xFFBBFBE6), Color(0xFFC6EF97)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                "Flash Sale",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Spacer(),
              Icon(
                Icons.timer,
                color: Colors.red,
              ),
              SizedBox(width: 4),
              Text(
                "02:12:49:15",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Spacer(),
              // TextButton(
              //   onPressed: () {},
              //   child: Text(
              //     "Xem thêm",
              //     style: TextStyle(
              //       fontSize: 14,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.blue,
              //     ),
              //   ),
              // ),
            ],
          ),
          SizedBox(
            height: 370, // Điều chỉnh chiều cao để  cao hơn
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: flashSaleProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        flashSaleProducts[index]["image"]!,
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        flashSaleProducts[index]["brand"]!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 2),
                      // Text(
                      //   flashSaleProducts[index]["name"]!,
                      //   style: const TextStyle(
                      //     fontSize: 14,
                      //     fontWeight: FontWeight.bold,
                      //     // maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //   ),
                      // ),
                      SizedBox(
                        width: 130,
                        child: Text(
                          flashSaleProducts[index]["name"]!,
                          style: const TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
                          maxLines: 3,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        flashSaleProducts[index]["price"]!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        flashSaleProducts[index]["original_price"]!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        flashSaleProducts[index]["discount"]!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Đã bán ${flashSaleProducts[index]["sold"]}",
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
