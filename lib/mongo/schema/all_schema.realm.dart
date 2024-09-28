// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_schema.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Book extends _Book with RealmEntity, RealmObjectBase, RealmObject {
Book(
ObjectId id,
DateTime date,
String court,
String start,
String end,
int startHour,
bool status,
ObjectId usernameId,
ObjectId orderId,
) {
RealmObjectBase.set(this, '_id', id);
RealmObjectBase.set(this, 'date', date);
RealmObjectBase.set(this, 'court', court);
RealmObjectBase.set(this, 'start', start);
RealmObjectBase.set(this, 'end', end);
RealmObjectBase.set(this, 'startHour', startHour);
RealmObjectBase.set(this, 'status', status);
RealmObjectBase.set(this, 'usernameID', usernameId);
RealmObjectBase.set(this, 'orderID', orderId);
}

Book._();

@override
ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
@override
set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

@override
DateTime get date => RealmObjectBase.get<DateTime>(this, 'date') as DateTime;
@override
set date(DateTime value) => RealmObjectBase.set(this, 'date', value);

@override
String get court => RealmObjectBase.get<String>(this, 'court') as String;
@override
set court(String value) => RealmObjectBase.set(this, 'court', value);

@override
String get start => RealmObjectBase.get<String>(this, 'start') as String;
@override
set start(String value) => RealmObjectBase.set(this, 'start', value);

@override
String get end => RealmObjectBase.get<String>(this, 'end') as String;
@override
set end(String value) => RealmObjectBase.set(this, 'end', value);

@override
int get startHour => RealmObjectBase.get<int>(this, 'startHour') as int;
@override
set startHour(int value) => RealmObjectBase.set(this, 'startHour', value);

@override
bool get status => RealmObjectBase.get<bool>(this, 'status') as bool;
@override
set status(bool value) => RealmObjectBase.set(this, 'status', value);

@override
ObjectId get usernameId => RealmObjectBase.get<ObjectId>(this, 'usernameID') as ObjectId;
@override
set usernameId(ObjectId value) => RealmObjectBase.set(this, 'usernameID', value);

@override
ObjectId get orderId => RealmObjectBase.get<ObjectId>(this, 'orderID') as ObjectId;
@override
set orderId(ObjectId value) => RealmObjectBase.set(this, 'orderID', value);

@override
Stream<RealmObjectChanges<Book>> get changes => RealmObjectBase.getChanges<Book>(this);

@override
Stream<RealmObjectChanges<Book>> changesFor([List<String>? keyPaths]) => RealmObjectBase.getChangesFor<Book>(this, keyPaths);

@override
Book freeze() => RealmObjectBase.freezeObject<Book>(this);

EJsonValue toEJson() {
return <String, dynamic>{
'_id': id.toEJson(),
'date': date.toEJson(),
'court': court.toEJson(),
'start': start.toEJson(),
'end': end.toEJson(),
'startHour': startHour.toEJson(),
'status': status.toEJson(),
'usernameID': usernameId.toEJson(),
'orderID': orderId.toEJson(),
};
}
static EJsonValue _toEJson(Book value) => value.toEJson();
static Book _fromEJson(EJsonValue ejson) {
return switch (ejson) {
{
'_id': EJsonValue id,
'date': EJsonValue date,
'court': EJsonValue court,
'start': EJsonValue start,
'end': EJsonValue end,
'startHour': EJsonValue startHour,
'status': EJsonValue status,
'usernameID': EJsonValue usernameId,
'orderID': EJsonValue orderId,
} => Book(
fromEJson(id),
fromEJson(date),
fromEJson(court),
fromEJson(start),
fromEJson(end),
fromEJson(startHour),
fromEJson(status),
fromEJson(usernameId),
fromEJson(orderId),
),
_ => raiseInvalidEJson(ejson),
};
}
static final schema = () {
RealmObjectBase.registerFactory(Book._);
register(_toEJson, _fromEJson);
return SchemaObject(ObjectType.realmObject, Book, 'Book', [
SchemaProperty('id', RealmPropertyType.objectid, mapTo: '_id',primaryKey: true),
SchemaProperty('date', RealmPropertyType.timestamp),
SchemaProperty('court', RealmPropertyType.string),
SchemaProperty('start', RealmPropertyType.string),
SchemaProperty('end', RealmPropertyType.string),
SchemaProperty('startHour', RealmPropertyType.int),
SchemaProperty('status', RealmPropertyType.bool),
SchemaProperty('usernameId', RealmPropertyType.objectid, mapTo: 'usernameID'),
SchemaProperty('orderId', RealmPropertyType.objectid, mapTo: 'orderID'),
]);
}();

