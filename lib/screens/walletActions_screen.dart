import 'package:flutter/material.dart';
import '../widgets/walletActions_widgets/walletActions_top.dart';
import '../widgets/walletActions_widgets/walletActions_item.dart';
import '../widgets/walletActions_widgets/walletActions_summary.dart';

class WalletActionsScreen extends StatefulWidget {
  const WalletActionsScreen({super.key});

  @override
  _WalletActionsScreenState createState() => _WalletActionsScreenState();
}

class _WalletActionsScreenState extends State<WalletActionsScreen> {
  // final int totalPrice = 35000;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: WalletActionsTop(), // Sử dụng phần AppBar từ file widget riêng
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: WalletDepositScreen(),
            ),
          ),
          WalletActionsSummary(),
        ],
      ),
    );
  }
}
