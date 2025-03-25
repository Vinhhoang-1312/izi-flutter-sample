import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import thêm thư viện intl
import '../widgets/order_widgets/order_item.dart'; // Đổi tên import
import '../widgets/order_widgets/order_summary.dart'; // Đổi tên import
import 'cart_screen.dart'; // Import màn hình giỏ hàng

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final List<Map<String, dynamic>> cartItems = [
    {
      "name": "Bánh Choco Pie Orion 12P hộp 336g - 20380",
      "image": "assets/images/chocopie.png",
      "price": 47000,
      "quantity": 1,
      "original_price": 69000,
      "selected": true,
    },
    {
      "name": "Lô trà Olong Tea+ trà xanh 450ml - 63571",
      "image": "assets/images/chocopie.png",
      "price": 51600,
      "quantity": 2,
      "selected": true,
    },
    {
      "name": "Lô trà Olong Tea+ trà xanh 450ml - 63571",
      "image": "assets/images/chocopie.png",
      "price": 51600,
      "quantity": 2,
      "original_price": 69000,
      "selected": true,
    },
  ];

  void updateQuantity(int index, int change) {
    setState(() {
      if (cartItems[index]["quantity"] + change > 0) {
        cartItems[index]["quantity"] += change;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void toggleSelect(int index) {
    setState(() {
      cartItems[index]["selected"] = !cartItems[index]["selected"];
    });
  }

  void navigateToCart(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const CartScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormat =
        NumberFormat("#,###", "vi_VN"); // Định dạng số tiền VNĐ
    final totalPrice = cartItems.fold<int>(
      0,
      (sum, item) => sum + (item['price'] as int) * (item['quantity'] as int),
    );

    const shippingFee = 20000; //doi final bang const
    final discount = totalPrice >= 450000 ? 30000 : 0;
    const rewardPointsUsed = 2000; //doi final bang const
    final finalTotal = totalPrice + shippingFee - discount - rewardPointsUsed;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF712D),
        title: const Text(
          "Thanh toán đơn hàng",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white, // Đổi màu icon thành trắng
          ),
          onPressed: () => navigateToCart(context), // Điều hướng về giỏ hàng
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(
                bottom: 200), // Adjust padding to avoid overlap
            child: Column(
              children: [
                // Thông tin cửa hàng
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.white,
                  child: const Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: Color(0xFF0015FF),
                            size: 24,
                          ),
                          SizedBox(width: 8), // Khoảng cách cố định
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Cửa hàng Bách hóa di động",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "12 Lê Hồng Phong, Phường Phước Ninh, Quận Hải Châu, TP. Đà Nẵng",
                                  style: TextStyle(fontSize: 14),
                                  maxLines: 2, // Bắt buộc chỉ hiển thị 2 dòng
                                  overflow: TextOverflow
                                      .ellipsis, // Hiển thị "..." nếu quá dài
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Divider(
                        thickness: 0.25, // Độ dày của đường gạch
                        color: Color(0xFFA4A2A2), // Màu xám
                        height: 1, // Chiều cao của Divider
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                // horizontal: 10,
                                vertical: 5), // Padding ngang 10, dọc 5
                            child: Icon(
                              Icons.person,
                              color: Color(0xFF0015FF),
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  spacing:
                                      8, // Khoảng cách giữa các phần tử trong dòng
                                  runSpacing: 4, // Khoảng cách giữa các dòng
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.red.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Row(
                                        mainAxisSize: MainAxisSize
                                            .min, // Để nội dung không chiếm hết chiều ngang
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                // right: 5,
                                                left: 8,
                                                top: 6,
                                                bottom: 0), // Padding cho chữ
                                            child: Text(
                                              "Vui lòng điền thông tin nhận hàng",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12),
                                              overflow: TextOverflow
                                                  .ellipsis, // Chống vỡ chữ
                                            ),
                                          ),
                                          SizedBox(width: 4),
                                          Icon(Icons.warning,
                                              color: Colors.red, size: 16),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("Thay đổi",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 12)),
                                          SizedBox(width: 4),
                                          Icon(Icons.edit,
                                              color: Colors.grey, size: 16),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.orange.withOpacity(0.08),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Row(
                                        children: [
                                          Text(
                                            "Chưa có địa chỉ giao hàng",
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 12),
                                          ),
                                          SizedBox(width: 4),
                                          Icon(Icons.warning,
                                              color: Colors.orange, size: 16),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),

                // Danh sách sản phẩm
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            width: 2,
                            height: 19,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFF712D),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            "Sản phẩm (3)",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            return OrderItem(
                              item: cartItems[index],
                              onUpdateQuantity: (change) =>
                                  updateQuantity(index, change),
                              onRemove: () => removeItem(index),
                              onToggleSelect: () => toggleSelect(index),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  color: const Color(0xFFFF712D)
                      .withOpacity(0.08), // Màu nền trải dài hết màn hình
                  height: 32,
                  width: double
                      .infinity, // Đảm bảo container kéo dài từ trái sang phải
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16), // Chừa khoảng cách 2 bên màn hình
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Đẩy số tiền về bên phải
                      children: [
                        const Text(
                          "Tổng tiền sản phẩm:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            // color: Color(
                            //     0xFFFF712D), // Màu cam cho chữ "Tổng tiền sản phẩm"
                          ),
                        ),
                        Text(
                          "${currencyFormat.format(totalPrice)} đ",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFFE9330B), // Màu đỏ đậm cho giá tiền
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // Ghi chú

                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            width: 2,
                            height: 19,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFF712D),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            "Ghi chú",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Nhập ghi chú",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          maxLength: 120,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                const SizedBox(height: 8),

                // Chọn phương thức thanh toán
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            width: 2,
                            height: 19,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFF712D),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            "Chọn phương thức thanh toán",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/tien.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Expanded(
                                  child: Text("Thanh toán tiền mặt - COD"),
                                ),
                                Radio(
                                  value: "COD",
                                  groupValue: "COD",
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/bank.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Expanded(
                                  child: Text("Thanh toán chuyển khoản"),
                                ),
                                Radio(
                                  value: "Bank",
                                  groupValue: "COD",
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Chi tiết thanh toán

                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            width: 2,
                            height: 19,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFF712D),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            "Chi tiết thanh toán",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(16),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Tổng tiền hàng:"),
                                Text("${currencyFormat.format(totalPrice)} đ"),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Phí vận chuyển:"),
                                Text("${currencyFormat.format(shippingFee)} đ"),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Khuyến mãi:"),
                                Text("-${currencyFormat.format(discount)} đ"),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Đã dùng điểm thưởng:"),
                                Text(
                                    "-${currencyFormat.format(rewardPointsUsed)} đ"),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Tổng thanh toán",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  "${currencyFormat.format(finalTotal)} đ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color:
                                          Colors.red), // Set text color to red
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Điểm thưởng sẽ nhận được:",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      const Spacer(),
                      Text(
                        "${finalTotal ~/ 100000}",
                        style: const TextStyle(
                            color: Color(0xFFFFC142), fontSize: 14),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: OrderSummary(cartItems: cartItems),
          ),
        ],
      ),
    );
  }
}
