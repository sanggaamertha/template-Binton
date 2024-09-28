import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:baca_mongo/mongo/service/mongo_service.dart';
import 'package:baca_mongo/mongo/schema/all_schema.dart';
import 'package:realm/realm.dart' as real;

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  late Future<List<Map<String, dynamic>>> _futureCourts;
  late DataService _dataService;
  DateTime selectedDate = DateTime.now().toUtc();
  late DateTime datenya;
  final GlobalKey _calendarKey = GlobalKey();
  DateTime nows = DateTime.now().toUtc();
  late String calendar;
  late int available = 0;
  late int booked = 0;

  @override
  void initState() {
    super.initState();
    _dataService = Provider.of<DataService>(context, listen: false);
    _futureCourts = _dataService.fetchAllCourtData(DateTime.now().toUtc());
    calendar = DateFormat('EEEE, d MMM').format(nows);
  }

  Widget _buildDatePicker() {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(7, (index) {
          DateTime datew = DateTime.now().toUtc().add(Duration(days: index));
          bool isSelected = selectedDate.year == datew.year &&
              selectedDate.month == datew.month &&
              selectedDate.day == datew.day;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDate = datew;
                datenya = datew;
                _futureCourts = _dataService.fetchAllCourtData(datenya);
                calendar = DateFormat('EEEE, d MMM').format(datew);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 3, bottom: 5),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: isSelected
                      ? (isDarkTheme ? Colors.grey[700] : Colors.grey[500])
                      : (isDarkTheme ? Colors.grey[900] : Colors.white),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 5,
                      offset: Offset(5, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5, left: 6, right: 6),
                  child: Text(
                    DateFormat('EEE, d MMM').format(datew),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: isSelected
                          ? (isDarkTheme ? Colors.white : Colors.black)
                          : (isDarkTheme ? Colors.white70 : Colors.black87),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkTheme ? Colors.black : HexColor('f2f2f2'),
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 3),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
                  child: Image.asset(
                    'assets/images/shuttlecock.png',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              Text(
                "Bulutangkis",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.help_outline,
                  size: 30,
                  color: isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: isDarkTheme ? Colors.black : HexColor('f2f2f2'),
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 7, right: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildAnimatedContainer('Available', available, isDarkTheme),
                        SizedBox(width: 10),
                        _buildAnimatedContainer('Booked', booked, isDarkTheme)
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: _buildDatePicker(),
                      ),
                      SizedBox(height: 5),
                      listnya(context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedContainer(String label, int count, bool isDarkTheme) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isDarkTheme ? Colors.grey[800] : HexColor('ffffff'),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 5,
              offset: Offset(3, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '$count',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tes2(real.ObjectId courtId) {
    double screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<real.RealmResultsChanges<Playtime>>(
      stream: _dataService.realm.query<Playtime>('courtID == \$0', [courtId]).changes,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          print('StreamBuilder Error: ${snapshot.error}');
          return Text('Error: ${snapshot.error}');
        }
        final data = snapshot.data;

        if (data == null || data.results.isEmpty) {
          return Text('No data available');
        }
        final List<Playtime> result = data.results.toList();
        result.sort((a, b) => a.startHour.compareTo(b.startHour));
        return buildViewTable(result, context);
      },
    );
  }

  Widget listnya(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _futureCourts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No courts available.'));
        } else {
          final courtsData = snapshot.data!;
          courtsData.sort((a, b) => a.keys.first.compareTo(b.keys.first));
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                children: courtsData.map((courtData) {
                  final courtName = courtData['courtName'];
                  final courtId = courtData['courtId'];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenWidth / 3.7,
                        height: 50,
                        margin: EdgeInsets.all(4.0),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: HexColor('6DCB82'),
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 5,
                              offset: Offset(5, 6),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Lap $courtName',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: isDarkTheme ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      tes2(courtId),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildViewTable(List<Playtime> playtimes, BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: playtimes.map((playtime) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            width: screenWidth / 3.7,
            height: 50,
            margin: EdgeInsets.all(4.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: playtime.status == 0
                  ? (isDarkTheme ? Colors.grey[600] : Colors.grey[500])
                  : playtime.status == 2
                  ? (isDarkTheme ? Colors.green[600] : Colors.green[400])
                  : playtime.status == 4
                  ? (isDarkTheme ? Colors.grey[800] : Colors.grey[300])
                  : (isDarkTheme ? Colors.grey[900] : Colors.white),
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 5,
                  offset: Offset(2, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                '${playtime.start} - ${playtime.end}',
                style: TextStyle(
                  fontSize: 11,
                  color: isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
