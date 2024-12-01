import 'package:flutter/material.dart';
import 'screens/me_page.dart';

void main() {
  runApp(ShopeeMeClone());
}

class ShopeeMeClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MePage(),
    );
  }
}