@override
SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
class Court extends _Court with RealmEntity, RealmObjectBase, RealmObject {
Court(
ObjectId id,
String name,
ObjectId date,
) {
RealmObjectBase.set(this, '_id', id);
RealmObjectBase.set(this, 'name', name);
RealmObjectBase.set(this, 'dateID', date);
}

Court._();

@override
ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
@override
set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

@override
String get name => RealmObjectBase.get<String>(this, 'name') as String;
@override
set name(String value) => RealmObjectBase.set(this, 'name', value);

@override
ObjectId get date => RealmObjectBase.get<ObjectId>(this, 'dateID') as ObjectId;
@override
set date(ObjectId value) => RealmObjectBase.set(this, 'dateID', value);

@override
Stream<RealmObjectChanges<Court>> get changes => RealmObjectBase.getChanges<Court>(this);

@override
Stream<RealmObjectChanges<Court>> changesFor([List<String>? keyPaths]) => RealmObjectBase.getChangesFor<Court>(this, keyPaths);

@override
Court freeze() => RealmObjectBase.freezeObject<Court>(this);

EJsonValue toEJson() {
return <String, dynamic>{
'_id': id.toEJson(),
'name': name.toEJson(),
'dateID': date.toEJson(),
};
}
static EJsonValue _toEJson(Court value) => value.toEJson();
static Court _fromEJson(EJsonValue ejson) {
return switch (ejson) {
{
'_id': EJsonValue id,
'name': EJsonValue name,
'dateID': EJsonValue date,
} => Court(
fromEJson(id),
fromEJson(name),
fromEJson(date),
),
_ => raiseInvalidEJson(ejson),
};
}
static final schema = () {
RealmObjectBase.registerFactory(Court._);
register(_toEJson, _fromEJson);
return SchemaObject(ObjectType.realmObject, Court, 'Court', [
SchemaProperty('id', RealmPropertyType.objectid, mapTo: '_id',primaryKey: true),
SchemaProperty('name', RealmPropertyType.string),
SchemaProperty('date', RealmPropertyType.objectid, mapTo: 'dateID'),
]);
}();

@override
SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
class Item extends _Item with RealmEntity, RealmObjectBase, RealmObject {
Item(
ObjectId id,
String name,
) {
RealmObjectBase.set(this, '_id', id);
RealmObjectBase.set(this, 'name', name);
}

Item._();

@override
ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
@override
set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

@override
String get name => RealmObjectBase.get<String>(this, 'name') as String;
@override
set name(String value) => RealmObjectBase.set(this, 'name', value);

@override
Stream<RealmObjectChanges<Item>> get changes => RealmObjectBase.getChanges<Item>(this);

@override
Stream<RealmObjectChanges<Item>> changesFor([List<String>? keyPaths]) => RealmObjectBase.getChangesFor<Item>(this, keyPaths);

@override
Item freeze() => RealmObjectBase.freezeObject<Item>(this);

EJsonValue toEJson() {
return <String, dynamic>{
'_id': id.toEJson(),
'name': name.toEJson(),
};
}
static EJsonValue _toEJson(Item value) => value.toEJson();
static Item _fromEJson(EJsonValue ejson) {
return switch (ejson) {
{
'_id': EJsonValue id,
'name': EJsonValue name,
} => Item(
fromEJson(id),
fromEJson(name),
),
_ => raiseInvalidEJson(ejson),
};
}
static final schema = () {
RealmObjectBase.registerFactory(Item._);
register(_toEJson, _fromEJson);
return SchemaObject(ObjectType.realmObject, Item, 'Item', [
SchemaProperty('id', RealmPropertyType.objectid, mapTo: '_id',primaryKey: true),
SchemaProperty('name', RealmPropertyType.string),
]);
}();

@override
SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
class DateList extends _DateList with RealmEntity, RealmObjectBase, RealmObject {
DateList(
ObjectId id,
DateTime date,
bool status,
) {
RealmObjectBase.set(this, '_id', id);
RealmObjectBase.set(this, 'date', date);
RealmObjectBase.set(this, 'status', status);
}

DateList._();

@override
ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
@override
set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

@override
DateTime get date => RealmObjectBase.get<DateTime>(this, 'date') as DateTime;
@override
set date(DateTime value) => RealmObjectBase.set(this, 'date', value);

@override
bool get status => RealmObjectBase.get<bool>(this, 'status') as bool;
@override
set status(bool value) => RealmObjectBase.set(this, 'status', value);

@override
Stream<RealmObjectChanges<DateList>> get changes => RealmObjectBase.getChanges<DateList>(this);

@override
Stream<RealmObjectChanges<DateList>> changesFor([List<String>? keyPaths]) => RealmObjectBase.getChangesFor<DateList>(this, keyPaths);

@override
DateList freeze() => RealmObjectBase.freezeObject<DateList>(this);

EJsonValue toEJson() {
return <String, dynamic>{
'_id': id.toEJson(),
'date': date.toEJson(),
'status': status.toEJson(),
};
}
static EJsonValue _toEJson(DateList value) => value.toEJson();
static DateList _fromEJson(EJsonValue ejson) {
return switch (ejson) {
{
'_id': EJsonValue id,
'date': EJsonValue date,
'status': EJsonValue status,
} => DateList(
fromEJson(id),
fromEJson(date),
fromEJson(status),
),
_ => raiseInvalidEJson(ejson),
};
}
static final schema = () {
RealmObjectBase.registerFactory(DateList._);
register(_toEJson, _fromEJson);
return SchemaObject(ObjectType.realmObject, DateList, 'DateList', [
SchemaProperty('id', RealmPropertyType.objectid, mapTo: '_id',primaryKey: true),
SchemaProperty('date', RealmPropertyType.timestamp),
SchemaProperty('status', RealmPropertyType.bool),
]);
}();

@override
SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
class Order extends _Order with RealmEntity, RealmObjectBase, RealmObject {
Order(
ObjectId id,
String orderStatus,
ObjectId usernameId,
DateTime createdAt,
{
Iterable<String> items = const [],
}
) {
RealmObjectBase.set(this, '_id', id);
RealmObjectBase.set<RealmList<String>>(this, 'items', RealmList<String>(items));
RealmObjectBase.set(this, 'orderStatus', orderStatus);
RealmObjectBase.set(this, 'usernameID', usernameId);
RealmObjectBase.set(this, 'createdAt', createdAt);
}

Order._();

@override
ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
@override
set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

@override
RealmList<String> get items => RealmObjectBase.get<String>(this, 'items') as RealmList<String>;
@override
set items(covariant RealmList<String> value) => throw RealmUnsupportedSetError();

@override
String get orderStatus => RealmObjectBase.get<String>(this, 'orderStatus') as String;
@override
set orderStatus(String value) => RealmObjectBase.set(this, 'orderStatus', value);

@override
ObjectId get usernameId => RealmObjectBase.get<ObjectId>(this, 'usernameID') as ObjectId;
@override
set usernameId(ObjectId value) => RealmObjectBase.set(this, 'usernameID', value);

@override
DateTime get createdAt => RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
@override
set createdAt(DateTime value) => RealmObjectBase.set(this, 'createdAt', value);

@override
Stream<RealmObjectChanges<Order>> get changes => RealmObjectBase.getChanges<Order>(this);

@override
Stream<RealmObjectChanges<Order>> changesFor([List<String>? keyPaths]) => RealmObjectBase.getChangesFor<Order>(this, keyPaths);

@override
Order freeze() => RealmObjectBase.freezeObject<Order>(this);

EJsonValue toEJson() {
return <String, dynamic>{
'_id': id.toEJson(),
'items': items.toEJson(),
'orderStatus': orderStatus.toEJson(),
'usernameID': usernameId.toEJson(),
'createdAt': createdAt.toEJson(),
};
}
static EJsonValue _toEJson(Order value) => value.toEJson();
static Order _fromEJson(EJsonValue ejson) {
return switch (ejson) {
{
'_id': EJsonValue id,
'items': EJsonValue items,
'orderStatus': EJsonValue orderStatus,
'usernameID': EJsonValue usernameId,
'createdAt': EJsonValue createdAt,
} => Order(
fromEJson(id),
fromEJson(orderStatus),
fromEJson(usernameId),
fromEJson(createdAt),
items: fromEJson(items),
),
_ => raiseInvalidEJson(ejson),
};
}
static final schema = () {
RealmObjectBase.registerFactory(Order._);
register(_toEJson, _fromEJson);
return SchemaObject(ObjectType.realmObject, Order, 'Order', [
SchemaProperty('id', RealmPropertyType.objectid, mapTo: '_id',primaryKey: true),
SchemaProperty('items', RealmPropertyType.string, collectionType: RealmCollectionType.list),
SchemaProperty('orderStatus', RealmPropertyType.string),
SchemaProperty('usernameId', RealmPropertyType.objectid, mapTo: 'usernameID'),
SchemaProperty('createdAt', RealmPropertyType.timestamp),
]);
}();

@override
SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
class Playtime extends _Playtime with RealmEntity, RealmObjectBase, RealmObject {
Playtime(
ObjectId id,
String start,
String end,
int status,
int price,
DateTime date,
int startHour,
ObjectId courtId,
) {
RealmObjectBase.set(this, '_id', id);
RealmObjectBase.set(this, 'start', start);
RealmObjectBase.set(this, 'end', end);
RealmObjectBase.set(this, 'status', status);
RealmObjectBase.set(this, 'price', price);
RealmObjectBase.set(this, 'date', date);
RealmObjectBase.set(this, 'startHour', startHour);
RealmObjectBase.set(this, 'courtID', courtId);
}

Playtime._();

@override
ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
@override
set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

@override
String get start => RealmObjectBase.get<String>(this, 'start') as String;
@override
set start(String value) => RealmObjectBase.set(this, 'start', value);

@override
String get end => RealmObjectBase.get<String>(this, 'end') as String;
@override
set end(String value) => RealmObjectBase.set(this, 'end', value);

@override
int get status => RealmObjectBase.get<int>(this, 'status') as int;
@override
set status(int value) => RealmObjectBase.set(this, 'status', value);

@override
int get price => RealmObjectBase.get<int>(this, 'price') as int;
@override
set price(int value) => RealmObjectBase.set(this, 'price', value);

@override
DateTime get date => RealmObjectBase.get<DateTime>(this, 'date') as DateTime;
@override
set date(DateTime value) => RealmObjectBase.set(this, 'date', value);

@override
int get startHour => RealmObjectBase.get<int>(this, 'startHour') as int;
@override
set startHour(int value) => RealmObjectBase.set(this, 'startHour', value);

@override
ObjectId get courtId => RealmObjectBase.get<ObjectId>(this, 'courtID') as ObjectId;
@override
set courtId(ObjectId value) => RealmObjectBase.set(this, 'courtID', value);

@override
Stream<RealmObjectChanges<Playtime>> get changes => RealmObjectBase.getChanges<Playtime>(this);

@override
Stream<RealmObjectChanges<Playtime>> changesFor([List<String>? keyPaths]) => RealmObjectBase.getChangesFor<Playtime>(this, keyPaths);

@override
Playtime freeze() => RealmObjectBase.freezeObject<Playtime>(this);

EJsonValue toEJson() {
return <String, dynamic>{
'_id': id.toEJson(),
'start': start.toEJson(),
'end': end.toEJson(),
'status': status.toEJson(),
'price': price.toEJson(),
'date': date.toEJson(),
'startHour': startHour.toEJson(),
'courtID': courtId.toEJson(),
};
}
static EJsonValue _toEJson(Playtime value) => value.toEJson();
static Playtime _fromEJson(EJsonValue ejson) {
return switch (ejson) {
{
'_id': EJsonValue id,
'start': EJsonValue start,
'end': EJsonValue end,
'status': EJsonValue status,
'price': EJsonValue price,
'date': EJsonValue date,
'startHour': EJsonValue startHour,
'courtID': EJsonValue courtId,
} => Playtime(
fromEJson(id),
fromEJson(start),
fromEJson(end),
fromEJson(status),
fromEJson(price),
fromEJson(date),
fromEJson(startHour),
fromEJson(courtId),
),
_ => raiseInvalidEJson(ejson),
};
}
static final schema = () {
RealmObjectBase.registerFactory(Playtime._);
register(_toEJson, _fromEJson);
return SchemaObject(ObjectType.realmObject, Playtime, 'Playtime', [
SchemaProperty('id', RealmPropertyType.objectid, mapTo: '_id',primaryKey: true),
SchemaProperty('start', RealmPropertyType.string),
SchemaProperty('end', RealmPropertyType.string),
SchemaProperty('status', RealmPropertyType.int),
SchemaProperty('price', RealmPropertyType.int),
SchemaProperty('date', RealmPropertyType.timestamp),
SchemaProperty('startHour', RealmPropertyType.int),
SchemaProperty('courtId', RealmPropertyType.objectid, mapTo: 'courtID'),
]);
}();

@override
SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
class Event extends _Event with RealmEntity, RealmObjectBase, RealmObject {
Event(
ObjectId id,
int type,
String day,
DateTime onetime,
int price,
DateTime createdAt,
{
Iterable<int> playtime = const [],
}
) {
RealmObjectBase.set(this, '_id', id);
RealmObjectBase.set(this, 'type', type);
RealmObjectBase.set<RealmList<int>>(this, 'playtime', RealmList<int>(playtime));
RealmObjectBase.set(this, 'day', day);
RealmObjectBase.set(this, 'onetime', onetime);
RealmObjectBase.set(this, 'price', price);
RealmObjectBase.set(this, 'createdAt', createdAt);
}

Event._();

@override
ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
@override
set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

@override
int get type => RealmObjectBase.get<int>(this, 'type') as int;
@override
set type(int value) => RealmObjectBase.set(this, 'type', value);

@override
RealmList<int> get playtime => RealmObjectBase.get<int>(this, 'playtime') as RealmList<int>;
@override
set playtime(covariant RealmList<int> value) => throw RealmUnsupportedSetError();

@override
String get day => RealmObjectBase.get<String>(this, 'day') as String;
@override
set day(String value) => RealmObjectBase.set(this, 'day', value);

@override
DateTime get onetime => RealmObjectBase.get<DateTime>(this, 'onetime') as DateTime;
@override
set onetime(DateTime value) => RealmObjectBase.set(this, 'onetime', value);

@override
int get price => RealmObjectBase.get<int>(this, 'price') as int;
@override
set price(int value) => RealmObjectBase.set(this, 'price', value);

@override
DateTime get createdAt => RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
@override
set createdAt(DateTime value) => RealmObjectBase.set(this, 'createdAt', value);

@override
Stream<RealmObjectChanges<Event>> get changes => RealmObjectBase.getChanges<Event>(this);

@override
Stream<RealmObjectChanges<Event>> changesFor([List<String>? keyPaths]) => RealmObjectBase.getChangesFor<Event>(this, keyPaths);

@override
Event freeze() => RealmObjectBase.freezeObject<Event>(this);

EJsonValue toEJson() {
return <String, dynamic>{
'_id': id.toEJson(),
'type': type.toEJson(),
'playtime': playtime.toEJson(),
'day': day.toEJson(),
'onetime': onetime.toEJson(),
'price': price.toEJson(),
'createdAt': createdAt.toEJson(),
};
}
static EJsonValue _toEJson(Event value) => value.toEJson();
static Event _fromEJson(EJsonValue ejson) {
return switch (ejson) {
{
'_id': EJsonValue id,
'type': EJsonValue type,
'playtime': EJsonValue playtime,
'day': EJsonValue day,
'onetime': EJsonValue onetime,
'price': EJsonValue price,
'createdAt': EJsonValue createdAt,
} => Event(
fromEJson(id),
fromEJson(type),
fromEJson(day),
fromEJson(onetime),
fromEJson(price),
fromEJson(createdAt),
playtime: fromEJson(playtime),
),
_ => raiseInvalidEJson(ejson),
};
}
static final schema = () {
RealmObjectBase.registerFactory(Event._);
register(_toEJson, _fromEJson);
return SchemaObject(ObjectType.realmObject, Event, 'Event', [
SchemaProperty('id', RealmPropertyType.objectid, mapTo: '_id',primaryKey: true),
SchemaProperty('type', RealmPropertyType.int),
SchemaProperty('playtime', RealmPropertyType.int, collectionType: RealmCollectionType.list),
SchemaProperty('day', RealmPropertyType.string),
SchemaProperty('onetime', RealmPropertyType.timestamp),
SchemaProperty('price', RealmPropertyType.int),
SchemaProperty('createdAt', RealmPropertyType.timestamp),
]);
}();

@override
SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
