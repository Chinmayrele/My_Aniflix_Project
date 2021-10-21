import 'package:anime_netflix_clone/models/anime_home_page.dart';
import 'package:anime_netflix_clone/screens/detail_screen.dart';
import 'package:anime_netflix_clone/screens/episodes_screen.dart';
import 'package:anime_netflix_clone/widgets/more_like_this_grid.dart';
import 'package:flutter/material.dart';

class CategoryPart extends StatefulWidget {
  // const DetailScreen({ Key? key }) : super(key: key);
  final List<AnimeHomePage> anime;
  final AnimeHomePage animeDetails;
  const CategoryPart(this.anime, this.animeDetails);
  @override
  State<CategoryPart> createState() => _CategoryPartState();
}

class _CategoryPartState extends State<CategoryPart> {
  var _category = Category.episodes;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 15),
            _buildButton(60, Category.episodes, 'EPISODES'),
            const SizedBox(width: 15),
            _buildButton(100, Category.moreLikeThis, 'MORE LIKE THIS'),
          ],
        ),
        const SizedBox(height: 15),
        _category == Category.episodes
            ? EpisodesScreen(widget.animeDetails)
            : MoreLikeGrid(widget.anime),
      ],
    );
  }

  _buildButton(double width, Category type, String text) {
    return Column(
      children: [
        Container(
          height: 5,
          width: width,
          decoration: BoxDecoration(
            color: _category == type ? Colors.red[900] : null,
          ),
          margin: const EdgeInsets.only(bottom: 9),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _category = type;
            });
          },
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
