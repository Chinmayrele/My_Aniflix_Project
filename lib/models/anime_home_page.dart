import 'package:flutter/foundation.dart';

class AnimeHomePage {
  final int id;
  final String coverImage;
  final String title;
  final List<dynamic> genres;
  final String description;
  final int seasonYear;
  final int episodesCount;
  final int seasonPeriod;
  final String trailerUrl;

  AnimeHomePage({
    @required this.id,
    @required this.coverImage,
    @required this.title,
    @required this.genres,
    @required this.description,
    @required this.seasonYear,
    @required this.episodesCount,
    @required this.seasonPeriod,
    @required this.trailerUrl,
  });
}
