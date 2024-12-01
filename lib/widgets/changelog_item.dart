import 'package:flutter/material.dart';

class ChangeLogItem extends StatelessWidget {
  final String title;
  final String description;

  ChangeLogItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(description, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
