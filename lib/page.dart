import 'package:flutter/material.dart';

class PageMain extends StatelessWidget {
  const PageMain({
    super.key,
    required this.payload,
  });
  final String payload;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello from page 2'),
        ),
      ),
    );
  }
}
