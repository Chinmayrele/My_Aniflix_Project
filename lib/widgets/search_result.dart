import 'package:anime_netflix_clone/providers/search_provider.dart';
import 'package:anime_netflix_clone/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchResult extends StatefulWidget {
  // const SearchResult({ Key? key }) : super(key: key);
  final String title;
  const SearchResult(this.title);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  void dispose() {
    final searchAnime = Provider.of<SearchProvider>(context, listen: false);
    searchAnime.resetValue();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    final searchAnime = Provider.of<SearchProvider>(context, listen: false);
    searchAnime.fetchByTitle(widget.title).then((_) {
      searchAnime.isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchAnime = Provider.of<SearchProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black12,
      body: searchAnime.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                const SizedBox(height: 100),
                searchAnime.isSearchSuccess
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (ctx) =>
                                    DetailScreen(searchAnime.searchedAnime[0]
                                        // myAnime.mySearchedHome[0],
                                        // widget.animeDetails
                                        )),
                          );
                        },
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Container(
                              height: 180,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(searchAnime
                                          .searchedAnime[0].coverImage),
                                      fit: BoxFit.cover),
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(18),
                                    topLeft: Radius.circular(18),
                                  )),
                              margin:
                                  const EdgeInsets.only(left: 12, right: 12),
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
                              margin:
                                  const EdgeInsets.only(left: 12, right: 12),
                              padding: const EdgeInsets.only(left: 12),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        searchAnime.searchedAnime[0].title
                                                    .length >
                                                25
                                            ? searchAnime.searchedAnime[0].title
                                                .substring(0, 25)
                                            : searchAnime
                                                .searchedAnime[0].title,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        searchAnime.searchedAnime[0].seasonYear
                                            .toString(),
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        searchAnime
                                                .searchedAnime[0].episodesCount
                                                .toString() +
                                            ' epi',
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        searchAnime
                                                .searchedAnime[0].seasonPeriod
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
                        ),
                      )
                    : Column(
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
              ],
            ),
    );
  }
}
