import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MediaModel {
  final String name;
  final String autor;
  final String date;
  final String description;
  final String imgUrl;

  const MediaModel(
    {required this.name, required this.autor, required this.date, required this.description,required this.imgUrl}
  );
}

const film = [
  MediaModel(
    name: 'Inception',
    autor: 'Christopher Nolan',
    date: '2010',
    description:
        'Inception is a 2010 science fiction action film written and directed by Christopher Nolan.',
    imgUrl: 'assets/imgs/inception.jpg',
  ),
  MediaModel(
    name: 'The Shawshank Redemption',
    autor: 'Frank Darabont',
    date: '1994',
    description:
        'The Shawshank Redemption is a 1994 American drama film written and directed by Frank Darabont.',
    imgUrl: 'assets/imgs/shawshank_redemption.jpg',
  ),
  MediaModel(
    name: 'The Godfather',
    autor: 'Francis Ford Coppola',
    date: '1972',
    description:
        'The Godfather is a 1972 American crime film directed by Francis Ford Coppola.',
    imgUrl: 'assets/imgs/godfather.jpg',
  ),
  MediaModel(
    name: 'Pulp Fiction',
    autor: 'Quentin Tarantino',
    date: '1994',
    description:
        'Pulp Fiction is a 1994 American neo-noir black comedy crime film written and directed by Quentin Tarantino.',
    imgUrl: 'assets/imgs/pulp_fiction.jpg',
  ),
];

const series = [
  MediaModel(
    name: 'Breaking Bad',
    autor: 'Vince Gilligan',
    date: '2008-2013',
    description:
        'Breaking Bad is an American neo-Western crime drama television series created and produced by Vince Gilligan.',
    imgUrl: 'assets/imgs/breaking_bad.jpg',
  ),
  MediaModel(
    name: 'Game of Thrones',
    autor: 'David Benioff, D. B. Weiss',
    date: '2011-2019',
    description:
        'Game of Thrones is an American fantasy drama television series created by David Benioff and D. B. Weiss.',
    imgUrl: 'assets/imgs/game_of_thrones.jpg',
  ),
  MediaModel(
    name: 'Stranger Things',
    autor: 'The Duffer Brothers',
    date: '2016-present',
    description:
        'Stranger Things is an American science fiction horror mystery-thriller streaming television series created by the Duffer Brothers.',
    imgUrl: 'assets/imgs/stranger_things.jpg',
  ),
  MediaModel(
    name: 'Friends',
    autor: 'David Crane, Marta Kauffman',
    date: '1994-2004',
    description:
        'Friends is an American television sitcom created by David Crane and Marta Kauffman.',
    imgUrl: 'assets/imgs/friends.jpg',
  ),
];

const musique = [
  MediaModel(
    name: 'Thriller',
    autor: 'Michael Jackson',
    date: '1982',
    description:
        'Thriller is the sixth studio album by American singer Michael Jackson, released on November 30, 1982.',
    imgUrl: 'assets/imgs/thriller.jpg',
  ),
  MediaModel(
    name: 'Abbey Road',
    autor: 'The Beatles',
    date: '1969',
    description:
        'Abbey Road is the eleventh studio album by the English rock band the Beatles, released on 26 September 1969.',
    imgUrl: 'assets/imgs/abbey_road.jpg',
  ),
  MediaModel(
    name: 'The Dark Side of the Moon',
    autor: 'Pink Floyd',
    date: '1973',
    description:
        'The Dark Side of the Moon is the eighth studio album by the English rock band Pink Floyd.',
    imgUrl: 'assets/imgs/dark_side_of_the_moon.jpg',
  ),
  MediaModel(
    name: 'Back in Black',
    autor: 'AC/DC',
    date: '1980',
    description:
        'Back in Black is the seventh studio album by Australian rock band AC/DC.',
    imgUrl: 'assets/imgs/back_in_black.jpg',
  ),
];

