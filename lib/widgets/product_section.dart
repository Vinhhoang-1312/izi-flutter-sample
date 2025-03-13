import 'package:flutter/material.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  final List<Map<String, String>> listOfProducts = const [
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
          GridView.builder(
            shrinkWrap: true, // Cho phép GridView co giãn theo nội dung
            physics:
                const NeverScrollableScrollPhysics(), // Ngăn chặn scroll riêng lẻ
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Hiển thị 2 sản phẩm trên một hàng
              childAspectRatio: 0.6, // Điều chỉnh tỷ lệ khung hình
              crossAxisSpacing: 8, // Khoảng cách ngang giữa các sản phẩm
              mainAxisSpacing: 8, // Khoảng cách dọc giữa các sản phẩm
            ),
            itemCount: listOfProducts.length,
            itemBuilder: (context, index) {
              return ProductCard(product: listOfProducts[index]);
            },
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, String> product;
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
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              product["image"]!,
              width: 160,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            product["name"]!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            product["price"]!,
            style: const TextStyle(
                fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          Text(
            product["original_price"]!,
            style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 14),
              const SizedBox(width: 4),
              Text(
                product["rating"]!,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Text(
                "${product["sold"]} đã bán",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.orange, size: 12),
              const SizedBox(width: 4),
              Text(
                product["location"]!,
                style: const TextStyle(fontSize: 10.5, color: Colors.black),
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
