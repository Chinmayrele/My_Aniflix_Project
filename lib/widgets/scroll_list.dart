import 'package:anime_netflix_clone/widgets/home_cover_photos.dart';
import 'package:flutter/material.dart';
import 'package:anime_netflix_clone/models/anime_home_page.dart';

class ScrollList extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);
  final String text;
  final List<AnimeHomePage> anime;
  final List<AnimeHomePage> isList;
  const ScrollList(this.text, this.anime, this.isList);
  @override
  State<ScrollList> createState() => _ScrollListState();
}

class _ScrollListState extends State<ScrollList> {
  int _currentMax = 10;
  final ScrollController _scrollControllerCom = ScrollController();

  @override
  void initState() {
    _scrollControllerCom.addListener(() {
      if (_scrollControllerCom.position.pixels ==
          _scrollControllerCom.position.maxScrollExtent) {
        _getMoreData();
      }
    });
    super.initState();
  }

  void _getMoreData() {
    for (int i = _currentMax; i < _currentMax + 10; i++) {}
    _currentMax += 10;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.only(left: 18, bottom: 10),
          child: Text(
            widget.text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 12),
          height: 120,
          width: 400,
          child: ListView.builder(
            controller: _scrollControllerCom,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (ctx, index) {
              if (index == _currentMax - 1) {
                return const Center(child: CircularProgressIndicator());
              }
              return HomeCoverPhoto(widget.isList[index], widget.anime);
            },
            itemCount: _currentMax > widget.isList.length
                ? widget.isList.length
                : _currentMax,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
