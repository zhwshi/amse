import 'package:flutter/material.dart';
import 'dart:math';

// ==============
// Models
// ==============

class Tile {
  late Color color;
  late String label;

  Tile(this.color, this.label);
  Tile.randomColor() {
    color = Color((Random().nextDouble() * 0xFFFFFF).toInt())
      .withOpacity(1.0);
  }
  Tile.setLabel(this.label);
}

// ==============
// Widgets
// ==============

class TileWidget extends StatelessWidget {
  final Tile tile;
  const TileWidget({super.key, required this.tile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(70.0),
      color: tile.color,
      child: Text(tile.label),
    );
  }
}

class Exercice6bPage extends StatefulWidget {
  const Exercice6bPage({super.key});

  @override
  State<Exercice6bPage> createState() => _Exercice7ScreenState();
}

class _Exercice7ScreenState extends State<Exercice6bPage> {
  List<Widget> tiles = List<Widget>.generate(
      2, (index) => TileWidget(tile: Tile(Color((Random().nextDouble() * 0xFFFFFF).toInt())
      .withOpacity(1.0), index.toString())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 119, 0),
        title: const Text("copy code"),
      ),
      body: Row(children: tiles),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        child: const Icon(Icons.sentiment_very_satisfied),
      ),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}