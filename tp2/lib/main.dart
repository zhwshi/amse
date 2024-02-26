// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'dart:math' as math;

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

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Exercice 1'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Exercice1Page()),
              );
            },
          ),
          ListTile(
            title: const Text('Exercice 2'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Exercice2Page()),
              );
            },
          ),
          ListTile(
            title: const Text('Exercice 2b'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Exercice2bPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Exercice 4'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Exercice4Page()),
              );
            },
          ),
          ListTile(
            title: const Text('Exercice 5'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Exercice5Page()),
              );
            },
          ),
          ListTile(
            title: const Text('Exercice 6'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Exercice6Page()),
              );
            },
          ),
          ListTile(
            title: const Text('Exercice 7'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Exercice7Page()),
              );
            },
          ),
        ],
      ),
    );
  }
}


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
        title: const Text('Exercice 2'),
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

class Exercice1Page extends StatelessWidget {
  const Exercice1Page({super.key});

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
        title: const Text('Exercice 2'),
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

class Exercice6Page extends StatefulWidget {
  const Exercice6Page({Key? key}) : super(key: key);

  @override
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
        title: const Text('Exercice 6,click and move'),
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
                color: Colors.blue,
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
        title: const Text('Exercice 5'),
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

class Exercice4Page extends StatelessWidget {
  const Exercice4Page({super.key});

  @override
  Widget build(BuildContext context) {
    Tile tile = Tile(imageURL: 'assets/images/example_image.jpg', alignment: const Alignment(-1, -1));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 4'),
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
