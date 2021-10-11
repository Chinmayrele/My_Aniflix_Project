import 'package:flutter/foundation.dart';

class AnimeHomePage {
  final String id;
  final String coverImage;
  final String title;
  final List<dynamic> genres;

  AnimeHomePage({
    @required this.id,
    @required this.coverImage,
    @required this.title,
    @required this.genres,
  });
}
