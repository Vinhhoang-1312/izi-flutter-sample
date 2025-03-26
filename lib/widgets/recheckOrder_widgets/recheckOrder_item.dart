import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart'; // Import thư viện Solar Icons

class RecheckOrderItem extends StatefulWidget {
  const RecheckOrderItem({super.key});

  @override
  _RecheckOrderItemState createState() => _RecheckOrderItemState();
}

class _RecheckOrderItemState extends State<RecheckOrderItem> {
  int _selectedPayment = 1;

  final List<String> paymentMethods = [
    "Người gửi trả tiền mặt",
    "Người nhận trả tiền mặt",
    "MoMo",
    "VNPAY"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildOrderSection1(),
          _buildOrderSection2(),
        ],
      ),
    );
  }

  Widget _buildOrderDetails() {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        // boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        children: [
          _buildUserInfo(
            "Người gửi",
            "Phuong Anh Hoang",
            "0905678910",
            "Số 10 Phạm Văn Đồng, thị trấn Núi Thành, Quảng Nam",
            Icons.radio_button_off, // Icon hình tròn
            Colors.green,
          ),
          // Gạch ngang ngăn cách
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Divider(
              color: Colors.grey, // Màu gạch ngang
              thickness: 0.8, // Độ dày
            ),
          ),

          _buildUserInfo(
            "Người nhận",
            "Minh Nguyett",
            "0987654323",
            "103 Hoài Thanh, Phường Mỹ An, Quận Ngũ Hành Sơn, TP Đà Nẵng",
            Icons.inventory_2, // Icon hộp vàng
            Colors.amber,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSection1() {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero, // Xóa padding để sát mép
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader("Chi tiết đơn hàng"),
          _buildOrderDetails(),
        ],
      ),
    );
  }

  Widget _buildOrderSection2() {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero, // Xóa padding để sát mép
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader("Chi tiết thanh toán"),
          _buildPaymentContainer(),
        ],
      ),
    );
  }

  Widget _buildUserInfo(String label, String name, String phone, String address,
      IconData iconData, Color iconColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 32,
          child: Icon(iconData, color: iconColor, size: 24),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Row(
                children: [
                  SizedBox(
                    width: 150, // Điều chỉnh chiều rộng tùy theo thiết kế
                    child: Text(
                      name,
                      style: const TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1, // Giới hạn hiển thị 1 dòng
                    ),
                  ),
                  const SizedBox(width: 2),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                            color: Color(0xFF677275),
                            width: 1), // Chỉ hiển thị gạch bên trái
                      ),
                    ),
                    child: Text(
                      phone,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(address,
                  style: const TextStyle(fontSize: 14, color: Colors.black54)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentContainer() {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        // boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: _buildPaymentOptions(),
    );
  }

  Widget _buildPaymentOptions() {
    final List<Widget> paymentIcons = [
      _buildPaymentIcon(
        const Icon(SolarIconsBold.dollar,
            size: 14, color: Colors.black), // Giảm size icon
      ),
      _buildPaymentIcon(
        const Icon(SolarIconsBold.dollar, size: 14, color: Colors.black),
      ),
      _buildPaymentIcon(
        Image.asset(
          "assets/images/momotrang.png",
          width: 40, // Giảm kích thước ảnh
          height: 30,
          fit: BoxFit.contain,
          color: const Color(0xFFA50064),
        ),
      ),
      _buildPaymentIcon(
        Image.asset(
          "assets/images/vnpay.png",
          width: 30, // Giảm kích thước ảnh
          height: 20,
          fit: BoxFit.contain,
        ),
      ),
    ];

    return Column(
      children: List.generate(paymentMethods.length, (index) {
        return InkWell(
          onTap: () {
            setState(() {
              _selectedPayment = index;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    paymentIcons[index], // Ô ảnh có viền & bo góc nhỏ hơn
                    const SizedBox(width: 8),
                    Text(paymentMethods[index]),
                  ],
                ),
                Radio(
                  value: index,
                  groupValue: _selectedPayment,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedPayment = value!;
                    });
                  },
                  activeColor: Colors.orange,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildPaymentIcon(Widget child) {
    return Container(
      width: 40, // Giảm kích thước ô ảnh
      height: 30,
      padding: const EdgeInsets.all(4), // Giảm khoảng cách viền
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1), // Viền nhỏ hơn
        borderRadius: BorderRadius.circular(4), // Bo góc nhẹ hơn
        color: Colors.white,
      ),
      child: Center(child: child),
    );
  }

  Widget _buildHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 1, top: 12),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            color: Colors.orange,
          ),
          const SizedBox(width: 8),
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}
