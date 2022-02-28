import 'package:anime_netflix_clone/providers/anime_api.dart';
import 'package:anime_netflix_clone/widgets/modal_botton_sheet.dart';
import 'package:flutter/material.dart';

class FrontButtons extends StatefulWidget {
  // const FrontButtons({ Key? key }) : super(key: key);
  final AnimeApi animeRes;
  const FrontButtons(this.animeRes);

  @override
  _FrontButtonsState createState() => _FrontButtonsState();
}

class _FrontButtonsState extends State<FrontButtons> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 62,
          width: 92,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 48,
              color: Colors.black87,
              offset: Offset(2, 4),
              spreadRadius: 7,
            ),
          ]),
          child: Column(
            children: [
              IconButton(
                  highlightColor: Colors.black,
                  onPressed: () {
                    setState(() {
                      flag = !flag;
                      widget.animeRes.addToMyList(widget.animeRes.animeHome[0]);
                    });
                  },
                  icon: flag
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 34,
                        )
                      : const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 34,
                        )),
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
        ElevatedButton(
          onPressed: () {
            showSheet(context, widget.animeRes.animeHome[0]);
          },
          child: Row(
            children: const [
              Icon(
                Icons.play_arrow,
                color: Colors.black,
              ),
              Text('Play', style: TextStyle(color: Colors.black, fontSize: 14)),
            ],
          ),
          style: ElevatedButton.styleFrom(primary: Colors.white),
        ),
        Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 48,
              color: Colors.black87,
              offset: Offset(2, 4),
              spreadRadius: 7,
            ),
          ]),
          child: Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.info_outline,
                    size: 30,
                    color: Colors.white,
                  )),
              const Text(
                'Info',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
