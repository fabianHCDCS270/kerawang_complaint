import 'package:flutter/material.dart';

class PurchaseOption extends StatelessWidget {
  final IconData icon;
  final String label;

  PurchaseOption({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.orange,
          child: Icon(icon, size: 30, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
