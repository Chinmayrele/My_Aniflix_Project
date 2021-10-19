import 'package:flutter/material.dart';

import '../models/anime_home_page.dart';
import '../widgets/list_item.dart';

class MoreLikeGrid extends StatelessWidget {
  // const MoreLikeGrid({ Key? key }) : super(key: key);
  final List<AnimeHomePage> anime;
  const MoreLikeGrid(this.anime);

  @override
  Widget build(BuildContext context) {
    // var listAnime = Provider.of<AnimeApi>(context, listen: false).actionHome;
    return SizedBox(
      height: 330,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 0.83,
          crossAxisSpacing: 1,
          mainAxisSpacing: 10,
          maxCrossAxisExtent: 133,
        ),
        itemBuilder: (ctx, index) => ListItem(anime[index].coverImage),
        itemCount: 12,
      ),
    );
  }
}
