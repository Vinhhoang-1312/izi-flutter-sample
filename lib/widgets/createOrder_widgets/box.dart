import 'package:flutter/material.dart';

class box extends StatefulWidget {
  final String title;
  final Widget? suffixIcon; // Thêm icon bên cạnh title
  final double boxWidth; // Cho phép điều chỉnh độ rộng
  final String suffixText; // Cho phép thay đổi đơn vị

  const box(
      {required this.title,
      this.boxWidth = 100,
      this.suffixText = "cm", // Mặc định là "cm"
      this.suffixIcon,
      Key? key})
      : super(key: key);
  @override
  _ItemsizeState createState() => _ItemsizeState();
}

class _ItemsizeState extends State<box> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "0"); // Mặc định là 0
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Đảm bảo các box chiếm khoảng trống đều nhau
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        // Khoảng cách đều hai bên
        // height: 34,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF464647),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                if (widget.suffixIcon != null)
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: widget.suffixIcon!,
                  ),
              ],
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: widget.boxWidth, // Tùy chỉnh độ rộng của box
              height: 34,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 12), // Đảm bảo khoảng cách hai bên
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Căn giữa theo chiều dọc
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.left,
                        textAlignVertical:
                            TextAlignVertical.center, // Căn giữa theo chiều dọc

                        decoration: InputDecoration(
                          isDense:
                              true, // Đặt false để không làm box bị thu nhỏ
                          // contentPadding: EdgeInsets.symmetric(
                          //     vertical: 15,
                          //     horizontal: 15), // Cân đối padding để text nằm giữa
                          contentPadding:
                              EdgeInsets.zero, // Tránh padding dư thừa

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Colors.grey.shade300, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                width: 1.5),
                          ),
                          suffixText: widget
                              .suffixText, // Đổi "cm" thành bất kỳ đơn vị nào
                          suffixStyle:
                              TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        onChanged: (value) {
                          if (value.isEmpty) {
                            setState(() {
                              _controller.text = "0";
                              _controller.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset: _controller.text.length));
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
