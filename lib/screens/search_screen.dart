import 'package:anime_netflix_clone/models/anime_home_page.dart';
import 'package:anime_netflix_clone/providers/anime_api.dart';
import 'package:anime_netflix_clone/widgets/search_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  // const SearchScreen({ Key? key }) : super(key: key);
  final List<AnimeHomePage> animeDetails;
  const SearchScreen(this.animeDetails);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _mySearched = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final myAnime = Provider.of<AnimeApi>(context);
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 20,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          Container(
            height: 30,
            width: 30,
            child: Image.asset('assets/images/default_profile.jpg'),
            margin: const EdgeInsets.only(right: 15),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  controller: _mySearched,
                  cursorHeight: 22,
                  // autofocus: true,
                  cursorColor: Colors.grey[700],
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[850]),
                        borderRadius: BorderRadius.circular(10)),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: 'Search for a anime, movie, genre,...',
                    hintStyle: const TextStyle(
                        color: Colors.grey, fontSize: 15, wordSpacing: 2),
                    fillColor: Colors.grey[800],
                    filled: true,
                    suffixIcon: const Icon(Icons.mic, color: Colors.grey),
                  ),
                  onSubmitted: (val) {
                    setState(() {
                      myAnime.searchedAnime(_mySearched.text.trim());
                    });
                  }),
            ),
            myAnime.isSearchedAnime
                ? myAnime.mySearchedHome.isEmpty
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/notFound.jpg'),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(15)),
                              margin:
                                  const EdgeInsets.only(left: 12, right: 12),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            '               OOPs!!! \nNo Results For The Search',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          const SizedBox(height: 20),
                          Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        myAnime.mySearchedHome[0].coverImage),
                                    fit: BoxFit.cover),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(18),
                                  topLeft: Radius.circular(18),
                                )),
                            margin: const EdgeInsets.only(left: 12, right: 12),
                          ),
                          // const SizedBox(height: 8),
                          Container(
                            height: 75,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey[850],
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16))),
                            margin: const EdgeInsets.only(left: 12, right: 12),
                            padding: const EdgeInsets.only(left: 12),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      myAnime.mySearchedHome[0].title.length >
                                              25
                                          ? myAnime.mySearchedHome[0].title
                                              .substring(0, 25)
                                          : myAnime.mySearchedHome[0].title,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.play_circle_outlined,
                                          color: Colors.white,
                                          size: 46,
                                        )),
                                    const SizedBox(width: 18),
                                  ],
                                ),
                                // const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      myAnime.mySearchedHome[0].seasonYear
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      myAnime.mySearchedHome[0].episodesCount
                                              .toString() +
                                          ' epi',
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      myAnime.mySearchedHome[0].seasonPeriod
                                              .toString() +
                                          ' Seasons',
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 14),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Top Searches',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 630,
                        width: double.infinity,
                        child: ListView.builder(
                          itemBuilder: (ctx, index) =>
                              SearchList(widget.animeDetails, index),
                          itemCount: 20,
                          padding: const EdgeInsets.only(left: 5, right: 5),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
