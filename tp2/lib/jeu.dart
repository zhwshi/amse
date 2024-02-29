import 'package:flutter/material.dart';
import 'package:tp2/jeu/Exercise1Page.dart';
import 'package:tp2/jeu/Exercise2Page.dart';
import 'package:tp2/jeu/Exercise2bPage.dart';
import 'package:tp2/jeu/Exercise4Page.dart';
import 'package:tp2/jeu/Exercise5Page.dart';
import 'package:tp2/jeu/Exercise6Page.dart';
import 'package:tp2/jeu/Exercise6bPage.dart';
import 'package:tp2/jeu/homepage.dart';



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
          _buildListTile(
            context,
            title: 'Exercice 1',
            icon: Icons.fitness_center,
            page: const Exercice1Page(),
          ),
          _buildListTile(
            context,
            title: 'Exercice 2',
            icon: Icons.fitness_center,
            page: const Exercice2Page(),
          ),
          _buildListTile(
            context,
            title: 'Exercice 2b',
            icon: Icons.fitness_center,
            page: const Exercice2bPage(),
          ),
          _buildListTile(
            context,
            title: 'Exercice 4',
            icon: Icons.fitness_center,
            page: const Exercice4Page(),
          ),
          _buildListTile(
            context,
            title: 'Exercice 5',
            icon: Icons.fitness_center,
            page: const Exercice5Page(),
          ),
          _buildListTile(
            context,
            title: 'Exercice 6',
            icon: Icons.directions_run,
            page: const Exercice6Page(),
          ),
          _buildListTile(
            context,
            title: 'Exercice 6_color',
            icon: Icons.directions_run,
            page: const Exercice6bPage(),
          ),
          _buildListTile(
            context,
            title: 'Exercice 7',
            icon: Icons.directions_bike,
            page: home(),
          ),
        ],
      ),
    );
  }

  ListTile _buildListTile(BuildContext context,
      {required String title, required IconData icon, required Widget page}) {
    return ListTile(
      title: Row(
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 10),
          Text(title),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}