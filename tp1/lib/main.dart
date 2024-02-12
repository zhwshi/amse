import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MediaModel {
  final String name;
  final String autor;
  final String type;
  final int order; 
  final String description;
  final String imgUrl;

  const MediaModel(
    {required this.order, required this.name, required this.autor, required this.type, required this.description,required this.imgUrl}
  );
}



const List<MediaModel> film = [
  MediaModel(
    order: 1,
    name: 'Inception',
    autor: 'Christopher Nolan',
    type: 'film',
    description:
        'Inception is a 2010 science fiction action film written and directed by Christopher Nolan.',
    imgUrl: 'assets/imgs/godfather.png',
  ),
  MediaModel(
    order: 2,
    name: 'The Shawshank Redemption',
    autor: 'Frank Darabont',
    type: 'film',
    description:
        'The Shawshank Redemption is a 1994 American drama film written and directed by Frank Darabont.',
    imgUrl: 'assets/imgs/godfather.png',
  ),
  MediaModel(
    order: 3,
    name: 'The Godfather',
    autor: 'Francis Ford Coppola',
    type: 'film',
    description:
        'The Godfather is a 1972 American crime film directed by Francis Ford Coppola.',
    imgUrl: 'assets/imgs/godfather.png',
  ),
  MediaModel(
    order: 4,
    name: 'The Lord of the Rings: The Return of the King',
    autor: 'Peter Jackson',
    type: 'film',
    description:
        'The Lord of the Rings: The Return of the King is a 2003 epic fantasy adventure film directed by Peter Jackson.',
    imgUrl: 'assets/imgs/godfather.png',
  ),
];

const List<MediaModel> series = [
  MediaModel(
    order: 1,
    name: 'Breaking Bad',
    autor: 'Vince Gilligan',
    type: 'series',
    description:
        'Breaking Bad is an American neo-Western crime drama television series created and produced by Vince Gilligan.',
    imgUrl: 'assets/imgs/godfather.png',
  ),
  MediaModel(
    order: 2,
    name: 'Game of Thrones',
    autor: 'David Benioff, D. B. Weiss',
    type: 'series',
    description:
        'Game of Thrones is an American fantasy drama television series created by David Benioff and D. B. Weiss.',
    imgUrl: 'assets/imgs/godfather.png',
  ),
  MediaModel(
    order: 3,
    name: 'Friends',
    autor: 'David Crane, Marta Kauffman',
    type: 'series',
    description:
        'Friends is an American television sitcom created by David Crane and Marta Kauffman.',
    imgUrl: 'assets/imgs/godfather.png',
  ),
  MediaModel(
    order: 4,
    name: 'Breaking Bad',
    autor: 'Vince Gilligan',
    type: 'series',
    description:
        'Breaking Bad is an American neo-Western crime drama television series created and produced by Vince Gilligan.',
    imgUrl: 'assets/imgs/godfather.png',
  ),
];

const List<MediaModel> musique = [
  MediaModel(
    order: 1,
    name: 'Thriller',
    autor: 'Michael Jackson',
    type: 'musique',
    description:
        'Thriller is the sixth studio album by American singer Michael Jackson, released on November 30, 1982.',
    imgUrl: 'assets/imgs/godfather.png',
  ),
  MediaModel(
    order: 2,
    name: 'Abbey Road',
    autor: 'The Beatles',
    type: 'musique',
    description:
        'Abbey Road is the eleventh studio album by the English rock band the Beatles, released on 26 September 1969.',
    imgUrl: 'assets/imgs/godfather.png',
  ),
  MediaModel(
    order: 3,
    name: 'Back in Black',
    autor: 'AC/DC',
    type: 'musique',
    description:
        'Back in Black is the seventh studio album by Australian rock band AC/DC.',
    imgUrl: 'assets/imgs/godfather.png',
  ),
  MediaModel(
    order: 4,
    name: 'Thriller',
    autor: 'Michael Jackson',
    type: 'musique',
    description:
        'Thriller is the sixth studio album by American singer Michael Jackson, released on November 30, 1982.',
    imgUrl: 'assets/imgs/godfather.png',
  ),
];

