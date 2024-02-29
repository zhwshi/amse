import 'package:flutter/material.dart';

class Exercice2bPage extends StatefulWidget {
  const Exercice2bPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Exercice2bPageState createState() => _Exercice2bPageState();
}

class _Exercice2bPageState extends State<Exercice2bPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleXAnimation;
  late Animation<double> _scaleYAnimation;

  final bool _isMirrored = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _rotationAnimation =
        Tween<double>(begin: 0.0, end: 2 * 3.1416).animate(_controller);

    _scaleXAnimation = Tween<double>(begin: 0.5, end: 2.0).animate(_controller);

    _scaleYAnimation = Tween<double>(begin: 0.5, end: 2.0).animate(_controller);

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 2b, Présentations automatisées'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.identity()
                ..rotateZ(_rotationAnimation.value)
                ..scale(_isMirrored ? -_scaleXAnimation.value : _scaleXAnimation.value, _scaleYAnimation.value),
              alignment: FractionalOffset.center,
              child: Image.asset(
                'images/example_image.jpg',
                width: 200,
                height: 200,
              ),
            );
          },
        ),
      ),
    );
  }
}

