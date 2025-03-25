import 'package:flutter/material.dart';

class WalletDepositScreen extends StatefulWidget {
  const WalletDepositScreen({super.key});

  @override
  _WalletDepositScreenState createState() => _WalletDepositScreenState();
}

class _WalletDepositScreenState extends State<WalletDepositScreen> {
  bool isDeposit = true; // Đang chọn tab "Nạp tiền"
  TextEditingController amountController = TextEditingController();
  String selectedPayment = ""; // Lưu nguồn tiền đã chọn

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Thanh tab chọn "Nạp tiền" - "Rút tiền"
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // height: 30,
              _buildTabContainer("Nạp tiền", true, Icons.login),

              const Divider(
                thickness: 2,
                color: Color.fromARGB(255, 86, 86, 86),
              ),
              // Padding(
              //   padding: EdgeInsets.all(8.0), // Khoảng cách đều 4 phía
              //   child: Divider(
              //     thickness: 2,
              //     color: Color.fromARGB(255, 86, 86, 86),
              //   ),
              // ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10), // Khoảng cách phía dưới
                child: SizedBox(
                  height: 30, // Chiều cao của đường kẻ
                  child: VerticalDivider(
                    thickness: 1,
                    color: Color.fromARGB(255, 86, 86, 86),
                  ),
                ),
              ),

              _buildTabContainer("Rút tiền", false, Icons.logout),
            ],
          ),
        ),

        // const Divider(height: 1, thickness: 1, color: Colors.grey),
        const SizedBox(height: 10),

        Container(
          color: Colors.white,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ô nhập số tiền
                const Text("Số tiền cần nạp",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                        color: Color(
                            0xFFB1B1B1)), // Đổi màu chữ của hint thành xám

                    hintText: "0đ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Nút chọn nhanh số tiền
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildAmountButton("100,000"),
                    _buildAmountButton("200,000"),
                    _buildAmountButton("500,000"),
                    _buildAmountButton("1,000,000"),
                  ],
                ),
                const SizedBox(height: 20),

                // Danh sách nguồn tiền
                const Text("Nguồn tiền",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                _buildPaymentOption("VNPAY", "assets/images/vnpay.png"),
                _buildPaymentOption("Ví MoMo", "assets/images/momo.png"),
                _buildPaymentOption(
                    "Chuyển khoản ngân hàng", "assets/images/bank.jpg"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabButton(String title, bool isDepositTab, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDeposit = isDepositTab;
        });

        // if (!isDepositTab) {
        //   Navigator.push(
        //     // context,
        //     // MaterialPageRoute(
        //     //     builder: (context) => const WalletWithdrawScreen()),
        //   );
        // }
      },
      child: Column(
        children: [
          Row(
            children: [
              // Bọc Icon trong một Container có viền
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: isDeposit == isDepositTab
                      ? Color(0xFF416D19)
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDeposit == isDepositTab
                      ? Color(0xFF416D19)
                      : Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // if (isDeposit == isDepositTab)
          //gạch
          Container(
            height: 2,
            width: 150,
            color: isDeposit == isDepositTab
                ? Color(0xFF416D19)
                : Colors.transparent,
          ),
        ],
      ),
    );
  }

  // Hàm tạo nút chọn số tiền
  Widget _buildAmountButton(String amount) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.all(10),
        side: const BorderSide(color: Colors.green),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        setState(() {
          amountController.text = amount.replaceAll(",", "");
        });
      },
      child: Text(amount, style: const TextStyle(color: Colors.green)),
    );
  }

  Widget _buildTabContainer(String title, bool isDepositTab, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      decoration: BoxDecoration(
        color: isDeposit == isDepositTab ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: _buildTabButton(title, isDepositTab, icon),
    );
  }

  // Hàm tạo tùy chọn nguồn tiền
  Widget _buildPaymentOption(String title, String assetPath) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(0), // Khoảng cách bên trong ô ảnh
        decoration: BoxDecoration(
          color: title == "Ví MoMo"
              ? Colors.pink.shade100
              : Colors.transparent, // Nền hồng cho Ví MoMo
          borderRadius: BorderRadius.circular(8), // Bo góc cho ô ảnh
        ),
        child: Image.asset(assetPath, width: 30, height: 30),
      ),
      title: Text(title),
      trailing: Radio<String>(
        value: title,
        groupValue: selectedPayment,
        onChanged: (String? value) {
          setState(() {
            selectedPayment = value!;
          });
        },
      ),
    );
  }
}

// Màn hình rút tiền (tạm thời)
class WalletWithdrawScreen extends StatelessWidget {
  const WalletWithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rút tiền")),
      body: const Center(child: Text("Chức năng rút tiền")),
    );
  }
}
