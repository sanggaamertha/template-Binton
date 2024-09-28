import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';

class RateAppDialog extends StatefulWidget {
  RateAppDialog({super.key});

  @override
  _RateAppDialogState createState() => _RateAppDialogState();
}

class _RateAppDialogState extends State<RateAppDialog> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      child: Container(
        width: screenWidth/1.3,

        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isDarkTheme?Colors.grey[900]:HexColor('f2f2f2'),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: HexColor('454545')),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Rate Apps', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19, color: isDarkTheme?Colors.grey:Colors.grey[800]),),
            SizedBox(height: 15,),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
                size: 23,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SizedBox(height: 16),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(child: child, scale: animation);
              },
              child: _rating == 0
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Have any problem? contact us', style: TextStyle(fontSize: 13, color:isDarkTheme?Colors.grey:Colors.grey[800])),
                ],
              )
                  : Text(
                _getEmojiForRating(_rating),
                key: ValueKey<double>(_rating),
                style: TextStyle(fontSize: 60),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getEmojiForRating(double rating) {
    if (rating >= 4.5) {
      return '😍';
    } else if (rating >= 3.5) {
      return '😊';
    } else if (rating >= 2.5) {
      return '😐';
    } else if (rating >= 1.5) {
      return '😟';
    } else {
      return '😢';
    }
  }
}