const List<MediaModel> livre = [
  MediaModel(
    order: 1,
    name: '1984',
    autor: 'George Orwell',
    type: 'livre',
    description:
        '1984 is a dystopian social science fiction novel by English novelist George Orwell.',
    imgUrl: 'assets/imgs/godfather.png',
  ),
  MediaModel(
    order: 2,
    name: 'To Kill a Mockingbird',
    autor: 'Harper Lee',
    type: 'livre',
    description:
        'To Kill a Mockingbird is a novel by Harper Lee published in 1960.',
    imgUrl: 'assets/imgs/godfather.png',
  ),
  MediaModel(
    order: 3,
    name: 'The Great Gatsby',
    autor: 'F. Scott Fitzgerald',
    type: 'livre',
    description:
        'The Great Gatsby is a 1925 novel by American writer F. Scott Fitzgerald.',
    imgUrl: 'assets/imgs/godfather.png',
  ),
  MediaModel(
    order : 4,
    name: 'The Catcher in the Rye',
    autor: 'J. D. Salinger',
    type: 'livre',
    description:
        'The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951.',
    imgUrl: 'assets/imgs/godfather.png',
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

  final List<MediaModel> favoritesfilms = [];
  final List<MediaModel> favoritesseries = [];
  final List<MediaModel> favoritesmusique = [];
  final List<MediaModel> favoriteslivre = [];
  void addFavoritefilm(current) {
    if (favoritesfilms.contains(current)) {
      favoritesfilms.remove(current);
    } else {
      favoritesfilms.add(current);
    }
    notifyListeners();
  }
  void addFavoriteseries(current){
    if (favoritesseries.contains(current)) {
      favoritesseries.remove(current);
    } else {
      favoritesseries.add(current);
    }
    notifyListeners();
  }
  void addFavoritemusique(current){
    if (favoritesmusique.contains(current)) {
      favoritesmusique.remove(current);
    } else {
      favoritesmusique.add(current);
    }
    notifyListeners();
  }
  void addFavoritelivre(current){
    if (favoriteslivre.contains(current)) {
      favoriteslivre.remove(current);
    } else {
      favoriteslivre.add(current);
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
         
        ],
      ),
    );
  }
}


class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favoritesfilms.isEmpty && appState.favoritesseries.isEmpty
    && appState.favoritesmusique.isEmpty && appState.favoriteslivre.isEmpty) {
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
          
          for (var i=0; i<appState.favoritesfilms.length; i++)
            MediaListFavButton(film,appState.favoritesfilms[i].order -1),
          for (var i=0; i<appState.favoritesseries.length; i++)
            MediaListFavButton(series,appState.favoritesseries[i].order -1),
          for (var i=0; i<appState.favoritesmusique.length; i++)
            MediaListFavButton(musique,appState.favoritesmusique[i].order -1),
          for (var i=0; i<appState.favoriteslivre.length; i++)
            MediaListFavButton(livre,appState.favoriteslivre[i].order -1),
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
    if (mediaList == film){
      if (appState.favoritesfilms.contains(mediaList[indice])) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    } 
    else if (mediaList == series){
      if (appState.favoritesseries.contains(mediaList[indice])) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    }
    else if (mediaList == musique){
      if (appState.favoritesmusique.contains(mediaList[indice])) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    }
    else{
      if (appState.favoriteslivre.contains(mediaList[indice])) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
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
            Image.network(film.elementAt(indice).imgUrl),
            Text('Type : ${mediaList[indice].type}'),
            SizedBox(height: 16),
            Text('Auteur : ${mediaList[indice].autor}'),
            SizedBox(height: 16),
            Text('Description : ${mediaList[indice].description}'),
            SizedBox(height: 16),
            ElevatedButton.icon(
                onPressed: () {
                  if (mediaList == film){
                  appState.addFavoritefilm(mediaList[indice]);}
                  else if (mediaList == series){
                  appState.addFavoriteseries(mediaList[indice]);}
                  else if (mediaList == musique){
                  appState.addFavoritemusique(mediaList[indice]);}
                  else if (mediaList == livre){
                  appState.addFavoritelivre(mediaList[indice]);}
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

class MediaListFavButton extends StatelessWidget {
  final List<MediaModel> mediaListFav;
  final int indiceFav;

  MediaListFavButton(this.mediaListFav, this.indiceFav);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MediaDescriptionFavPage(mediaListFav, indiceFav),
          ),
        );
      },
      child: Text(mediaListFav[indiceFav].name),
    );
  }
}

class MediaDescriptionFavPage extends StatelessWidget {
  final List<MediaModel> mediaListFav;
  final int indiceFav;

  MediaDescriptionFavPage(this.mediaListFav, this.indiceFav);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    IconData icon;
    if (mediaListFav == film){
      if (appState.favoritesfilms.contains(mediaListFav[indiceFav])) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    } 
    else if (mediaListFav == series){
      if (appState.favoritesseries.contains(mediaListFav[indiceFav])) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    }
    else if (mediaListFav == musique){
      if (appState.favoritesmusique.contains(mediaListFav[indiceFav])) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    }
    else{
      if (appState.favoriteslivre.contains(mediaListFav[indiceFav])) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(mediaListFav[indiceFav].name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Affichez l'image à partir du fichier
            Image.network(film.elementAt(indiceFav).imgUrl),
            Text('Type : ${mediaListFav[indiceFav].type}'),
            SizedBox(height: 16),
            Text('Auteur : ${mediaListFav[indiceFav].autor}'),
            SizedBox(height: 16),
            Text('Description : ${mediaListFav[indiceFav].description}'),
            SizedBox(height: 16),
            ElevatedButton.icon(
                onPressed: () {
                  if (mediaListFav == film){
                  appState.addFavoritefilm(mediaListFav[indiceFav]);}
                  else if (mediaListFav == series){
                  appState.addFavoriteseries(mediaListFav[indiceFav]);}
                  else if (mediaListFav == musique){
                  appState.addFavoritemusique(mediaListFav[indiceFav]);}
                  else if (mediaListFav == livre){
                  appState.addFavoritelivre(mediaListFav[indiceFav]);}
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