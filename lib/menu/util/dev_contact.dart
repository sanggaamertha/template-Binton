import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class devContact extends StatefulWidget {
  devContact({super.key});

  @override
  State<devContact> createState() => _devContactState();
}

class _devContactState extends State<devContact> {

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      child: Container(
        width: screenWidth/1.3,
        height: screenHeight/4.1,
        decoration: BoxDecoration(
          color: isDarkTheme?Colors.grey[900]:HexColor('f2f2f2'),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: HexColor('454545')),
        ),

        child: Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 15, left: 13,right: 13),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isDarkTheme?Colors.grey[800]:HexColor('ffffff'),
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20,top: 15,bottom: 15),
                  child: Row(children: [
                    Icon(FontAwesomeIcons.whatsapp, size: 25,),
                    Expanded(child: Center(child: Text('Tap to Contact', style: TextStyle(fontSize: 16, color: isDarkTheme?Colors.grey:Colors.grey[800]),))),

                  ],),
                ),
              ),
              SizedBox(height: 5,),

              Container(
                decoration: BoxDecoration(
                  color: isDarkTheme?Colors.grey[800]:HexColor('ffffff'),
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20,top: 15,bottom: 15),
                  child: Row(children: [
                    Icon(FontAwesomeIcons.instagram, size: 25,),
                    Expanded(child: Center(child: Text('Tap to Contact', style: TextStyle(fontSize: 16, color: isDarkTheme?Colors.grey:Colors.grey[800]),))),

                  ],),
                ),
              ),

              SizedBox(height: 5,),

              Container(
                decoration: BoxDecoration(
                  color: isDarkTheme?Colors.grey[800]:HexColor('ffffff'),
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20,top: 15,bottom: 15),
                  child: Row(children: [
                    Icon(FontAwesomeIcons.line, size: 25,),
                    Expanded(child: Center(child: Text('Tap to Contact', style: TextStyle(fontSize: 16, color: isDarkTheme?Colors.grey:Colors.grey[800]),))),

                  ],),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
