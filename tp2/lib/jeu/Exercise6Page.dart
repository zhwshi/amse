import 'package:flutter/material.dart';
import 'package:tp2/main.dart';


class Exercice6Page extends StatefulWidget {
  const Exercice6Page({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Exercice6PageState createState() => _Exercice6PageState();
}

class _Exercice6PageState extends State<Exercice6Page> {
  List<Tile> tiles = [
    Tile(imageURL: 'assets/images/example_image.jpg', alignment: const Alignment(-1, -1)),
    Tile(imageURL: 'assets/images/example_image.jpg', alignment: const Alignment(0, -1)),
    Tile(imageURL: 'assets/images/example_image.jpg', alignment: const Alignment(1, -1)),
    Tile(imageURL: 'assets/images/example_image.jpg', alignment: const Alignment(-1, 0)),
    Tile(imageURL: 'assets/images/example_image.jpg', alignment: const Alignment(0, 0)),
    Tile(imageURL: 'assets/images/example_image.jpg', alignment: const Alignment(1, 0)),
    Tile(imageURL: 'assets/images/example_image.jpg', alignment: const Alignment(-1, 1)),
    Tile(imageURL: 'assets/images/example_image.jpg', alignment: const Alignment(0, 1)),
    Tile(imageURL: 'assets/images/example_image.jpg', alignment: const Alignment(1, 1)),
  ];

  void swapTiles(int index) {
    if (index == 0){
      final temp = tiles[0];
      setState(() {
        tiles[0] = tiles[8];
        tiles[8] = temp;
      });
    }
    if (index > 0 && index < tiles.length) {
      final temp = tiles[index];
      setState(() {
        tiles[index] = tiles[index - 1];
        tiles[index - 1] = temp;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('exo6,change with the left ones'),
      ),
      body: SizedBox(
        width: 500,
        height: 500,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
          itemCount: tiles.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                swapTiles(index);
              },
              child: Container(
                color: Color.fromARGB(255, 255, 0, 17),
                child: Center(
                  child: tiles[index].croppedImageTile(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
