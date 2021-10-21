import 'package:anime_netflix_clone/models/anime_home_page.dart';
import 'package:flutter/material.dart';

class SearchList extends StatelessWidget {
  // const SearchList({ Key? key }) : super(key: key);
  final List<AnimeHomePage> animeDetails;
  final int index;
  const SearchList(this.animeDetails, this.index);

  @override
  Widget build(BuildContext context) {
    debugPrint(animeDetails.length.toString());
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(left: 8),
          tileColor: Colors.grey[850],
          leading: SizedBox(
            height: 60,
            width: 100,
            child: Image.network(
              animeDetails[index].coverImage,
              fit: BoxFit.cover,
            ),
          ),
          // tileColor: Colors.grey[850],
          title: Text(
            animeDetails[index].title.length > 23
                ? animeDetails[index].title.substring(0, 23)
                : animeDetails[index].title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.play_circle_outlined,
                color: Colors.white,
                size: 28,
              )),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
