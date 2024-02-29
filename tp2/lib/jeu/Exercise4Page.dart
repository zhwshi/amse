import 'package:flutter/material.dart';
import 'package:tp2/main.dart';

class Exercice4Page extends StatelessWidget {
  const Exercice4Page({super.key});

  @override
  Widget build(BuildContext context) {
    Tile tile = Tile(imageURL: 'assets/images/example_image.jpg', alignment: const Alignment(-1, -1));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 4, capture écran du coin supérieur gauche de image et affichez-la'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150.0,
              height: 150.0,
              child: Container(
                margin: const EdgeInsets.all(20.0),
                child: createTileWidgetFrom(tile),
              ),
            ),
            SizedBox(
              height: 200,
              child: Image.network(
                tile.imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(),
      onTap: () {
        // Action à effectuer lors du tap sur la tuile
      },
    );
  }
}
