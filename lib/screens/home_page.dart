import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import './detail_screen.dart';
import './search_screen.dart';

import '../models/anime_home_page.dart';
import '../providers/anime_api.dart';
import '../widgets/scroll_list.dart';

class HomePage extends StatelessWidget {
  _showSheetAnime(
    BuildContext context,
    AnimeHomePage animeDetails,
    List<AnimeHomePage> anime,
  ) {
    showModalBottomSheet(
        backgroundColor: Colors.grey[900],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        constraints: const BoxConstraints(
          maxHeight: 250,
          // maxWidth: double.infinity,
          minWidth: double.infinity,
        ),
        context: context,
        builder: (ctx) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 17),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => DetailScreen(animeDetails, anime)));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 140,
                      width: 120,
                      child: Image.network(animeDetails.coverImage),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      height: 145,
                      width: 232,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                animeDetails.title.length > 14
                                    ? animeDetails.title.substring(0, 14) +
                                        '...'
                                    : animeDetails.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(right: 10),
                                  height: 35,
                                  width: 35,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black38),
                                  child: const Center(
                                    child: Icon(
                                      Icons.close_sharp,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: 140,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  animeDetails.seasonYear.toString(),
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  animeDetails.episodesCount.toString() +
                                      ' epi',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  animeDetails.seasonPeriod.toString() +
                                      ' Seasons',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 7),
                          SizedBox(
                            height: 75,
                            width: 230,
                            child: animeDetails.description.isEmpty
                                ? const Center(
                                    child: Text(
                                      'No Description Available!!!',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                  )
                                : Text(
                                    animeDetails.description.length > 170
                                        ? animeDetails.description
                                                .substring(0, 170) +
                                            '...'
                                        : animeDetails.description,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    // padding: const EdgeInsets.only(top: 8),
                    width: 155,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (ctx) =>
                                  DetailScreen(animeDetails, anime)),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text('Play',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.file_download_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                      Text(
                        'Download',
                        style: TextStyle(color: Colors.grey[600], fontSize: 10),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (ctx) =>
                                DetailScreen(animeDetails, anime)),
                      );
                    },
                    child: Column(
                      children: [
                        const Icon(
                          Icons.play_arrow_outlined,
                          color: Colors.white,
                          size: 28,
                        ),
                        Text(
                          'Preview',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 6),
              SafeArea(
                bottom: true,
                left: true,
                right: true,
                minimum: const EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => DetailScreen(animeDetails, anime)));
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.info_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        '  Details & More',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

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
    final animeRes = Provider.of<AnimeApi>(context, listen: false).animeHome;
    final animeResult = Provider.of<AnimeApi>(context, listen: false);
    animeResult.getByComedy();
    animeResult.getByAction();
    animeResult.getByMythology();
    animeResult.getByAdventure();
    animeResult.getByWar();
    animeResult.getByDrama();

    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 470,
              child: Image.network(
                animeRes[0].coverImage,
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
                                builder: (ctx) => SearchScreen(animeRes)));
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
                const SizedBox(height: 240),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _textGenre(animeRes[0].genres[0]),
                    _textGenre(animeRes[0].genres[1]),
                    _textGenre(animeRes[0].genres[2]),
                    _textGenre(animeRes[0].genres[3]),
                    _textGenre(animeRes[0].genres[4]),
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
                                animeResult.addToMyList(animeRes[0]);
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
                        _showSheetAnime(context, animeRes[0], animeRes);
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
                ScrollList('My Anime', animeRes, animeResult.comedyHome),
                ScrollList('Action Based', animeRes, animeResult.actionHome),
                ScrollList('Adventure', animeRes, animeResult.adventureHome),
                ScrollList('Drama', animeRes, animeResult.dramaHome),
                ScrollList('Mythology', animeRes, animeResult.mythologyHome),
                ScrollList('War Based', animeRes, animeResult.warHome),
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
