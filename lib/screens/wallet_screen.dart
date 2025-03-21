import 'package:flutter/material.dart';
import '../widgets/wallet_widgets/wallet_item.dart';
import '../widgets/wallet_widgets/wallet_top.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE0FB9D),
        title: const Text(
          "Ví tiền",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Column(
        children: [
          WalletTop(), // WalletTop hiển thị bên trong body, dưới AppBar
          Expanded(
            child: SingleChildScrollView(
              child: WalletItem(),
            ),
          ),
          // WalletSummary(),
        ],
      ),
    );
  }
}
