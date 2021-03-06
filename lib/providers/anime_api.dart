import 'dart:convert';
import 'dart:math';

import 'package:anime_netflix_clone/models/anime_home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AnimeApi with ChangeNotifier {
  List<AnimeHomePage> _animesHome = [];
  final List<AnimeHomePage> _myListAnime = [];

  List<AnimeHomePage> get animeHome {
    return (_animesHome.toList()..shuffle());
  }

  List<AnimeHomePage> get myListHome {
    return [..._myListAnime];
  }

  Future<void> getAnime() async {
    int page = Random().nextInt(30);
    final url = Uri.parse('https://api.aniapi.com/v1/anime?page=${page + 1}');
    final response = await http.get(url);
    final result = (json.decode(response.body));
    List<AnimeHomePage> animes = [];

    if (result != null) {
      try {
        for (int i = 0; i < result['data']['documents'].length; i++) {
          var anime = (result['data']['documents'])[i];
          animes.add(AnimeHomePage(
            id: anime['id'] ?? 0,
            coverImage: anime['cover_image'] ?? "",
            title: anime['titles']['en'] ?? "",
            genres: anime['genres'] ?? [],
            description: anime['descriptions']['en'] ?? "",
            seasonYear: anime['season_year'] ?? 0,
            episodesCount: anime['episodes_count'] ?? 0,
            seasonPeriod: anime['season_period'] ?? 0,
            trailerUrl: anime['trailer_url'] ?? "",
            epiDuration: anime['episode_duration'] ?? 0,
          ));
        }
      } catch (e) {
        debugPrint("here");
        debugPrint(e.toString());
      }
      _animesHome = animes;
      notifyListeners();
    } else {}
  }

  List<AnimeHomePage> getAnimeByGenre(String genre) {
    List<AnimeHomePage> result = [];

    for (int i = 0; i < animeHome.length; i++) {
      result = _animesHome
          .where((element) => element.genres.contains(genre))
          .toList();
    }
    return result..shuffle();
  }

  addToMyList(AnimeHomePage anime) {
    _myListAnime.add(anime);
    notifyListeners();
  }

  // searchedAnime(String name) {
  //   _mySearchedAnime.clear();
  //   _animesHome.forEach(
  //     (element) {
  //       if (element.title.toLowerCase() == name.toLowerCase()) {
  //         _mySearchedAnime.add(element);
  //       }
  //     },
  //   );
  //   _isSearched = true;
  //   notifyListeners();
  // }
}
