import 'package:anime_netflix_clone/models/rate_share.dart';
import 'package:anime_netflix_clone/providers/anime_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../widgets/category_part.dart';
import '../models/anime_home_page.dart';

enum Category {
  episodes,
  moreLikeThis,
}

bool flag = false;

class DetailScreen extends StatefulWidget {
  // const DetailScreen({ Key? key }) : super(key: key);
  final AnimeHomePage animeDetails;
  const DetailScreen(this.animeDetails);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  YoutubePlayerController _controller;

  _buttonMaker(String text, Color color, IconData icon, Function function,
      Color backColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
            ),
            const SizedBox(width: 5),
            Text(text, style: TextStyle(color: color, fontSize: 16)),
          ],
        ),
        style: ElevatedButton.styleFrom(primary: backColor),
      ),
    );
  }

  _buttonRowList(IconData icons, String text, Function function) {
    return SizedBox(
      height: 62,
      width: 92,
      child: Column(
        children: [
          IconButton(
              highlightColor: Colors.black,
              onPressed: () {
                setState(() {
                  function();
                });
                // animeResult.addToMyList(animeRes[0]);
                // share(widget.animeDetails);
              },
              icon: Icon(
                icons,
                color: Colors.white,
                size: 34,
              )),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
            ),
          )
        ],
      ),
    );
  }

  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.animeDetails.trailerUrl == null
          ? ""
          : YoutubePlayer.convertUrlToId(
              widget.animeDetails.trailerUrl,
            ),
      flags: const YoutubePlayerFlags(
        disableDragSeek: true,
        // disableDragSeek: true,
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void initState() {
    runYoutubePlayer();
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    _controller.mute();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final anime = Provider.of<AnimeApi>(context, listen: false);
    final deviceSize = MediaQuery.of(context).size;

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        // bottomActions: const [Icon(Icons.volume_off)],
        controller: _controller,
        progressColors: ProgressBarColors(
          playedColor: Colors.red[900],
          handleColor: Colors.red[900],
        ),
      ),
      builder: (ctx, value) {
        return Scaffold(
          backgroundColor: Colors.black,
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
                )),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_outlined,
                    size: 30,
                    color: Colors.white,
                  )),
              Container(
                height: 30,
                width: 30,
                child: Image.asset('assets/images/default_profile.jpg'),
                margin: const EdgeInsets.only(right: 15),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                widget.animeDetails.trailerUrl == null
                    ? SizedBox(
                        // height: 200,
                        height: deviceSize.height * 0.251,
                        width: double.infinity,
                        child: Image.network(
                          widget.animeDetails.coverImage,
                          fit: BoxFit.fill,
                        ),
                      )
                    : value,
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    widget.animeDetails.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const SizedBox(width: 25),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 10),
                      child: Text(
                        widget.animeDetails.seasonYear.toString(),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 15),
                      child: Text(
                        widget.animeDetails.episodesCount.toString() + ' epi',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Text(
                      widget.animeDetails.seasonPeriod.toString() + ' Seasons',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                _buttonMaker(
                  'Play',
                  Colors.black,
                  Icons.play_arrow,
                  () {},
                  Colors.white,
                ),
                _buttonMaker(
                  'Download',
                  Colors.grey[600],
                  Icons.file_download_outlined,
                  () {},
                  Colors.grey[850],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.only(left: 12),
                  height: widget.animeDetails.description.isEmpty ? 40 : 80,
                  width: double.infinity,
                  child: widget.animeDetails.description.isEmpty
                      ? const Center(
                          child: Text(
                            'No Description Available!!!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        )
                      : Text(
                          widget.animeDetails.description.length > 220
                              ? widget.animeDetails.description
                                      .substring(0, 220) +
                                  '...'
                              : widget.animeDetails.description,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          flag = !flag;
                          anime.addToMyList(widget.animeDetails);
                        });
                      },
                      child: SizedBox(
                        height: 60,
                        width: 92,
                        child: Column(
                          children: [
                            Icon(!flag ? Icons.add : Icons.check,
                                color: Colors.white, size: 34),
                            const SizedBox(height: 10),
                            const Text(
                              'My List',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // _buttonRowList(!flag ? Icons.add : Icons.check, 'My List',
                    //     () {
                    //   setState(() {
                    //     flag = !flag;
                    //     anime.addToMyList(widget.animeDetails);
                    //   });
                    // }),
                    _buttonRowList(
                        Icons.thumbs_up_down_outlined, 'Rate', () {}),
                    _buttonRowList(Icons.share, 'Share', () {
                      share(widget.animeDetails);
                    }),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 0.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                CategoryPart(widget.animeDetails, anime.animeHome),
              ],
            ),
          ),
        );
      },
    );
  }
}
