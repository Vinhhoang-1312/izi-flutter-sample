import 'package:flutter/material.dart';
import 'package:my_app/screens/screen.dart';
// import 'package:iconsax/iconsax.dart'; // Thư viện icon
import '../../screens/infoAccount_screen.dart';
import '../../services/auth_service.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tiêu đề "Cài đặt"
        const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            "Cài đặt",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),

        // Danh sách các mục
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              _buildListTile(Icons.person, "Thông tin tài khoản", context),
              _buildListTile(Icons.inventory_2, "Trả hàng nhập kho", context),
              _buildListTile(Icons.lock, "Thay đổi mật khẩu", context),
              _buildLogoutTile(Icons.exit_to_app, "Đăng xuất",
                  context), // Tạo riêng nút logout
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildListTile(IconData icon, String title, BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black54),
          title: Text(title),
          trailing: Icon(Icons.chevron_right,
              color: Colors.black54), // Mũi tên bên phải
          onTap: () {
            // Xử lý khi bấm vào
            if (title == "Thông tin tài khoản") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoAccountScreen(),
                  )); // Mở trang thông tin tài khoản
            }
          },
        ),
        Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.shade300), // Đường kẻ dưới mỗi item
      ],
    );
  }
}

Widget _buildLogoutTile(IconData icon, String title, BuildContext context) {
  return Column(
    children: [
      ListTile(
        leading: Icon(icon, color: Colors.red), // Màu đỏ cho nút logout
        title: Text(title, style: TextStyle(color: Colors.red)),
        trailing: Icon(Icons.chevron_right, color: Colors.red),
        onTap: () async {
          bool confirmLogout = await _showLogoutDialog(context);
          if (confirmLogout) {
            AuthService().logout(); // Xóa user khỏi GetStorage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => NavigationScreen()),
            );
          }
        },
      ),
      Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
    ],
  );
}

Future<bool> _showLogoutDialog(BuildContext context) async {
  return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Xác nhận"),
          content: Text("Bạn có chắc chắn muốn đăng xuất không?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("Hủy"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text("Đăng xuất", style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ) ??
      false;
}
