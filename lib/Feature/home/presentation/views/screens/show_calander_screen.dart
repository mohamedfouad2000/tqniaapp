// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Feature/home/data/model/metting_model/meeting.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/event_view_page.dart';

class TableMultiExample extends StatelessWidget {
  const TableMultiExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
          ),
        ),
      ),
      body: SfCalendar(
        view: CalendarView.week,
        showNavigationArrow: true,
        dataSource: _getCalendarDataSource(),
        onTap: (calendarTapDetails) {
          if (calendarTapDetails.appointments == null) return;
          final event = calendarTapDetails.appointments!.first;
          Meeting? model;

          if (METTINGS != null) {
            for (var element in METTINGS!.data!.meeting!) {
              if (int.parse(element.id!) == event.id) {
                model = element;

                break;
              }
            }
          }
          NavegatorPush(
              context, EventView(id: int.parse(model!.id.toString())));
        },
        firstDayOfWeek: 6,
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
        ),
        initialSelectedDate: DateTime(2020, 12, 20, 12),
      ),
    );
  }

  // List<EventsMet> _getDataSource() {
  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    METTINGS?.data?.meeting?.forEach((element) {
      DateTime exceptionDate = DateTime.now();
      appointments.add(
        Appointment(
          startTime:
              DateFormat("yyyy-MM-dd").parse(element.startDate ?? '2024-02-14'),
          endTime:
              DateFormat("yyyy-MM-dd").parse(element.endDate ?? '2024-02-14'),
          subject: element.title!.toString(),
          color: colorHex(element.color.toString()),
          id: int.parse(element.id.toString()),
          notes: element.title!.toString(),
          recurrenceExceptionDates: <DateTime>[exceptionDate],
        ),
      );
    });

    return _AppointmentDataSource(appointments);
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<EventsMet> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  Color getId(int index) {
    return appointments![index].id;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class EventsMet {
  EventsMet(this.eventName, this.from, this.to, this.background, this.isAllDay,
      this.id);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  int id;
}
