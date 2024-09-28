import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ToggleWithSwitch extends StatelessWidget {
  final IconData icons;
  final String texts;
  final ValueChanged<bool>? onToggle;
  final bool status;
  final double sizeIcon;

  ToggleWithSwitch(
      {super.key,
        required this.icons,
        required this.texts,
        required this.onToggle,
        required this.status,
        required this.sizeIcon});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isDarkTheme ? Colors.grey[800] : HexColor('ffffff'),
      ),
      child: Padding(
        padding:
        const EdgeInsets.only(top: 6.0, left: 25, bottom: 6, right: 25),
        child: Row(
          children: [
            Container(
                width: 30,
                child: Center(
                  child: Icon(icons, size: sizeIcon, color: isDarkTheme ? Colors.white : Colors.black),
                )),
            SizedBox(width: 17),
            Text(
              texts,
              style: TextStyle(fontSize: 15, color: isDarkTheme ? Colors.white : Colors.black),
            ),
            Spacer(),
            Transform.scale(
              scale: 0.7,
              child: Switch(
                value: status,
                onChanged: onToggle,
                activeColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
