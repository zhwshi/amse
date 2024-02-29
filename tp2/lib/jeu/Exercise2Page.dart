import 'package:flutter/material.dart';

class Exercice2Page extends StatefulWidget {
  const Exercice2Page({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Exercice2PageState createState() => _Exercice2PageState();
}

class _Exercice2PageState extends State<Exercice2Page> {
  double _rotationValue = 0.0;
  double _scaleValueX = 1.0; // Échelle horizontale
  double _scaleValueY = 1.0; // Échelle verticale
  bool _isMirrored = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 2, slider, changer image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform(
              transform: Matrix4.identity()
                ..rotateZ(_rotationValue)
                ..scale(_isMirrored ? -_scaleValueX : _scaleValueX, _scaleValueY),
              alignment: FractionalOffset.center,
              child: Image.asset(
                'images/example_image.jpg',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            Slider(
              value: _rotationValue,
              min: 0,
              max: 2 * 3.1416, // 2 * pi
              onChanged: (value) {
                setState(() {
                  _rotationValue = value;
                });
              },
            ),
            Text('Rotation: ${(_rotationValue * 180 / 3.1416).toStringAsFixed(2)}°'),
            const SizedBox(height: 20),
            Slider(
              value: _scaleValueX,
              min: 0.5,
              max: 2.0,
              onChanged: (value) {
                setState(() {
                  _scaleValueX = value;
                });
              },
            ),
            Text('Échelle horizontale: ${_scaleValueX.toStringAsFixed(2)}'),
            const SizedBox(height: 20),
            Slider(
              value: _scaleValueY,
              min: 0.5,
              max: 2.0,
              onChanged: (value) {
                setState(() {
                  _scaleValueY = value;
                });
              },
            ),
            Text('Échelle verticale: ${_scaleValueY.toStringAsFixed(2)}'),
            const SizedBox(height: 20),
            CheckboxListTile(
              title: const Text('Effet miroir'),
              value: _isMirrored,
              onChanged: (value) {
                setState(() {
                  _isMirrored = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}