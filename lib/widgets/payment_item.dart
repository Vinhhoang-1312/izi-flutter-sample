import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final Function(int) onUpdateQuantity;
  final Function() onRemove;
  final Function() onToggleSelect;

  const PaymentItem({
    super.key,
    required this.item,
    required this.onUpdateQuantity,
    required this.onRemove,
    required this.onToggleSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(item["image"]),
      title: Text(item["name"]),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Price: ${item["price"]}"),
          if (item["original_price"] != null)
            Text(
              "Original Price: ${item["original_price"]}",
              style: const TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () => onUpdateQuantity(-1),
          ),
          Text("${item["quantity"]}"),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => onUpdateQuantity(1),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onRemove,
          ),
        ],
      ),
      onTap: onToggleSelect,
    );
  }
}
