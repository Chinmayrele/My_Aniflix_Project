import 'package:anime_netflix_clone/screens/detail_screen.dart';
import 'package:flutter/material.dart';

import '../models/anime_home_page.dart';
import 'modal_botton_sheet.dart';

class HomeCoverPhoto extends StatelessWidget {
  // const HomeCoverPhoto({ Key? key }) : super(key: key);
  final AnimeHomePage animeDetails;
  // final List<AnimeHomePage> anime;
  const HomeCoverPhoto(this.animeDetails);

  // showSheet(BuildContext context) {
  // showModalBottomSheet(
  //     backgroundColor: Colors.grey[900],
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
  //     ),
  //     constraints: const BoxConstraints(
  //       maxHeight: 250,
  //       // maxWidth: double.infinity,
  //       minWidth: double.infinity,
  //     ),
  //     context: context,
  //     builder: (ctx) {
  //       return Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         // mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           const SizedBox(height: 17),
  //           GestureDetector(
  //             onTap: () {
  //               Navigator.of(context).pop();
  //               Navigator.of(context).push(MaterialPageRoute(
  //                   builder: (ctx) => DetailScreen(animeDetails)));
  //             },
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 SizedBox(
  //                   height: 140,
  //                   width: 120,
  //                   child: Image.network(animeDetails.coverImage),
  //                 ),
  //                 // const SizedBox(width: 3),
  //                 SizedBox(
  //                   height: 145,
  //                   width: 232,
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     children: [
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.end,
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         children: [
  //                           Text(
  //                             animeDetails.title.length > 14
  //                                 ? animeDetails.title.substring(0, 13) +
  //                                     '...'
  //                                 : animeDetails.title,
  //                             style: const TextStyle(
  //                               color: Colors.white,
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 22,
  //                             ),
  //                           ),
  //                           const Spacer(),
  //                           GestureDetector(
  //                             onTap: () {
  //                               Navigator.of(context).pop();
  //                             },
  //                             child: Container(
  //                               alignment: Alignment.center,
  //                               margin: const EdgeInsets.only(right: 10),
  //                               height: 35,
  //                               width: 35,
  //                               decoration: const BoxDecoration(
  //                                   shape: BoxShape.circle,
  //                                   color: Colors.black38),
  //                               child: const Center(
  //                                 child: Icon(
  //                                   Icons.close_sharp,
  //                                   size: 30,
  //                                   color: Colors.white,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       const SizedBox(height: 5),
  //                       SizedBox(
  //                         width: 140,
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text(
  //                               animeDetails.seasonYear.toString(),
  //                               style: TextStyle(
  //                                 color: Colors.grey[600],
  //                                 fontSize: 12,
  //                               ),
  //                             ),
  //                             Text(
  //                               animeDetails.episodesCount.toString() +
  //                                   ' epi',
  //                               style: TextStyle(
  //                                 color: Colors.grey[600],
  //                                 fontSize: 12,
  //                               ),
  //                             ),
  //                             Text(
  //                               animeDetails.seasonPeriod.toString() +
  //                                   ' Seasons',
  //                               style: TextStyle(
  //                                 color: Colors.grey[600],
  //                                 fontSize: 12,
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       const SizedBox(height: 7),
  //                       SizedBox(
  //                         height: 75,
  //                         width: 230,
  //                         child: animeDetails.description.isEmpty
  //                             ? const Center(
  //                                 child: Text(
  //                                   'No Description Available!!!',
  //                                   style: TextStyle(
  //                                     color: Colors.white,
  //                                     fontSize: 13,
  //                                   ),
  //                                 ),
  //                               )
  //                             : Text(
  //                                 animeDetails.description.length > 170
  //                                     ? animeDetails.description
  //                                             .substring(0, 170) +
  //                                         '...'
  //                                     : animeDetails.description,
  //                                 style: const TextStyle(
  //                                   color: Colors.white,
  //                                   fontSize: 13,
  //                                 ),
  //                               ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           // const SizedBox(height: 15),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: [
  //               SizedBox(
  //                 // padding: const EdgeInsets.only(top: 8),
  //                 width: 155,
  //                 child: ElevatedButton(
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                     Navigator.of(context).push(
  //                       MaterialPageRoute(
  //                           builder: (ctx) => DetailScreen(animeDetails)),
  //                     );
  //                   },
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: const [
  //                       Icon(
  //                         Icons.play_arrow,
  //                         color: Colors.black,
  //                       ),
  //                       SizedBox(width: 10),
  //                       Text('Play',
  //                           style:
  //                               TextStyle(color: Colors.black, fontSize: 15)),
  //                     ],
  //                   ),
  //                   style: ElevatedButton.styleFrom(
  //                     primary: Colors.white,
  //                   ),
  //                 ),
  //               ),
  //               Column(
  //                 children: [
  //                   const Icon(
  //                     Icons.file_download_outlined,
  //                     color: Colors.white,
  //                     size: 28,
  //                   ),
  //                   Text(
  //                     'Download',
  //                     style: TextStyle(color: Colors.grey[600], fontSize: 10),
  //                   ),
  //                 ],
  //               ),
  //               GestureDetector(
  //                 onTap: () {},
  //                 child: Column(
  //                   children: [
  //                     const Icon(
  //                       Icons.play_arrow_outlined,
  //                       color: Colors.white,
  //                       size: 28,
  //                     ),
  //                     Text(
  //                       'Preview',
  //                       style:
  //                           TextStyle(color: Colors.grey[600], fontSize: 10),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Container(
  //             height: 0.3,
  //             width: double.infinity,
  //             decoration: BoxDecoration(
  //               color: Colors.grey[600],
  //             ),
  //           ),
  //           const SizedBox(height: 6),
  //           SafeArea(
  //             bottom: true,
  //             left: true,
  //             right: true,
  //             minimum: const EdgeInsets.only(left: 20, right: 20),
  //             child: GestureDetector(
  //               onTap: () {
  //                 Navigator.of(context).pop();
  //                 Navigator.of(context).push(MaterialPageRoute(
  //                     builder: (ctx) => DetailScreen(animeDetails)));
  //               },
  //               child: Row(
  //                 children: const [
  //                   Icon(
  //                     Icons.info_outlined,
  //                     color: Colors.white,
  //                   ),
  //                   Text(
  //                     '  Details & More',
  //                     style: TextStyle(color: Colors.white, fontSize: 16),
  //                   ),
  //                   Spacer(),
  //                   Icon(
  //                     Icons.arrow_forward_ios,
  //                     color: Colors.white,
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       );
  //     });
  // }

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
