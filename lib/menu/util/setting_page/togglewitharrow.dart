import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ToggleWithArrow extends StatelessWidget {
  final IconData icons;
  final String texts;
  VoidCallback toDo;
  final double sizeIcon;

  ToggleWithArrow(
      {super.key,
        required this.icons,
        required this.texts,
        required this.toDo,
        required this.sizeIcon});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: toDo,
      onLongPress: toDo,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isDarkTheme ? Colors.grey[800] : HexColor('ffffff'),
        ),
        child: Padding(
          padding:
          const EdgeInsets.only(top: 16.0, left: 25, bottom: 16, right: 25),
          child: Row(
            children: [
              Container(
                  width: 30,
                  child: Center(
                    child: Icon(icons, size: sizeIcon, color: isDarkTheme ? Colors.white : Colors.black),
                  )),
              SizedBox(width: 20),
              Text(
                texts,
                style: TextStyle(fontSize: 13, color: isDarkTheme ? Colors.white : Colors.black),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: isDarkTheme ? Colors.white : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

