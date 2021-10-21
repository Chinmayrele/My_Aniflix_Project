import 'package:anime_netflix_clone/models/anime_home_page.dart';
import 'package:flutter/material.dart';

class EpisodeItem extends StatelessWidget {
  // const EpisodeItem({ Key? key }) : super(key: key);
  final AnimeHomePage animeDetails;
  final int index;
  const EpisodeItem(this.animeDetails, this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 70,
              width: 120,
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(
                animeDetails.coverImage,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  animeDetails.title.length > 12
                      ? (index + 1).toString() +
                          '. ' +
                          animeDetails.title.substring(0, 12) +
                          '...'
                      : (index + 1).toString() + '. ' + animeDetails.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  animeDetails.epiDuration.toString() + ' min',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                )
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.file_download_outlined,
                  color: Colors.white,
                  size: 34,
                )),
            const SizedBox(width: 8),
          ],
        ),
        const SizedBox(height: 10),
        Container(
            height: animeDetails.description.isEmpty ? 40 : 68,
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: animeDetails.description.isEmpty
                ? const Center(
                    child: Text(
                      'No Description Available!!!',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  )
                : Text(
                    animeDetails.description.length > 170
                        ? animeDetails.description.substring(0, 170) + '...'
                        : animeDetails.description,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  )),
        const SizedBox(height: 5),
      ],
    );
  }
}
