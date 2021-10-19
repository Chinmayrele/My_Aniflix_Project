import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  // const ListItem({ Key? key }) : super(key: key);
  final String url;
  const ListItem(this.url);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 80,
      child: Image.network(url),
    );
  }
}
