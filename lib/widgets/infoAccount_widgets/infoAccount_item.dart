import 'package:flutter/material.dart';

class InfoAccountItem extends StatefulWidget {
  const InfoAccountItem({super.key});

  @override
  State<InfoAccountItem> createState() => _InfoAccountItemState();
}

class _InfoAccountItemState extends State<InfoAccountItem> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _selectedGender = "Nam";
  String _selectedDate = "Chọn ngày";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Đặt màu nền trắng
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ảnh đại diện
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage("assets/images/chinhsuaanhdaidien.jpg"),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      // TODO: Thêm chức năng cập nhật ảnh
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: TextButton(
              onPressed: () {
                // TODO: Thêm chức năng chỉnh sửa ảnh
              },
              child: const Text(
                "Chỉnh sửa ảnh đại diện",
                style: TextStyle(color: Color(0xFF433878), fontSize: 14),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Form nhập thông tin
          _buildInputField("Họ và tên", "Nhập họ và tên", _nameController),
          const SizedBox(height: 10),

          _buildInputField(
              "Số điện thoại", "Nhập số điện thoại", _phoneController),
          const SizedBox(height: 10),

          _buildInputField("Email", "Nhập email", _emailController),
          const SizedBox(height: 10),

          // Ngày sinh và giới tính
          // Hiển thị Ngày sinh và Giới tính ngang hàng
          Row(
            children: [
              // Ô Ngày sinh
              Expanded(
                child: _buildDateField("Ngày sinh"),
              ),

              const SizedBox(width: 20), // Khoảng cách giữa hai ô

              // Ô Giới tính
              Expanded(
                child:
                    _buildDropdownField("Giới tính", ["Nam", "Nữ", "LGBTQ+"]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget Input Field
  Widget _buildInputField(
      String label, String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$label ", // Phần chữ màu mặc định
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Màu chữ chính
                  ),
                ),
                const TextSpan(
                  text: "*", // Dấu sao màu đỏ
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Màu đỏ cho dấu *
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              filled: true, // Đảm bảo nền input là trắng
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
        ],
      ),
    );
  }

  // Widget Chọn Ngày Sinh
  Widget _buildDateField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Ngày sinh ", // Tiêu đề chính
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "*", // Dấu sao đỏ
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),

          // Ô chọn ngày sinh
          GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                setState(() {
                  _selectedDate =
                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white, // Nền trắng
                border: Border.all(color: Colors.grey), // Viền xám nhạt
                borderRadius: BorderRadius.circular(8), // Bo góc tròn
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedDate,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                  const Icon(
                    Icons.calendar_month, // Icon lịch
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget Dropdown Giới Tính
  Widget _buildDropdownField(String label, List<String> options) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label với dấu *
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$label ",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const TextSpan(
                  text: "*",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),

          // Dropdown chọn giới tính
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 12), // Tăng padding để cao hơn

            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8), // Bo góc tròn
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedGender,
                // isDense: true, // Giảm khoảng cách thừa trong dropdown
                isExpanded: true, // Đảm bảo menu xổ xuống chiếm đủ width của ô.
                alignment: Alignment.centerLeft, // Căn chữ về bên trái
                // Giữ icon mũi tên
                icon: const Icon(Icons.arrow_drop_down, color: Colors.black54),
                items: options.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 16), // Cỡ chữ 16
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
