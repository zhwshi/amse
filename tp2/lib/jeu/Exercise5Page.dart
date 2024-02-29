import 'package:flutter/material.dart';

class Exercice5Page extends StatefulWidget {
  const Exercice5Page({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Exercice5PageState createState() => _Exercice5PageState();
}

class _Exercice5PageState extends State<Exercice5Page> {
  // ignore: prefer_final_fields
  int _crossAxisCount = 3; // Nombre initial de divisions
  final String imageURL = 'assets/images/example_image.jpg'; // URL de l'image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 5,De 3 fois 3 à 25 fois 25'),
      ),
      body: Column(
        children: [
          Slider(
            value: _crossAxisCount.toDouble(),
            min: 3,
            max: 25,
            divisions: 22, // Nombre de divisions du curseur
            label: _crossAxisCount.round().toString(),
            onChanged: (value) {
              setState(() {
                _crossAxisCount = value.toInt();
                //print(_crossAxisCount.toString());
              });
            },
          ),
          Expanded(
            child:GridView.count(
  primary: false,
  padding: const EdgeInsets.all(10),
  crossAxisSpacing: 2.0,
  mainAxisSpacing: 2.0,
  crossAxisCount: _crossAxisCount,
  children: generateAllTiles(_crossAxisCount),
)
          ),
        ],
      ),
    );
  }

  List<Widget> generateAllTiles(int size) {
    return List<Widget>.generate(size*size, (index) => createTileWidget(index));
  }

  Widget createTileWidget(int index) {
    final double xOffset = (index % _crossAxisCount) / (_crossAxisCount - 1);
    final double yOffset = (index ~/ _crossAxisCount) / (_crossAxisCount - 1);
    final double xAlignment = (xOffset * 2 - 1).clamp(-1.0, 1.0);
    final double yAlignment = (yOffset * 2 - 1).clamp(-1.0, 1.0);

    return InkWell(
      child: Container(
        color: Colors.blue, // Couleur de fond de chaque conteneur
        child: Center(
          child: FittedBox(
            fit: BoxFit.fill,
            child: ClipRect(
              child: Align(
              alignment: Alignment(xAlignment, yAlignment),
              widthFactor: 1/ _crossAxisCount ,
              heightFactor: 1 / _crossAxisCount ,
              child: Image.asset(imageURL,fit: BoxFit.fill),
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        print("tap");
        // Action à effectuer lorsque la tuile est tapée
      },
    );
  }
}