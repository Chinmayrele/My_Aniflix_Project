import 'package:flutter/material.dart';

import '../models/anime_home_page.dart';
import 'modal_botton_sheet.dart';

class HomeCoverPhoto extends StatelessWidget {
  // const HomeCoverPhoto({ Key? key }) : super(key: key);
  final AnimeHomePage animeDetails;
  const HomeCoverPhoto(this.animeDetails);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSheet(context, animeDetails);
      },
      child: SizedBox(
        height: 140,
        width: 100,
        child: Image.network(animeDetails.coverImage),
      ),
    );
  }
}
