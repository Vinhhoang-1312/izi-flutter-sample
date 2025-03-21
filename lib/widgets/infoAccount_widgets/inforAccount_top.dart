import 'package:flutter/material.dart';

class InfoAccountTop extends StatelessWidget implements PreferredSizeWidget {
  const InfoAccountTop({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFD2C2CF),
      title: const Text(
        "Thông tin cá nhân",
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
