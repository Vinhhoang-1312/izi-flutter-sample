// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; // Import thêm thư viện intl
// import '../widgets/order_widgets/order_item.dart'; // Đổi tên import
// import 'cart_screen.dart'; // Import màn hình giỏ hàng

// class OrderScreen extends StatefulWidget {
//   const OrderScreen({super.key});

//   @override
//   _OrderScreenState createState() => _OrderScreenState();
// }

// class _OrderScreenState extends State<OrderScreen> {
//   final List<Map<String, dynamic>> cartItems = [
//     {
//       "name": "Bánh Choco Pie Orion 12P hộp 336g - 20380",
//       "image": "assets/images/chocopie.png",
//       "price": 47000,
//       "quantity": 1,
//       "original_price": 69000,
//       "selected": true,
//     },
//     {
//       "name": "Lô trà Olong Tea+ trà xanh 450ml - 63571",
//       "image": "assets/images/chocopie.png",
//       "price": 51600,
//       "quantity": 2,
//       "selected": true,
//     },
//     {
//       "name": "Lô trà Olong Tea+ trà xanh 450ml - 63571",
//       "image": "assets/images/chocopie.png",
//       "price": 51600,
//       "quantity": 2,
//       "original_price": 69000,
//       "selected": true,
//     },
//   ];

//   void updateQuantity(int index, int change) {
//     setState(() {
//       if (cartItems[index]["quantity"] + change > 0) {
//         cartItems[index]["quantity"] += change;
//       }
//     });
//   }

//   void removeItem(int index) {
//     setState(() {
//       cartItems.removeAt(index);
//     });
//   }

//   void toggleSelect(int index) {
//     setState(() {
//       cartItems[index]["selected"] = !cartItems[index]["selected"];
//     });
//   }

//   void navigateToCart(BuildContext context) {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const CartScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final currencyFormat =
//         NumberFormat("#,###", "vi_VN"); // Định dạng số tiền VNĐ
//     final totalPrice = cartItems.fold<num>(
//       0,
//       (sum, item) => sum + (item['price'] as num) * (item['quantity'] as num),
//     );
//     final discount = 50000; // Giảm giá cố định
//     final finalPrice = totalPrice - discount;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFFF712D),
//         title: const Text(
//           "Thanh toán đơn hàng",
//           style: TextStyle(color: Colors.white),
//           textAlign: TextAlign.center,
//         ),
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios_new,
//             color: Colors.white, // Đổi màu icon thành trắng
//           ),
//           onPressed: () => navigateToCart(context), // Điều hướng về giỏ hàng
//         ),
//       ),
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             padding: const EdgeInsets.only(
//                 bottom: 200), // Adjust padding to avoid overlap
//             child: Column(
//               children: [
//                 Container(
//                   color: Colors.white,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 8),
//                       Row(
//                         children: [
//                           Container(
//                             width: 2,
//                             height: 19,
//                             decoration: const BoxDecoration(
//                               color: Color(0xFFFF712D),
//                               borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(8),
//                                 bottomRight: Radius.circular(8),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           const Text(
//                             "Sản phẩm",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 16),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: ListView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: cartItems.length,
//                           itemBuilder: (context, index) {
//                             return OrderItem(
//                               item: cartItems[index],
//                               onUpdateQuantity: (change) =>
//                                   updateQuantity(index, change),
//                               onRemove: () => removeItem(index),
//                               onToggleSelect: () => toggleSelect(index),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border(top: BorderSide(color: Colors.grey.shade300)),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         "Tổng tiền hàng:",
//                         style: TextStyle(fontSize: 14, color: Colors.black),
//                       ),
//                       Text(
//                         "${currencyFormat.format(totalPrice)} đ",
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         "Giảm giá:",
//                         style: TextStyle(fontSize: 14, color: Colors.black),
//                       ),
//                       Text(
//                         "-${currencyFormat.format(discount)} đ",
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const Divider(height: 24, thickness: 1),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         "Tổng thanh toán:",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.red,
//                         ),
//                       ),
//                       Text(
//                         "${currencyFormat.format(finalPrice)} đ",
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Thêm logic POST lên API tại đây
//                       print("POST sản phẩm đã chọn lên API");
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFFFF712D),
//                       minimumSize: const Size(double.infinity, 44),
//                     ),
//                     child: const Text(
//                       "Xác nhận đặt hàng",
//                       style: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
