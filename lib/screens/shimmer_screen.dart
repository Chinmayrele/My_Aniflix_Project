import 'dart:async';

import 'package:anime_netflix_clone/providers/anime_api.dart';
import 'package:anime_netflix_clone/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerScreen extends StatefulWidget {
  // const ShimmerScreen({ Key? key }) : super(key: key);

  @override
  _ShimmerScreenState createState() => _ShimmerScreenState();
}

class _ShimmerScreenState extends State<ShimmerScreen> {
  bool isLoading = true;

  @override
  void initState() {
    // final animeRes = Provider.of<AnimeApi>(context, listen: false).animeHome;
    // final animeResult = Provider.of<AnimeApi>(context, listen: false);
    // animeResult.getByComedy();
    // animeResult.getByAction();
    // animeResult.getByMythology();
    // animeResult.getByAdventure();
    // animeResult.getByWar();
    // animeResult.getByDrama();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final animeRes = Provider.of<AnimeApi>(context, listen: false).animeHome;
    final animeResult = Provider.of<AnimeApi>(context, listen: false);
    // animeResult.getByComedy();
    // animeResult.getByAction();
    // animeResult.getByMythology();
    // animeResult.getByAdventure();
    // animeResult.getByWar();
    // animeResult.getByDrama();

    Timer timer = Timer(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });

    return Scaffold(
      backgroundColor: Colors.black,
      // body: Shimmer.fromColors(
      //     child: ShimmerList(),
      //     baseColor: Colors.grey,
      //     highlightColor: Colors.grey[700]),
      body: isLoading ? ShimmerList() : HomePage(timer),
    );
  }
}

class ShimmerList extends StatelessWidget {
  // const ShimmerList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Shimmer.fromColors(
            child: Container(
              width: double.infinity,
              height: deviceSize.height * 0.55,
              margin: const EdgeInsets.only(top: 50, right: 10, left: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30)),
            ),
            baseColor: Colors.grey[850],
            highlightColor: Colors.grey[800]),
        const SizedBox(height: 30),
        ShimmerLayout(),
        const SizedBox(height: 25),
        ShimmerLayout(),
      ],
    );
  }
}

class ShimmerLayout extends StatelessWidget {
  // const ShimmerLayout({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 700;
    return Container(
      padding: const EdgeInsets.only(left: 10),
      width: 500,
      height: 125,
      child: ListView.builder(
        itemBuilder: (ctx, i) {
          offset += 5;
          time = time + offset;
          return Row(
            children: [
              Shimmer.fromColors(
                child: Container(
                  width: 100,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.grey[700]),
                ),
                baseColor: Colors.grey[850],
                highlightColor: Colors.grey[800],
                period: Duration(milliseconds: time),
              ),
              // child: Container(
              //   width: 100,
              //   padding: const EdgeInsets.all(10),
              //   decoration: BoxDecoration(color: Colors.grey[700]),
              // ),

              const SizedBox(width: 7),
            ],
          );
        },
        itemCount: 6,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
