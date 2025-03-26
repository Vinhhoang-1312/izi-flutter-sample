import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/widgets/order_widgets/order_summary.dart'; // Import thêm thư viện intl
import 'package:flutter_switch/flutter_switch.dart';

class OrderSummaryScreen extends StatelessWidget {
  final String userId;
  final List<Map<String, dynamic>> selectedItems;

  const OrderSummaryScreen({
    super.key,
    required this.userId,
    required this.selectedItems,
  });

  @override
  Widget build(BuildContext context) {
    // Định dạng tiền USD
    final currencyFormat = NumberFormat.currency(locale: "en_US", symbol: "\$");

    final totalPrice = selectedItems.fold<num>(
      0,
      (sum, item) => sum + (item['price'] as num) * (item['quantity'] as num),
    );
    final discount = 0.1; // Giảm giá cố định
    final finalPrice = totalPrice - discount;
    // const double exchangeRate = 20000; // 1 USD = 20,000 VND
    const shippingFee = 1; //doi final bang const
    const rewardPointsUsed = 1; //doi final bang const

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF712D),
        title: const Text(
          "Xác nhận đơn hàng",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Thông tin cửa hàng
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color:
                                              Colors.orange.withOpacity(0.08),
                                          borderRadius:
                                              BorderRadius.circular(8),
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

                  //   Danh sách sản phẩm

                  SizedBox(
                    height: 300, // Constrain the height for the list
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: selectedItems.length,
                      itemBuilder: (context, index) {
                        final item = selectedItems[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 4,
                                spreadRadius: 1,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  item['thumbnail'] ??
                                      "https://via.placeholder.com/90",
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['name'] ?? "Tên sản phẩm",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Số lượng: ${item['quantity']}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "${item['price']} đ",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

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
                        Container(
                          padding: const EdgeInsets.all(16),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Tổng tiền hàng
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Tổng tiền hàng:"),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                          "${currencyFormat.format(totalPrice)} đ"),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),

                              // Phí vận chuyển
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Phí vận chuyển:"),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                          "${currencyFormat.format(shippingFee)} "),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),

                              // Khuyến mãi
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Khuyến mãi:"),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                          "-${currencyFormat.format(discount)} "),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),

                              // Đã dùng điểm thưởng
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Đã dùng điểm thưởng:"),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                          "-${currencyFormat.format(rewardPointsUsed)} "),
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(),

                              // Tổng thanh toán
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Tổng thanh toán",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${currencyFormat.format(finalPrice)} ",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.red),
                                      ),
                                    ],
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
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16), // Add horizontal padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none, // Cho phép phần tử tràn ra một chút
                  children: [
                    // Container chính
                    Container(
                      padding: const EdgeInsets.fromLTRB(
                          12, 16, 12, 12), // Tạo khoảng trống trên
                      decoration: BoxDecoration(
                        color: const Color(0x1A0015FF), // Màu xanh lam nhạt
                        borderRadius:
                            BorderRadius.circular(12), // Bo góc tổng thể
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10), // Đẩy nội dung xuống một chút
                          Text(
                            "Mã giảm giá 30k đơn hàng ở BHX từ 450k - Thực phẩm tươi sống",
                            style: TextStyle(
                                color: Color(0xFF0015FF), fontSize: 14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),

                    // Nhãn "-30,000đ" ở góc trên bên trái
                    Positioned(
                      top: 1, // Giữ nó nằm trong khung
                      left: 1, // Giữ nó sát mép nhưng không tràn ra ngoài
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: const BoxDecoration(
                          color: Color(0xFF0015FF), // Màu nền xanh
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10), // Bo góc trên trái
                            bottomRight:
                                Radius.circular(10), // Bo góc dưới phải
                          ),
                        ),
                        child: const Text(
                          "-30,000đ",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    // Mũi tên ở góc trên bên phải
                    Positioned(
                      top: 6, // Điều chỉnh cho nó không bị lệch
                      right: 6, // Đẩy vào trong một chút để không tràn ra ngoài
                      child: Container(
                        padding: const EdgeInsets.all(
                            4), // Cho icon có chút không gian
                        decoration: const BoxDecoration(
                          // color: Color(
                          //     0x1A0015FF), // 10% độ trong suốt của màu xanh
                          shape: BoxShape.circle, // Làm bo tròn icon cho đẹp
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Color(0xFF0015FF),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 24,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Dùng 200 điểm thưởng",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    FlutterSwitch(
                      width: 32, // Chiều rộng công tắc
                      height: 18, // Chiều cao công tắc
                      toggleSize: 12, // Kích thước nút tròn bên trong
                      value: true,
                      activeColor: const Color(0xFF259329), // Màu khi bật
                      onToggle: (bool value) {
                        // Thêm logic thay đổi điểm thưởng ở đây
                      },
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Thêm logic POST lên API tại đây
                    print("POST sản phẩm đã chọn lên API với userId: $userId");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF712D),
                    minimumSize: const Size(double.infinity, 44),
                  ),
                  child: const Text(
                    "Xác nhận đặt hàng",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),

          // OrderSummary(
          //   userId: userId,
          //   onPressed: () {
          //     // Logic POST lên API
          //     print("POST sản phẩm đã chọn lên API với userId: $userId");
          //   },
          // ),
        ],
      ),
    );
  }
}
