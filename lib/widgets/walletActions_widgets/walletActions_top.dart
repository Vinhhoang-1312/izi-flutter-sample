import 'package:flutter/material.dart';

class WalletActionsTop extends StatelessWidget implements PreferredSizeWidget {
  const WalletActionsTop({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFE0FB9D),
      title: const Text(
        "Nạp/Rút",
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
