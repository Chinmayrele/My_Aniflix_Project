import 'dart:async';

import 'package:anime_netflix_clone/screens/home_page.dart';
import 'package:anime_netflix_clone/widgets/tabscreen.dart';
import 'package:flutter/material.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer timer = Timer(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: isLoading ? ShimmerList() : TabScreen(timer),
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
        const SizedBox(height: 120),
        Shimmer.fromColors(
            child: Container(
              width: double.infinity,
              height: deviceSize.height * 0.20,
              margin: const EdgeInsets.only(top: 50, right: 10, left: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30)),
            ),
            baseColor: Colors.grey[850],
            highlightColor: Colors.grey[800]),
        const SizedBox(height: 90),
        ShimmerLayout(),
        const SizedBox(height: 45),
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
      height: 135,
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
                  decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(10)),
                ),
                baseColor: Colors.grey[850],
                highlightColor: Colors.grey[800],
                period: Duration(milliseconds: time),
              ),
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
