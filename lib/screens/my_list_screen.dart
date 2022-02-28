import 'package:anime_netflix_clone/providers/anime_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyListAnime extends StatelessWidget {
  // const MyListAnime({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myList = Provider.of<AnimeApi>(context, listen: false).myListHome;
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: SizedBox(
          height: 120,
          width: 80,
          child: Image.network(myList[0].coverImage),
        ),
      ),
    );
  }
}
