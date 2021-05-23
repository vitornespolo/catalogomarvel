import 'dart:convert';

import 'commic_sumary.dart';

class EventList {
  int available;
  int returned;
  String collectionURI;
  List<ComicSummary> items;

  EventList({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      'available': available,
      'returned': returned,
      'collectionURI': collectionURI,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory EventList.fromMap(Map<String, dynamic> map) {
    return EventList(
      available: map['available'],
      returned: map['returned'],
      collectionURI: map['collectionURI'],
      items: List<ComicSummary>.from(
          map['items']?.map((x) => ComicSummary.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventList.fromJson(String source) =>
      EventList.fromMap(json.decode(source));
}
