import 'package:baca_mongo/mongo/schema/all_schema.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

class DataService extends ChangeNotifier {
  final app = App(AppConfiguration("application-1-rckhlho"));
  late Realm realm;

  Future<List<Map<String, dynamic>>> fetchAllCourtData(DateTime startDate) async {
    User? user = app.currentUser;

    if (user == null) {
      await app.logIn(Credentials.anonymous());
      user = app.currentUser;
    }

    realm = Realm(Configuration.flexibleSync(user!, [DateList.schema, Court.schema, Playtime.schema]));
    final DateTime truncatedStartDate = DateTime.utc(startDate.year, startDate.month, startDate.day);

    final DateTime endDate = truncatedStartDate.add(Duration(days: 0));

    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(
        realm.all<DateList>().query('date >= \$0 AND date <= \$1', [truncatedStartDate, endDate]),
      );
    });

    await realm.subscriptions.waitForSynchronization();

    var dates = realm.query<DateList>(
      'date >= \$0 AND date <= \$1',
      [truncatedStartDate, endDate],
    );
    print('data diambil');
    print('${truncatedStartDate}');


    if (dates.isEmpty) {
      print('data kosong');

      await CreateNewData(truncatedStartDate);
      print('data baru dibuat');
      print('${truncatedStartDate}');

      dates = realm.query<DateList>(
        'date >= \$0 AND date <= \$1',
        [truncatedStartDate, endDate],
      );

    }

    final List<ObjectId> dateIds = dates.map((date) => date.id).toList();
    print(dateIds);
    String courtQuery = '';
    for (int i = 0; i < dateIds.length; i++) {
      courtQuery += 'date == \$${i}';
      if (i < dateIds.length - 1) {
        courtQuery += ' OR ';
      }
    }
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(
        realm.all<Court>().query(courtQuery, dateIds),
      );
    });
    await realm.subscriptions.waitForSynchronization();
    final courts = realm.query<Court>(
      courtQuery,
      dateIds,
    );
    final List<Map<String, dynamic>> result = courts.map((court) {
      return {
        'courtId': court.id,
        'courtName': court.name,
      };
    }).toList();
    for (var court in result) {
      final courtId = court['courtId'] as ObjectId;
      realm.subscriptions.update((mutableSubscriptions) {
        mutableSubscriptions.add(
          realm.all<Playtime>().query('courtID == \$0', [courtId]),
        );
      });
    }
    await realm.subscriptions.waitForSynchronization();
    return result;
  }
  void dispose() {
    realm.close();
  }
  Future<void> CreateNewData(DateTime dates) async{
    User? user = app.currentUser;

    print(dates);
    if (user == null) {
      await app.logIn(Credentials.anonymous());
      user = app.currentUser;
    }
    realm = Realm(Configuration.flexibleSync(user!, [DateList.schema, Court.schema, Playtime.schema]));
    final datelistId = ObjectId();

    final courtIds = List.generate(3, (_) => ObjectId());
    final playtimeIds = List.generate(3 * 12, (_) => ObjectId());
    final listcourt = ["A", "B", "C"];
    final startHour = ["08.00", "09.00", "10.00","11.00", "12.00", "13.00","14.00", "15.00", "16.00","17.00", "18.00", "19.00"];
    final endHour = [ "09.00", "10.00","11.00", "12.00", "13.00","14.00", "15.00", "16.00","17.00", "18.00", "19.00", "20.00"];
    final hourstart = [8,9,10,11,12,13,14,15,16,17,18,19];

    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm.all<DateList>());
      mutableSubscriptions.add(realm.all<Court>());
      mutableSubscriptions.add(realm.all<Playtime>());
    });

    await realm.subscriptions.waitForSynchronization();

    final newdate = DateList(datelistId, dates, true);
    realm.write<DateList>(() => realm.add<DateList>(newdate));
    notifyListeners();

    for (var i = 0; i < courtIds.length; i++) {
      final court = Court(courtIds[i], listcourt[i], datelistId);
      realm.write<Court>(() => realm.add<Court>(court));
    }
    notifyListeners();

    for (var i = 0; i <courtIds.length; i++){
      for (var v = 0; v < 12; v++){
        final playtime = Playtime(playtimeIds[i * 12 + v], startHour[v], endHour[v], 1,40000, dates, hourstart[v], courtIds[i]);
        realm.write<Playtime>(() => realm.add<Playtime>(playtime));

      }
    }
    notifyListeners();

  }


}


extension DateTimeExtension on DateTime {
  bool isSameDate(DateTime other) {

    return this.year == other.year && this.month == other.month && this.day == this.day;
  }
}