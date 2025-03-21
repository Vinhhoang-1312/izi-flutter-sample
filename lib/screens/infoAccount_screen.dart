import 'package:flutter/material.dart';
import '../widgets/infoAccount_widgets/infoAccount_item.dart';
import '../widgets/infoAccount_widgets/infoAccount_summary.dart';
import '../widgets/infoAccount_widgets/inforAccount_top.dart';

class InfoAccountScreen extends StatefulWidget {
  const InfoAccountScreen({super.key});

  @override
  _InfoAccountScreenState createState() => _InfoAccountScreenState();
}

class _InfoAccountScreenState extends State<InfoAccountScreen> {
  final int totalPrice = 35000;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: InfoAccountTop(), // Sử dụng phần AppBar từ file widget riêng
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: InfoAccountItem(),
            ),
          ),
          InfoAccountSummary(),
        ],
      ),
    );
  }
}
