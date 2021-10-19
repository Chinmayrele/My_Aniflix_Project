import 'package:anime_netflix_clone/providers/anime_api.dart';
import 'package:anime_netflix_clone/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  // const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = true;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });

    Provider.of<AnimeApi>(context, listen: false).getAnime().then((_) {
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return HomePage();
        }),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          height: 140,
          width: 100,
          child: Image.asset('assets/images/Netflix-Logo.jpg'),
        ),
      ),
    );
  }
}
