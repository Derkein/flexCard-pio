import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  final String numero;

  const TestPage({
    Key? key,
    required this.numero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text('$numero apge')],
      ),
    );
  }
}
