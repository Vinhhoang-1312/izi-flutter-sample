import 'package:flutter/material.dart';
import '../widgets/createOrder_widgets/createOrder_item.dart'; // Import createOrder_item
import '../widgets/createOrder_widgets/createOrder_summary.dart'; // Import createOrder_summary

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  _CreateOrderScreenState createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  final int totalPrice = 35000; // Define totalPrice as a class member

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFDA00),
        title: const Text(
          "Kiểm tra đơn hàng",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            child: SingleChildScrollView(
              child: CreateOrderItem(),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CreateOrderSummary(totalPrice: totalPrice),
          ),
        ],
      ),
    );
  }
}
