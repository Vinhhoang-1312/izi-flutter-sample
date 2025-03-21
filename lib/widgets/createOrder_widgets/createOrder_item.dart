import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:solar_icons/solar_icons.dart'; // Import thư viện Solar Icons
import 'package:dotted_border/dotted_border.dart';

import 'package:my_app/widgets/createOrder_widgets/box.dart';

class CreateOrderItem extends StatefulWidget {
  const CreateOrderItem({super.key});

  @override
  _CreateOrderItemState createState() => _CreateOrderItemState();
}

class _CreateOrderItemState extends State<CreateOrderItem> {
  File? _image;
  final picker = ImagePicker();
  int _selectedQuantity = 1; // Mặc định là 1
  int Itemsize = 10;
  List<String> selectedImages = [
    "assets/images/caihop.jpg" // Ảnh mặc định hiển thị
  ];
  String selectedOption = "Cho xem hàng, không cho thử"; // Giá trị mặc định
  final List<String> deliveryOptions = [
    "Cho xem hàng, không cho thử",
    "Cho xem hàng",
    "Cho thử"
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _pickImage2() {
    // Giả lập chọn ảnh (Thực tế sẽ dùng Image Picker)
    setState(() {
      selectedImages.add("assets/images/caihop.jpg");
    });
  }

  void _removeImage(int index) {
    setState(() {
      selectedImages.removeAt(index);
    });
  }

  void _removeAllImages() {
    setState(() {
      selectedImages.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.white, // Set the background color to white
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      spreadRadius: 1,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dòng "Thông tin người gửi"
                    Row(
                      children: [
                        Icon(Icons.radio_button_off, color: Colors.green),
                        SizedBox(width: 8),
                        Text("Thông tin người gửi",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54)),
                      ],
                    ),
                    // Dấu gạch ngang chia cách
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Divider(color: Colors.grey),
                    ),
                    // Dòng "Thông tin người nhận"
                    Row(
                      children: [
                        Icon(SolarIconsBold.box,
                            color: Colors.amber), // Icon hộp vàng
                        SizedBox(width: 8),
                        Text("Thông tin người nhận",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),

              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 12, vertical: 12), // Thêm padding 16px hai bên
                child: Text(
                  "THÔNG TIN HÀNG HÓA",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10), // Thêm padding 16px hai bên
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Chọn nếu đơn hàng của bạn cồng kềnh/nhiều kiện",
                        style:
                            TextStyle(color: Color(0xFF677275), fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      width: 17,
                      height: 17,
                      child: Checkbox(
                        value: false, // Mặc định chưa chọn
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4), // Bo góc 1px
                        ),
                        side: const BorderSide(
                          color: Color(0xFFFFDA00), // Viền màu vàng
                          width: 1.5, // Độ dày viền 1px
                        ),
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return const Color(
                                  0xFFFFDA00); // Màu nền khi được chọn
                            }
                            return Colors.white; // Màu nền khi chưa chọn
                          },
                        ),
                        checkColor: Colors.black, // Màu của dấu check
                        onChanged: (bool? value) {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

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
                  const SizedBox(width: 8),
                  const Text(
                    "Sản phẩm",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFB1B1B1)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    // Ảnh sản phẩm (bên trái)
                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        width: 56,
                        height: 56,
                        margin: const EdgeInsets.only(left: 6, right: 6),
                        decoration: const BoxDecoration(
                          color: Color(0xFFEDEDED),
                          shape: BoxShape.circle,
                        ),
                        child: _image != null
                            ? ClipOval(
                                child: Image.file(_image!, fit: BoxFit.cover),
                              )
                            : const Icon(Icons.camera_alt, color: Colors.grey),
                      ),
                    ),

                    // Cột chứa "Tên sản phẩm" và "KL (gam)"
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nhập tên sản phẩm
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 0.5)),
                            ),
                            child: TextField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                hintText: "Tên sản phẩm",
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                          // Nhập KL (gam)
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 0.5)),
                            ),
                            child: Row(
                              children: [
                                const Text("KL (gam)",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: TextField(
                                    controller: _weightController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      hintText: "KL sản phẩm",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Cột chứa "Mã SP" và "SL"
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nhập mã sản phẩm
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 0.5)),
                            ),
                            child: TextField(
                              controller: _codeController,
                              decoration: const InputDecoration(
                                hintText: "Mã SP",
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                          // Chọn số lượng (Dropdown)
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 0.5)),
                            ),
                            child: Row(
                              children: [
                                const Text("SL",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<int>(
                                      value: _selectedQuantity,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedQuantity = newValue!;
                                        });
                                      },
                                      items: List.generate(
                                              50, (index) => index + 1)
                                          .map((value) => DropdownMenuItem<int>(
                                                value: value,
                                                child: Text(value.toString()),
                                              ))
                                          .toList(),
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      isExpanded: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
// Hàng nút bấm (Chọn, Sao chép, Lưu, Thêm sản phẩm)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10), // Thêm padding 10px hai bên
                child: Row(
                  children: [
                    _tag("Chọn",
                        withDropdown: true,
                        fontSize: 12), // Thêm fontSize vào hàm _tag nếu hỗ trợ
                    const SizedBox(width: 8),
                    _tag("Sao chép", fontSize: 12),
                    const SizedBox(width: 8),
                    _tag("Lưu", fontSize: 12),
                    const SizedBox(width: 8),

                    // Nút "Thêm sản phẩm"
                    Expanded(
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          backgroundColor:
                              const Color(0x1A8E6700), // Màu nền 10% opacity
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Bo góc
                          ),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.add,
                            color: Color(0xFF8E6700)), // Màu icon
                        label: const Text(
                          "Thêm sản phẩm",
                          style: TextStyle(
                            color: Color(0xFF8E6700), // Màu chữ
                            fontWeight: FontWeight.bold,
                            fontSize: 12, // Thêm fontSize 12
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 2,
                          height: 19,
                          margin: EdgeInsets.only(right: 10),
                          decoration: const BoxDecoration(
                            color: Color(0xFFFF4D00),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(7),
                              bottomRight: Radius.circular(7),
                            ),
                          ),
                        ),
                        const Text(
                          "Thông tin gói hàng",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        const Text(
                          "Tổng KL (gam): 4.000",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0C38A8),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.only(left: 15),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          box(title: "Chiều dài", boxWidth: 150),
                          box(title: "Chiều rộng", boxWidth: 150),
                          box(title: "Chiều cao", boxWidth: 150),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Text(
                        "Khối lượng quy đổi: 200 gam",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF677275),
                        ),
                      ),
                    ),
                    const Row(
                      children: [
                        box(title: "Thu hộ", boxWidth: 250, suffixText: "đ"),
                        box(
                            title: "Giá trị hàng",
                            suffixIcon: Icon(Icons.info,
                                color: Color(0xFF8E6700), size: 18),
                            boxWidth: 250,
                            suffixText: "đ"),
                      ],
                    ),
                    Row(
                      children: [
                        // Checkbox
                        CheckboxTheme(
                          data: CheckboxThemeData(
                            side: const BorderSide(
                              color: Colors.yellow,
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Checkbox(
                            value: true,
                            onChanged: (bool? value) {},
                            activeColor: Color(0xFFFFDA00),
                          ),
                        ),

                        // Văn bản "Giao thất bại - Thu tiền"
                        const Text(
                          "Giao thất bại - Thu tiền",
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(width: 10),

                        // Ô chứa số tiền + icon + chữ "Chi tiết" với gạch dưới kéo dài
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors
                                      .grey, // Gạch dưới chạy hết chiều ngang
                                  width: 1,
                                ),
                              ),
                            ),
                            child: const Row(
                              children: [
                                // Ô nhập số tiền (nằm bên trái)
                                Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: InputDecoration(
                                      hintText:
                                          "0", // Hiển thị mặc định nếu chưa nhập
                                      border: InputBorder
                                          .none, // Ẩn khung viền mặc định
                                      isDense: true, // Giúp text không quá cao
                                      contentPadding: EdgeInsets
                                          .zero, // Loại bỏ padding mặc định
                                    ),
                                  ),
                                ),

                                // Icon info & chữ "Chi tiết"
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.info,
                                        color: Color(0xFF8E6700), size: 16),
                                    SizedBox(width: 5),
                                    Text(
                                      "Chi tiết",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                        color: Color(0xFF8E6700),
                                        decoration: TextDecoration.underline,
                                        decorationColor: Color(0xFF8E6700),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 16), // Cách viền màn hình 16px
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tiêu đề + nút Xóa tất cả
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Ảnh đơn hàng",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        GestureDetector(
                          onTap: _removeAllImages,
                          child: const Text(
                            "Xóa tất cả",
                            style: TextStyle(
                                color: Color(0xFF0C38A8),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Khu vực chứa ảnh, bọc thêm container để có viền bao quanh
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          // Ô thêm ảnh (Dùng viền nét đứt)
                          GestureDetector(
                            onTap: _pickImage,
                            child: DottedBorder(
                              color: Colors.grey,
                              strokeWidth: 1,
                              dashPattern: [6, 3],
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(10),
                              child: Container(
                                width: 75,
                                height: 75,
                                color: Colors.transparent,
                                child: const Icon(Icons.camera_alt,
                                    color: Colors.grey),
                              ),
                            ),
                          ),

                          // Hiển thị ảnh đã chọn
                          ...selectedImages.asMap().entries.map((entry) {
                            int index = entry.key;
                            String image = entry.value;
                            return Stack(
                              children: [
                                Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 2,
                                  right: 2,
                                  child: GestureDetector(
                                    onTap: () => _removeImage(index),
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black54,
                                      ),
                                      child: const Icon(Icons.close,
                                          color: Colors.white, size: 14),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),

                          // Ô rỗng để giữ layout
                          if (selectedImages.length < 5)
                            Container(
                              width: 75,
                              height: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 255, 255, 255)
                                    .withOpacity(0.1),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  Container(
                    width: 2,
                    height: 19,
                    margin: EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF4D00),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(7),
                        bottomRight: Radius.circular(7),
                      ),
                    ),
                  ),
                  const Text(
                    "Lưu ý - Ghi chú",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              Container(
                width: double.infinity, // Container tổng bọc hết màn hình
                padding: const EdgeInsets.symmetric(
                    horizontal: 14), // Cách viền trái & phải đúng như ảnh
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Canh trái cho text
                  children: [
                    const Text(
                      "Lưu ý giao hàng",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: double.infinity, // Container tổng bọc hết màn hình
                      height: 43, // Độ cao chuẩn
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            width: 0.25), // Viền mỏng 0.25px
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedOption,
                          items: deliveryOptions.map((String option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(option,
                                  style: const TextStyle(fontSize: 14)),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedOption = newValue!;
                            });
                          },
                          icon: const Icon(Icons.expand_more,
                              size: 16), // Chevron xuống
                          isExpanded: true,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Ghi chú đơn hàng",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: double.infinity, // Container tổng bọc hết màn hình
                      height: 80, // Độ cao chuẩn
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Nhập ghi chú cho tài xế",
                          hintStyle: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFFB1B1B1)), // Màu chữ nhạt
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Colors.grey.shade300,
                                width: 0.25), // Viền mỏng 0.25px
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                        ),
                        maxLength: 120,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _buildTagButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {},
      child: Text(text, style: const TextStyle(color: Colors.black)),
    );
  }
}

Widget _tag(String text, {bool withDropdown = false, double fontSize = 12}) {
  return TextButton(
    style: TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      backgroundColor:
          const Color(0x1A8E6700), // Màu nền #8E67001A (10% opacity)
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4), // Bo góc 4px
      ),
    ),
    onPressed: () {},
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.black87, // Màu chữ đậm
            fontWeight: FontWeight.w500,
            fontSize: fontSize, // Áp dụng fontSize từ tham số
          ),
        ),
        if (withDropdown)
          const Icon(Icons.arrow_drop_down, size: 18, color: Colors.black87),
      ],
    ),
  );
}
