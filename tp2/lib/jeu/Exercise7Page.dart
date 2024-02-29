import 'package:flutter/material.dart';

class Exercice7Page extends StatelessWidget {
  const Exercice7Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 1'),
      ),
      body: Center(
        child: Image.asset(
          'images/example_image.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}