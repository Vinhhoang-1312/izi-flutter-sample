import 'package:flutter/material.dart';
import '../widgets/account_widgets/account_category.dart';
import '../widgets/account_widgets/account_setting.dart';
import '../widgets/account_widgets/account_topbar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Tài khoản')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AccountTop(),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  SizedBox(
                    width: double.infinity, // Giúp mở rộng theo chiều ngang
                    child: Text(
                      "Danh mục",
                      textAlign: TextAlign.left, // Căn trái
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  SizedBox(height: 12),
                  AccountCategory(),
                  SizedBox(height: 16),
                  AccountSetting(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
