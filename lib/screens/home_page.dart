// import 'dart:convert';

import 'package:anime_netflix_clone/providers/anime_api.dart';
import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animeRes = Provider.of<AnimeApi>(context, listen: false).animeHome;
    // final animeData = Provider.of<AnimeApi>(context, listen: false).getAnime();
    // debugPrint(animeRes[0].id);
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.network(
                animeRes[0].coverImage,
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 50),
              Row(
                children: [
                  Container(
                    height: 55,
                    width: 35,
                    margin: const EdgeInsets.only(left: 15),
                    child: Image.asset('assets/images/Netflix-Logo.jpg'),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search_outlined,
                        size: 30,
                        color: Colors.white,
                      )),
                  Container(
                    height: 30,
                    width: 30,
                    child: Image.asset('assets/images/default_profile.jpg'),
                    margin: const EdgeInsets.only(right: 15),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        animationCurve: Curves.decelerate,
        buttonBackgroundColor: Colors.white,
        height: 55,
        // color: Colors.black,
        items: const <Widget>[
          Icon(
            Icons.home_filled,
            size: 25,
            // color: Colors.white,
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
