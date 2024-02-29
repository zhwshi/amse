import 'package:flutter/material.dart';

class Exercice1Page extends StatelessWidget {
  const Exercice1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 1,montrer l’image'),
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