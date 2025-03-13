import 'package:flutter/material.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({super.key});

  final List<Map<String, String>> flashSaleProducts = const [
    {
      "image": "assets/images/product.jpg",
      "name": "Sản phẩm 1",
      "price": "200.000đ",
      "original_price": "250.000đ",
      "discount": "20%"
    },
    {
      "image": "assets/images/product.jpg",
      "name": "Sản phẩm 2",
      "price": "300.000đ",
      "original_price": "350.000đ",
      "discount": "15%"
    },
    {
      "image": "assets/images/product.jpg",
      "name": "Sản phẩm 2",
      "price": "300.000đ",
      "original_price": "350.000đ",
      "discount": "15%"
    },
    {
      "image": "assets/images/product.jpg",
      "name": "Sản phẩm 2",
      "price": "300.000đ",
      "original_price": "350.000đ",
      "discount": "15%"
    },
    {
      "image": "assets/images/product.jpg",
      "name": "Sản phẩm 2",
      "price": "300.000đ",
      "original_price": "350.000đ",
      "discount": "15%"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Flash Sale",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: flashSaleProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        flashSaleProducts[index]["image"]!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        flashSaleProducts[index]["name"]!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
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
