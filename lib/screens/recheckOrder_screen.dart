import 'package:flutter/material.dart';
import '../widgets/recheckOrder_widgets/recheckOrder_top.dart';
import '../widgets/recheckOrder_widgets/recheckOrder_item.dart';
import '../widgets/recheckOrder_widgets/recheckOrder_summary.dart';

class RecheckOrderScreen extends StatefulWidget {
  const RecheckOrderScreen({super.key});

  @override
  _RecheckOrderScreenState createState() => _RecheckOrderScreenState();
}

class _RecheckOrderScreenState extends State<RecheckOrderScreen> {
  final int totalPrice = 35000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const RecheckOrderTop(), // Sử dụng phần AppBar từ file widget riêng
      body: Column(
        children: [
          const Expanded(
            child: SingleChildScrollView(
              child: RecheckOrderItem(),
            ),
          ),
          RecheckOrderSummary(totalPrice: totalPrice),
        ],
      ),
    );
  }
}
