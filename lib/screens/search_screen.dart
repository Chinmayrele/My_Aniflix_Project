import 'package:anime_netflix_clone/providers/anime_api.dart';
import 'package:anime_netflix_clone/providers/search_provider.dart';
import 'package:anime_netflix_clone/widgets/search_list.dart';
import 'package:anime_netflix_clone/widgets/search_result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// AnimeApi myAnime;

class SearchScreen extends StatefulWidget {
  final int appBarDecider;
  const SearchScreen([this.appBarDecider]);
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _mySearched = TextEditingController();

  @override
  void dispose() {
    _mySearched.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myAnime = Provider.of<AnimeApi>(context, listen: false);
    final searchAnime = Provider.of<SearchProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: widget.appBarDecider != 1
          ? AppBar(
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
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.appBarDecider != 1
                ? const SizedBox(height: 5)
                : const SizedBox(height: 60),
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
                    // setState(() {

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => SearchResult(val)));

                    // });
                  }),
            ),
            const SizedBox(height: 14),
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
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
                height: 655,
                width: double.infinity,
                child: SearchList(myAnime.animeHome)),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
