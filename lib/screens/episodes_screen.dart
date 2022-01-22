import 'package:flutter/material.dart';

import '../models/anime_home_page.dart';
import '../widgets/episode_item.dart';

class EpisodesScreen extends StatelessWidget {
  // const EpisodesScreen({ Key? key }) : super(key: key);
  final AnimeHomePage animeDetails;

  const EpisodesScreen(this.animeDetails);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 35,
          width: 130,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 30,
              width: 100,
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(8)),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: const [
                    SizedBox(width: 10),
                    Text(
                      'Season 1',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 23),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white70,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
            height: 290,
            width: 340,
            child: ListView.builder(
              itemBuilder: (ctx, index) => EpisodeItem(animeDetails, index),
              itemCount: animeDetails.episodesCount > 10
                  ? 10
                  : animeDetails.episodesCount,
            )),
      ],
    );
  }
}
