import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:anime_netflix_clone/models/anime_home_page.dart';

class SearchProvider with ChangeNotifier {
  final List<AnimeHomePage> _searchResults = [];
  bool isLoading;

  bool _isSearchSuccess = false;

  bool get isSearchSuccess {
    return _isSearchSuccess;
  }

  List<AnimeHomePage> get searchedAnime {
    return [..._searchResults];
  }

  void resetValue() {
    _searchResults.clear();
  }

  Future<void> fetchByTitle(String title) async {
    isLoading = true;
    _searchResults.clear();
    title = title
      ..trimRight()
      ..replaceAll(" ", "%20");
    final url = Uri.parse("https://api.aniapi.com/v1/anime?title=$title");
    try {
      final response = await http.get(url);
      final result = json.decode(response.body);
      if (result['status_code'] != 200) {
        throw result['message'] ?? "Something went wrong!!";
      }
      result['data']['documents'].forEach((value) {
        _searchResults.add(AnimeHomePage(
            id: value["id"] ?? 0,
            title: value['titles']['en'] ?? "",
            description: value['descriptions']['en'] ?? "",
            seasonPeriod: value['season_period'] ?? 0,
            episodesCount: value['episodes_count'] ?? 0,
            coverImage: value["cover_image"] ?? "",
            genres: value['genres'] ?? [],
            trailerUrl: value['trailer_url'] ?? "",
            epiDuration: value['episode_duration'] ?? 0,
            seasonYear: value['season_year'] ?? 0));
      });
      isLoading = true;
      if (_searchResults.isEmpty) {
        _isSearchSuccess = false;
      } else {
        _isSearchSuccess = true;
      }
      notifyListeners();
    } catch (err) {
      throw err.toString();
    }
  }
}
