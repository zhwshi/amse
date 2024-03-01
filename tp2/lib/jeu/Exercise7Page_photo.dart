import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tp2/jeu/homepage.dart';
import 'package:tp2/main.dart';
import 'package:tp2/jeu/anotherpage.dart';
import 'package:tp2/jeu/Exercise7Page.dart';

class Exercice7Page_photo extends StatefulWidget {
  const Exercice7Page_photo({Key? key}) : super(key: key);

  @override
  _Exercice7PageState createState() => _Exercice7PageState();
}

class _Exercice7PageState extends State<Exercice7Page_photo> {
  late List<Tile?> tile_1;
  late int emptyIndex;
  int _stepCount = 50;
  List<List<Tile?>> previousStates = [];

  @override
  void initState() {
    super.initState();
    resetPuzzle(); // 初始化拼图
  }

  // 初始化拼图
  void resetPuzzle() {
    setState(() {
       tile_1 = [
      Tile(imageURL: 'assets/images/example_image.jpg', alignment: const Alignment(-1, -1)),
      Tile(imageURL: 'assets/images/example_image.jpg', alignment: const Alignment(0, -1)),
      Tile(imageURL: 'assets/images/example_image.jpg', alignment: const Alignment(1, -1)),
      Tile(imageURL: 'assets/images/example_image.jpg', alignment: const Alignment(-1, 0)),
      Tile(imageURL: 'assets/images/example_image.jpg', alignment: const Alignment(0, 0)),
      Tile(imageURL: 'assets/images/example_image.jpg', alignment: const Alignment(1, 0)),
      Tile(imageURL: 'assets/images/example_image.jpg', alignment: const Alignment(-1, 1)),
      Tile(imageURL: 'assets/images/example_image.jpg', alignment: const Alignment(0, 1)),
      Tile(imageURL: 'assets/images/b.png', alignment: const Alignment(0, 0)),
];
      emptyIndex = 8; // 空白拼图块的索引
      _stepCount = 50;
      previousStates.clear(); // 清除之前的状态

      // 打乱拼图
      shufflePuzzle();
    });
  }

  // 打乱拼图
  void shufflePuzzle() {
    final random = Random();
    for (int i = 0; i < 100; i++) {
      final randomIndex = random.nextInt(tile_1.length - 1);
      if (_isAdjacentToEmpty(randomIndex)) {
        final temp = tile_1[randomIndex];
        tile_1[randomIndex] = tile_1[emptyIndex];
        tile_1[emptyIndex] = temp;
        emptyIndex = randomIndex;
      }
    }
  }

  void swapTiles(int index) {
    if (_isAdjacentToEmpty(index)) {
      setState(() {
        previousStates.add(List<Tile?>.from(tile_1)); // 将当前状态添加到历史状态列表
        final temp = tile_1[index];
        tile_1[index] = tile_1[emptyIndex];
        tile_1[emptyIndex] = temp;
        emptyIndex = index; // 更新空白拼图块的索引
        _stepCount--;
        if (_stepCount <= 0) {
          _showFailureDialog(); // 当步数为零或负数时触发失败对话框
        }
      });
      if (_isPuzzleCompleted()) {
        _showSuccessDialog();
      }
    }
  }

  void undoLastMove() {
    if (previousStates.isNotEmpty) {
      setState(() {
        tile_1 = previousStates.removeLast(); // 恢复到上一个状态
        emptyIndex = tile_1.indexWhere((tile) => tile == null); // 更新空白拼图块的索引
        _stepCount++; // 恢复步数
      });
    }
  }

  // ...其余代码保持不变

  
  void _showFailureDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over!'),
          content: const Text('You ran out of steps. Better luck next time!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Exercice7Page_photo()));
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  bool _isAdjacentToEmpty(int index) {
    return (index ~/ 3 == emptyIndex ~/ 3 && (index - emptyIndex).abs() == 1) ||
        (index % 3 == emptyIndex % 3 && (index - emptyIndex).abs() == 3);
  }

  bool _isPuzzleCompleted() {
    for (int i = 0; i < tile_1.length - 1; i++) {
      if (tile_1[i] == null || tile_1[i]!.imageURL != 'assets/images/${i + 1}.png') {
        return false;
      }
    }
    return true;
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Congratulations!'),
          content: const Text('You solved the puzzle! tap reset to do a new one!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToAnotherPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AnotherPage()));
  }

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jeu de taquin - Steps Remaining: $_stepCount'),
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
          itemCount: tile_1.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                swapTiles(index);
              },
              child: Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Center(
                  child: tile_1[index] != null
                      ? tile_1[index]!.croppedImageTile()
                      : Container(), // 空白拼图块不显示图像
                ),
              ),
            );
          },
        ),
      ),
      
      floatingActionButton: Column(
  mainAxisAlignment: MainAxisAlignment.end,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    FloatingActionButton(
      onPressed: () {
        resetPuzzle(); // 重置拼图
      },
      child: const Tooltip(
        message: 'reset!',
        child: Icon(Icons.shuffle),
      ),
    ),
    const SizedBox(height: 16),
    FloatingActionButton(
      onPressed: _navigateToAnotherPage,
      child: const Tooltip(
        message: 'difficult mode',
        child: Icon(Icons.arrow_forward),
      ),
    ),
    const SizedBox(height: 16),
    FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => home()));
      },
      child: const Tooltip(
        message: 'Go to Puzzle Page',
        child: Icon(Icons.games),
      ),
    ),
    const SizedBox(height: 16),
    FloatingActionButton(
      onPressed: undoLastMove, // 调用取消上一次操作的方法
      child: const Tooltip(
        message: 'Undo last move',
        child: Icon(Icons.undo),
      ),
    ),
    const SizedBox(height: 16),
    FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Exercice7Page())); // 导航到另一个页面
      },
      child: const Tooltip(
        message: 'Go to number Page',
        child: Icon(Icons.numbers),
      ),
    ),
  ],
),

    );
  }
}
