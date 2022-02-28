import 'package:anime_netflix_clone/screens/front_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './search_screen.dart';
import '../providers/anime_api.dart';
import '../widgets/scroll_list.dart';

class HomePage extends StatelessWidget {
  Widget _textGenre(String text) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 48,
          color: Colors.black87,
          offset: Offset(2, 4),
          spreadRadius: 7,
        ),
      ]),
      child: Row(
        children: [
          const Text(
            '\u2022',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final animeRes = Provider.of<AnimeApi>(context, listen: false);
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              // height: 470,
              height: deviceSize.height * 0.59,
              child: Image.network(
                animeRes.animeHome[0].coverImage,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      height: 95,
                      width: 55,
                      margin: const EdgeInsets.only(left: 15),
                      child: Image.asset(
                        'assets/images/netflix_logo.png',
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          blurRadius: 48,
                          color: Colors.black87,
                          offset: Offset(2, 4),
                          spreadRadius: 7,
                        ),
                      ]),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => SearchScreen()));
                          },
                          icon: const Icon(
                            Icons.search_outlined,
                            size: 30,
                            color: Colors.white,
                          )),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      child: Image.asset('assets/images/default_profile.jpg'),
                      margin: const EdgeInsets.only(right: 15),
                    ),
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                      blurRadius: 48,
                      color: Colors.black87,
                      offset: Offset(2, 4),
                      spreadRadius: 7,
                    ),
                  ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'TV Animes',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Animes',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'My List',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: deviceSize.height * 0.3),
                animeRes.animeHome[0].genres.length <= 3
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _textGenre(animeRes.animeHome[0].genres[0]),
                          _textGenre(animeRes.animeHome[0].genres[1]),
                          _textGenre(animeRes.animeHome[0].genres[2]),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _textGenre(animeRes.animeHome[0].genres[0]),
                          _textGenre(animeRes.animeHome[0].genres[1]),
                          _textGenre(animeRes.animeHome[0].genres[2]),
                          _textGenre(animeRes.animeHome[0].genres[3]),
                        ],
                      ),
                const SizedBox(height: 20),
                FrontButtons(animeRes),
                ScrollList('My Anime', animeRes.getAnimeByGenre('Comedy')),
                ScrollList('Action Based', animeRes.getAnimeByGenre('Action')),
                ScrollList('Adventure', animeRes.getAnimeByGenre('Adventure')),
                ScrollList('Drama', animeRes.getAnimeByGenre('Drama')),
                ScrollList('Mythology', animeRes.getAnimeByGenre('Mythology')),
                ScrollList('War Based', animeRes.getAnimeByGenre('War')),
                const SizedBox(height: 25),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
