import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import './search_screen.dart';

import '../widgets/modal_botton_sheet.dart';
import '../providers/anime_api.dart';
import '../widgets/scroll_list.dart';

class HomePage extends StatelessWidget {
  // List<AnimeHomePage> animeRes;
  // AnimeApi animeResult;
  final Timer timer;

  const HomePage(this.timer);

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
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final animeRes = Provider.of<AnimeApi>(context, listen: false);

    final deviceSize = MediaQuery.of(context).size;
    timer.cancel();
    // debugPrint(deviceSize.toString());

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
                        // color: Colors.transparent,
                        // colorBlendMode: BlendMode.dst,
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
                                builder: (ctx) =>
                                    SearchScreen(animeRes.animeHome)));
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
                // const SizedBox(height: 240),
                SizedBox(height: deviceSize.height * 0.3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _textGenre(animeRes.animeHome[0].genres[0]),
                    _textGenre(animeRes.animeHome[0].genres[1]),
                    _textGenre(animeRes.animeHome[0].genres[2]),
                    _textGenre(animeRes.animeHome[0].genres[3]),
                    _textGenre(animeRes.animeHome[0].genres[4]),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 62,
                      width: 92,
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          blurRadius: 48,
                          color: Colors.black87,
                          offset: Offset(2, 4),
                          spreadRadius: 7,
                        ),
                      ]),
                      child: Column(
                        children: [
                          IconButton(
                              highlightColor: Colors.black,
                              onPressed: () {
                                animeRes.addToMyList(animeRes.animeHome[0]);
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 34,
                              )),
                          const Text(
                            'My List',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showSheet(context, animeRes.animeHome[0]);
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                          Text('Play',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14)),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.white),
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
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.info_outline,
                                size: 30,
                                color: Colors.white,
                              )),
                          const Text(
                            'Info',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
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
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        animationCurve: Curves.decelerate,
        buttonBackgroundColor: Colors.white,
        height: 55,
        items: const <Widget>[
          Icon(
            Icons.home_filled,
            size: 25,
          ),
          Icon(
            Icons.favorite_border,
            size: 25,
          ),
          Icon(
            Icons.download_for_offline_outlined,
            size: 25,
          ),
        ],
        onTap: (index) {
          // print(index);
        },
      ),
    );
  }
}
