// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';
import 'package:tqniaapp/Core/constans/const.dart';

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

Map<DateTime, List<Event>> kEventSource() {
  print(METTINGS!.data!.meeting!.length);
  Map<DateTime, List<Event>>? k;
  METTINGS!.data!.meeting!.forEach((element) {
    // print(element.date.substring(8,10));
    int year = int.parse(element.startDate!.substring(0, 4));
    int month = int.parse(element.startDate!.substring(5, 7));
    int day = int.parse(element.startDate!.substring(8, 10));
    k![DateTime(
      year,
      month,
      day,
    )] = k[DateTime(
              year,
              month,
              day,
            )] !=
            null
        ? [
            ...?k[DateTime(
              year,
              month,
              day,
            )],
          ]
        : [Event(element.title!)];
  });

  return k!
    ..addAll({
      kToday: [
        const Event('Today\'s '),
        const Event('Today\'s '),
      ],
    });
}

final _kEventSource = {
  for (var item in List.generate(50, (index) => index))
    DateTime.utc(kFirstDay.year, kFirstDay.month): List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}'))
}..addAll({
    kToday: [
      const Event('Today\'s '),
      const Event('Today\'s '),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
