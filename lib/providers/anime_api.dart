import 'dart:convert';

import 'package:anime_netflix_clone/models/anime_home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AnimeApi with ChangeNotifier {
  List<AnimeHomePage> _animesHome = [];
  List<AnimeHomePage> _actionAnime = [];
  List<AnimeHomePage> _dramaAnime = [];
  List<AnimeHomePage> _comedyAnime = [];
  List<AnimeHomePage> _mythologyAnime = [];
  List<AnimeHomePage> _warAnime = [];
  List<AnimeHomePage> _adventureAnime = [];
  List<AnimeHomePage> _myListAnime = [];
  List<AnimeHomePage> _mySearchedAnime = [];
  bool _isSearched = false;

  bool get isSearchedAnime {
    return _isSearched;
  }

  List<AnimeHomePage> get animeHome {
    return (_animesHome.toList()..shuffle());
  }

  List<AnimeHomePage> get actionHome {
    return (_actionAnime.toList()..shuffle());
  }

  List<AnimeHomePage> get dramaHome {
    return (_dramaAnime.toList()..shuffle());
  }

  List<AnimeHomePage> get comedyHome {
    return (_comedyAnime.toList()..shuffle());
  }

  List<AnimeHomePage> get mythologyHome {
    return (_mythologyAnime.toList()..shuffle());
  }

  List<AnimeHomePage> get warHome {
    return (_warAnime.toList()..shuffle());
  }

  List<AnimeHomePage> get adventureHome {
    return (_adventureAnime.toList()..shuffle());
  }

  List<AnimeHomePage> get myListHome {
    return [..._myListAnime];
  }

  List<AnimeHomePage> get mySearchedHome {
    return [..._mySearchedAnime];
  }

  Future<void> getAnime() async {
    final url = Uri.parse('https://api.aniapi.com/v1/anime');
    final response = await http.get(url);
    final result = (json.decode(response.body));
    List<AnimeHomePage> animes = [];

    if (result != null) {
      try {
        for (int i = 0; i < result['data']['documents'].length; i++) {
          var anime = (result['data']['documents'])[i];
          animes.add(AnimeHomePage(
            id: anime['id'],
            coverImage: anime['cover_image'],
            title: anime['titles']['en'],
            genres: anime['genres'],
            description: anime['descriptions']['en'],
            seasonYear: anime['season_year'],
            episodesCount: anime['episodes_count'],
            seasonPeriod: anime['season_period'],
            trailerUrl: anime['trailer_url'],
            epiDuration: anime['episode_duration'],
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

  List<AnimeHomePage> isComedy = [];
  getByComedy() {
    for (int i = 0; i < animeHome.length; i++) {
      isComedy = _animesHome
          .where((element) => element.genres.contains('Comedy'))
          .toList();
    }
    _comedyAnime = isComedy;
  }

  List<AnimeHomePage> isAction = [];
  getByAction() {
    for (int i = 0; i < animeHome.length; i++) {
      isAction = _animesHome
          .where((element) => element.genres.contains('Action'))
          .toList();
    }
    _actionAnime = isAction;
  }

  List<AnimeHomePage> isDrama = [];
  getByDrama() {
    for (int i = 0; i < animeHome.length; i++) {
      isDrama = _animesHome
          .where((element) => element.genres.contains('Drama'))
          .toList();
    }
    _dramaAnime = isDrama;
  }

  List<AnimeHomePage> isMythology = [];
  getByMythology() {
    for (int i = 0; i < animeHome.length; i++) {
      isMythology = _animesHome
          .where((element) => element.genres.contains('Mythology'))
          .toList();
    }
    _mythologyAnime = isMythology;
  }

  List<AnimeHomePage> isWar = [];
  getByWar() {
    for (int i = 0; i < animeHome.length; i++) {
      isWar = _animesHome
          .where((element) => element.genres.contains('War'))
          .toList();
    }
    _warAnime = isWar;
  }

  List<AnimeHomePage> isAdventure = [];
  getByAdventure() {
    for (int i = 0; i < animeHome.length; i++) {
      isAdventure = _animesHome
          .where((element) => element.genres.contains('Adventure'))
          .toList();
    }
    _adventureAnime = isAdventure;
  }

  addToMyList(AnimeHomePage anime) {
    _myListAnime.add(anime);
    notifyListeners();
  }

  searchedAnime(String name) {
    _mySearchedAnime.clear();
    _animesHome.forEach(
      (element) {
        if (element.title.toLowerCase() == name.toLowerCase()) {
          _mySearchedAnime.add(element);
        }
      },
    );
    _isSearched = true;
    notifyListeners();
  }
}
