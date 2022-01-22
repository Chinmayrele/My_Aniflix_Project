import 'package:anime_netflix_clone/models/anime_home_page.dart';
import 'package:anime_netflix_clone/providers/anime_api.dart';
import 'package:share/share.dart';

Future<void> share(AnimeHomePage anime) async {
  await Share.share('Sharing this amazing Anime ${anime.title}',
      subject: 'Share if You Like This Anime');
}
