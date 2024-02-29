import 'package:flutter/material.dart';
import 'package:tp2/jeu/Exercise1Page.dart';
import 'package:tp2/jeu/Exercise2Page.dart';
import 'package:tp2/jeu/Exercise2bPage.dart';
import 'package:tp2/jeu/Exercise4Page.dart';
import 'package:tp2/jeu/Exercise5Page.dart';
import 'package:tp2/jeu/Exercise6Page.dart';
import 'package:tp2/jeu/Exercise7Page.dart';




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