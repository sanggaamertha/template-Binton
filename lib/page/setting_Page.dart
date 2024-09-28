import 'package:baca_mongo/menu/util/dev_contact.dart';
import 'package:baca_mongo/menu/util/rate_app.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as mbs;

import 'package:provider/provider.dart';

import '../menu/helper/theme_notifier.dart';
import '../menu/util/setting_page/togglewitharrow.dart';
import '../menu/util/setting_page/togglewithswitch.dart';

class settingPage extends StatefulWidget {
  settingPage({super.key});

  @override
  State<settingPage> createState() => _settingPageState();
}

class _settingPageState extends State<settingPage> {
  late bool statusnya = false;

  void statusChanged() {
    setState(() {
      statusnya = !statusnya;
    });
  }

  void openrateApp(){
    showDialog(context: context, builder: (context){
      return RateAppDialog();
      }
    );
  }
  void opendevContact(){
    showDialog(context: context, builder: (context){
      return devContact();
    }
    );
  }

  void settingPrice(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    double screenWidth = MediaQuery.of(context).size.height;
    mbs.showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: isDarkTheme?Colors.grey[900]:HexColor('f2f2f2'),
          borderRadius: BorderRadius.circular(10),


        ),
        height: screenWidth/1.16,

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 4,
                width: 70,
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children:[

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void howTo(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height;
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    mbs.showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: isDarkTheme?Colors.grey[900]:HexColor('f2f2f2'),
          borderRadius: BorderRadius.circular(10),
        ),
        height: screenWidth/1.15,

        child: Column(

          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 4,
                width: 70,
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children:[


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openSettingPrice() {


  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    bool darkmode = themeNotifier.isDarkMode;
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkTheme ? Colors.black : HexColor('f2f2f2'),
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 18),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Setting',
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: isDarkTheme ? Colors.white : Colors.black),
                      )
                    ],
                  ),
                  SizedBox(height: 35),
                  Column(
                    children: [
                      ToggleWithArrow(
                        icons: FontAwesomeIcons.sliders,
                        texts: 'Setting Price',
                        toDo: () => settingPrice(context), //begini karena menggunakan void yg berisi permintaan
                        sizeIcon: 20,
                      ),
                      spacer(),
                      ToggleWithArrow(
                        icons: FontAwesomeIcons.questionCircle,
                        texts: 'How To',
                        toDo: () => howTo(context),
                        sizeIcon: 22,
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'General',
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: isDarkTheme ? Colors.white : Colors.black),
                        ),
                      ),
                      spacer(),
                      ToggleWithSwitch(
                        icons: Icons.notifications_none,
                        texts: 'Notification',
                        onToggle: (value) {
                          setState(() {
                            statusnya = !statusnya;
                          });
                        },
                        status: statusnya,
                        sizeIcon: 23,
                      ),
                      spacer(),
                      ToggleWithSwitch(
                        icons: darkmode
                            ? FontAwesomeIcons.sun
                            : FontAwesomeIcons.moon,
                        texts: darkmode ? 'Light Mode' : 'Dark Mode',
                        onToggle: (value) {
                          themeNotifier.toggleTheme();
                        },
                        status: darkmode,
                        sizeIcon: 21,
                      ),
                      spacer(),
                      ToggleWithArrow(
                        icons: FontAwesomeIcons.star,
                        texts: 'Rate App',
                        toDo: openrateApp,
                        sizeIcon: 21,
                      ),
                      spacer(),
                      ToggleWithArrow(
                        icons: FontAwesomeIcons.whatsapp,
                        texts: 'Developer Contact',
                        toDo: opendevContact,
                        sizeIcon: 21,
                      ),


                      SizedBox(height: 30,),

                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'Account',
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: isDarkTheme ? Colors.white : Colors.black),
                        ),
                      ),
                      ToggleWithArrow(
                          icons: FontAwesomeIcons.key,
                          texts: 'Change Password',
                          toDo: opendevContact,
                          sizeIcon: 19),
                      spacer(),

                      ToggleWithArrow(
                          icons: FontAwesomeIcons.signOut,
                          texts: 'Log Out',
                          toDo: opendevContact,
                          sizeIcon: 20),


                      
                      

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget spacer(){
    return SizedBox(height: 3,);
  }
}

