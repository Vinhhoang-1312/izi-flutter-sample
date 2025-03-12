import 'package:flutter/material.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({super.key});

  final List<Map<String, String>> flashSaleProducts = const [
    {
      "image": "assets/images/product.jpg",
      "name": "Sản phẩm 1",
      "price": "200.000đ"
    },
    {
      "image": "assets/images/product.jpg",
      "name": "Sản phẩm 2",
      "price": "300.000đ"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: flashSaleProducts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Image.asset(
                      flashSaleProducts[index]["image"]!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      flashSaleProducts[index]["name"]!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      flashSaleProducts[index]["price"]!,
                      style: const TextStyle(fontSize: 12, color: Colors.red),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
