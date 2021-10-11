import 'dart:convert';

import 'package:anime_netflix_clone/models/anime_home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AnimeApi with ChangeNotifier {
  List<AnimeHomePage> _animesHome = [];

  List<AnimeHomePage> get animeHome {
    return [..._animesHome];
  }

  Future<void> getAnime() async {
    final url = Uri.parse('https://api.aniapi.com/v1/anime');
    final response = await http.get(url);
    final result = json.decode(response.body);
    // debugPrint(result.toString());
    List<AnimeHomePage> animes = [];
    // List<dynamic> bjsb = result['data']['documents'] as List<dynamic>;
    for (int i = 0; i < result['data']['count']; i++) {
      var anime = result['data']['documents'][i];
      animes.add(AnimeHomePage(
        id: anime['id'],
        coverImage: anime['cover_image'],
        title: anime['titles'],
        genres: anime['genres'],
      ));
    }
    // debugPrint(animes[0].title);
    _animesHome = animes;
    notifyListeners();
  }
}
