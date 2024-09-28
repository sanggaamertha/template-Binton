
import 'package:baca_mongo/menu/util/history_page/chart_history.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class historyPage extends StatefulWidget {
   historyPage({super.key});

  @override
  State<historyPage> createState() => _historyPageState();
}

class _historyPageState extends State<historyPage> {
  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkTheme ? Colors.black : HexColor('f2f2f2'),
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: Text("History", style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: isDarkTheme ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
        backgroundColor: isDarkTheme ? Colors.black : HexColor('f2f2f2'),
      body: SafeArea(

        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 8,right: 8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: GetChart(context),
                ),
                SizedBox(height: 25,),

                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Column(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Recent History',
                          style: TextStyle(color: isDarkTheme ? Colors.white : Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,),),

                        TextButton(
                          onPressed: (){

                            },
                          child: Text('View All', style: TextStyle(color: isDarkTheme ? Colors.grey[200] : Colors.grey[800], fontSize: 15 ),),
                        ),





                    ],),
                    SizedBox(height: 2,),

                    tesHistory(context, status: 'Lunas', nama: 'Satria', waktu: '15 Agustus 2024', harga: 'Rp.30.000,00'),
                    tesHistory(context, status: 'Lunas', nama: 'Wira dharma', waktu: '15 Agustus 2024', harga: 'Rp.60.000,00'),
                    tesHistory(context, status: 'Lunas', nama: 'PB Seraya', waktu: '15 Agustus 2024', harga: 'Rp.60.000,00'),
                    tesHistory(context, status: 'Lunas', nama: 'Ayu Savita', waktu: '15 Agustus 2024', harga: 'Rp.60.000,00'),


                  ],),
                ),



              ],

            ),
          ),
        ),
      )
    );
  }

  Widget GetChart(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 230,
      decoration: BoxDecoration(
        color: isDarkTheme ?Colors.grey[800] : HexColor('ffffff'),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 5,
            offset: Offset(2, 3),
          ),
        ],

      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10, left: 8, right: 8),
        child: LineChartWidget(),
      ),

    );
  }






  Widget tesHistory(BuildContext context, {required String status, required String nama, required String waktu, required String harga}) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Container(
        width: screenWidth,
        height: 80,
        decoration: BoxDecoration(
          color: isDarkTheme ? Colors.grey[900] : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: status == 'Lunas' ? Colors.green : Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(18),
                ),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Informasi utama di kiri atas
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      nama,  // Placeholder text
                      style: TextStyle(
                        color: isDarkTheme ? Colors.white : Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      waktu,  // Placeholder text
                      style: TextStyle(
                        color: isDarkTheme ? Colors.grey[500] : Colors.grey[800],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Align(
                    alignment: Alignment.centerRight,
                      child: Text(
                        harga,
                        style: TextStyle(
                          color: isDarkTheme ? Colors.grey[300] : Colors.grey[700],
                          fontSize: 13,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                              ),
                ))
          ],
        ),
      ),
    );
  }



}
