import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart Screen')),
      body: Center(
        child: Text('This is the Cart Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
