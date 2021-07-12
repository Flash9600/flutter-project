import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: IconTheme(
                data: IconThemeData(color: Colors.white, size: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.home)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
                      ],
                    )
                  ],
                ))));
  }
}
