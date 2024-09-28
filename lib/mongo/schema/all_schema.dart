



import 'package:realm/realm.dart';
part 'all_schema.realm.dart';

@RealmModel()
class _Book {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;
  late DateTime date;
  late String court;
  late String start;
  late String end;
  late int startHour;
  late bool status;
  @MapTo('usernameID')
  late ObjectId usernameId;
  @MapTo('orderID')
  late ObjectId orderId;
}

@RealmModel()
class _Court{
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;
  late String name;
  @MapTo('dateID')
  late ObjectId date;
}

@RealmModel()
class _Item{
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;
  late String name;

}

@RealmModel()
class _DateList{
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;
  late DateTime date;
  late bool status;

}

@RealmModel()
class _Order {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;
  late List<String> items;
  late String orderStatus;
  @MapTo('usernameID')
  late ObjectId usernameId;

  late DateTime createdAt;
}


@RealmModel()
class _Playtime {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;
  late String start;
  late String end;
  late int status;
  late int price;
  late DateTime date;
  late int startHour;
  @MapTo('courtID')
  late ObjectId courtId;

}

@RealmModel()
class _Event {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;
  late int type;
  late List<int> playtime;
  late String day;
  late DateTime onetime;
  late int price;
  late DateTime createdAt;
}

