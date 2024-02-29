// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:tp2/jeu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MenuPage(),
    );
  }
}




//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Exercice 6'),
//       ),
//       body: SizedBox(
//         width: 500,
//         height: 500,
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             mainAxisSpacing: 10.0,
//             crossAxisSpacing: 10.0,
//             childAspectRatio: 1.0,
//           ),
//           itemCount: tiles.length,
//           itemBuilder: (BuildContext context, int index) {
//             return InkWell(
//               onTap: () => swapTiles(index),
//               child: TileWidget(tiles[index]),
//             );
//           },
//         ),
//       ),
//     );
//   }

  
// }





// ignore: camel_case_types
class Tile_complet {
  String imageURL;

  Tile_complet({required this.imageURL});

  Widget croppedImageTile() {
    return Image.asset(imageURL);
  }

  static void randomColor() {}
}





class Tile {
  String imageURL;
  Alignment alignment;

  Tile({required this.imageURL, required this.alignment});
  
  get position => null;
  
  get color => null;

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Align(
          alignment: alignment,
          widthFactor: 0.3,
          heightFactor: 0.3,
          child: Image.asset(imageURL),
        ),
      ),
    );
  }
  
  static void randomColor(Alignment alignment) {}
}
// Ajoutez d'autres classes de page pour les autres exercices si nécessaire

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class ImageTile {
  int id;
  String? imageUrl;
  double? factor;
  Alignment? alignment;
  bool empty;

  ImageTile({
    required this.id,
    this.imageUrl,
    this.factor,
    this.alignment,
    required this.empty,
  });

  Widget croppedImageTile() {
    if (!empty) {
      return FittedBox(
        fit: BoxFit.fill,
        child: ClipRect(
          child: Align(
            alignment: alignment!,
            widthFactor: factor,
            heightFactor: factor,
            child: Image.asset(imageUrl!),
          ),
        ),
      );
    } else {
      return FittedBox(
        fit: BoxFit.fill,
        child: Container(color: Colors.white),
      );
    }
  }
}
class ImageTilePlus {
  List<ImageTile> _tilesList = [];
  int _nbColumns = 3;
  String _imageUrl = 'images/exo4.jpg';

  ImageTilePlus() {
    _splitImageIntoTiles();
  }

  List<ImageTile> getTilesList() {
    return _tilesList;
  }

  void setTilesList(List<ImageTile> list) {
    _tilesList = list;
  }

  int getNbColumns() {
    return _nbColumns;
  }

  void setNbColumns(int nbOfColumns) {
    _nbColumns = nbOfColumns;
    _splitImageIntoTiles();
  }

  String getImageUrl() {
    return _imageUrl;
  }

  void setImageUrl(String newImageUrl) {
    _imageUrl = newImageUrl;
    _splitImageIntoTiles();
  }

  List<double> _computeIndexes() {
    List<double> result = [];
    double temp = 0;

    for (int i = 0; i < _nbColumns; i++) {
      temp = ((2 * i) / (_nbColumns - 1)) - 1;
      result.add(temp);
    }
    return result;
  }

  void _splitImageIntoTiles() {
    List<double> indexes = _computeIndexes();
    _tilesList = [];
    int id = 0;

    for (var y in indexes) {
      for (var x in indexes) {
        _tilesList.add(
          ImageTile(
            id: id,
            factor: 1 / _nbColumns,
            alignment: Alignment(x, y),
            imageUrl: _imageUrl,
            empty: false,
          ),
        );
        id++;
      }
    }
  }
}