const livre = [
  MediaModel(
    name: '1984',
    autor: 'George Orwell',
    date: '1949',
    description:
        '1984 is a dystopian social science fiction novel by English novelist George Orwell.',
    imgUrl: 'assets/imgs/1984.jpg',
  ),
  MediaModel(
    name: 'To Kill a Mockingbird',
    autor: 'Harper Lee',
    date: '1960',
    description:
        'To Kill a Mockingbird is a novel by Harper Lee published in 1960.',
    imgUrl: 'assets/imgs/to_kill_a_mockingbird.jpg',
  ),
  MediaModel(
    name: 'The Great Gatsby',
    autor: 'F. Scott Fitzgerald',
    date: '1925',
    description:
        'The Great Gatsby is a 1925 novel by American writer F. Scott Fitzgerald.',
    imgUrl: 'assets/imgs/great_gatsby.jpg',
  ),
  MediaModel(
    name: 'The Catcher in the Rye',
    autor: 'J. D. Salinger',
    date: '1951',
    description:
        'The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951.',
    imgUrl: 'assets/imgs/catcher_in_the_rye.jpg',
  ),
];


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: Scaffold(
          bottomNavigationBar: const MyBottomNavigationBar(),
        ),
      ),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = PresentationPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      case 2 :
        page = MediaPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      body: page,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Media',
          ),
        ],
      ),
    );
  }
}


class MyAppState extends ChangeNotifier {

  final List<MediaModel> favorites = [];

  void addFavorite(current) {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class PresentationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bienvenue !',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Cette application vous permet de découvrir et de gérer vos médias préférés.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Image.network(
            'assets/imgs/med.jpg' // Ajoutez l'image de présentation
          ),
          SizedBox(height: 16),
          ParcourirButton(),
        ],
      ),
    );
  }
}

class ParcourirButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MediaPage(),
          ),
        );
      },
      child: Text('Parcourir'),
    );
  }
}


class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: ListView(
        children: [
          for (var i=0; i<appState.favorites.length; i++)
            MediaListButton(appState.favorites,i),
        ],
      ),
    );
  }
}

class MediaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          MediaButton('Films',film),
          SizedBox(height: 16),
          MediaButton('Series',series),
          SizedBox(height: 16),
          MediaButton('Musique', musique),
          SizedBox(height: 16),
          MediaButton('Livre', livre),
        ],
        
      ),
    );
  }
}

class MediaButton extends StatelessWidget {
  final String media;
  final List<MediaModel> mediaList;

  MediaButton(this.media, this.mediaList);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MediaList(media,mediaList),
          ),
        );
      },
      child: Text(media),
    );
  }
}


class MediaList extends StatelessWidget {
  final String mediatype;
  final List<MediaModel> mediaList;

  MediaList(this.mediatype, this.mediaList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mediatype),
      ),
      body: ListView(
        children: [
          for (var i = 0; i < mediaList.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0), // Adjust vertical spacing here
              child: MediaListButton(mediaList, i),
            ),
        ],
      ),
    );
  }
}

class MediaListButton extends StatelessWidget {
  final List<MediaModel> mediaList;
  final int indice;

  MediaListButton(this.mediaList, this.indice);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MediaDescriptionPage(mediaList, indice),
          ),
        );
      },
      child: Text(mediaList[indice].name),
    );
  }
}


class MediaDescriptionPage extends StatelessWidget {
  final List<MediaModel> mediaList;
  final int indice;

  MediaDescriptionPage(this.mediaList, this.indice);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    IconData icon;
    if (appState.favorites.contains(mediaList[indice])) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(mediaList[indice].name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Affichez l'image à partir du fichier
            //Image.network(film.elementAt(indice).imgUrl),
            Text('Date : ${mediaList[indice].date}'),
            SizedBox(height: 16),
            Text('Auteur : ${mediaList[indice].autor}'),
            SizedBox(height: 16),
            Text('Description : ${mediaList[indice].description}'),
            SizedBox(height: 16),
            ElevatedButton.icon(
                onPressed: () {
                  appState.addFavorite(mediaList[indice]);
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
          ],
        ),
      ),
    );
  }
}