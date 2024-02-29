import 'package:flutter/material.dart';
import 'package:tp2/jeu/anotherpage.dart'; // 导入第一个页面
import 'package:tp2/jeu/Exercise7Page.dart'; //导入第二个页面


class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // 设置主页为自定义的HomePage
      routes: {
        '/first': (context) => AnotherPage(), // 设置第一个页面的路由
        '/second': (context) => Exercice7Page(), // 设置第二个页面的路由
      },
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JEU TAQUIN'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/example_image.jpg', // 替换为你的图片路径
              width: 200, // 图片宽度
              height: 200, // 图片高度
              fit: BoxFit.contain, // 图片适应方式
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/first'); // 导航到第一个页面
              },
              child: Text('hard mode'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second'); // 导航到第二个页面
              },
              child: Text('easy mode'),
            ),
          ],
        ),
      ),
    );
  }
}