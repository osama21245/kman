// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:kman/core/class/reservisionParameters.dart';
import 'package:kman/featuers/play/controller/play_controller.dart';
import 'package:kman/models/reserved_model.dart';

import '../../../core/common/booking_dataTime_converted.dart';
import '../../../core/common/button.dart';
import '../../../core/common/error_text.dart';
import '../../../core/common/loader.dart';

class ReservisionScreen extends ConsumerStatefulWidget {
  String collection;
  String groundId;
  ReservisionScreen({
    required this.collection,
    required this.groundId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookingScreenState();
}

class _BookingScreenState extends ConsumerState<ReservisionScreen> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _dateSelected = false;
  bool _timeSelected = false;
  ReserveModel? reserveModel;
  String? day;
  @override
  void initState() {
    day = DateConverted.getDate(_currentDay);
    super.initState();
  }

  void reservision(
      WidgetRef ref, BuildContext context, ReserveModel reserveModel) {
    ref
        .watch(playControllerProvider.notifier)
        .reserve(widget.groundId, context, widget.collection, reserveModel);
  }

  @override
  Widget build(BuildContext context) {
    ReservationsParams reservationsParams =
        ReservationsParams(widget.collection, widget.groundId, day!);

    return Scaffold(
      appBar: AppBar(
        title: Text("booking"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                _tableCalender(),
                Center(
                  child: Text(
                    "Select Reservision Date",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          ref.watch(getreservisionsProvider(reservationsParams)).when(
              data: (reservision) {
                return SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final reservisions = reservision[index];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            reserveModel = reservisions;
                            _currentIndex = index;
                            _timeSelected = true;
                            day = DateConverted.getDate(_currentDay);
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _currentIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            color: _currentIndex == index
                                ? Colors.lightBlue
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${reservisions.time}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  _currentIndex == index ? Colors.white : null,
                            ),
                          ),
                        ),
                      );
                    }, childCount: reservision.length),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, childAspectRatio: 1.5));
              },
              error: (error, StackTrace) {
                print(error);

                return ErrorText(error: error.toString());
              },
              loading: () => const Loader()),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
              child: Button(
                width: double.infinity,
                title: 'Make Appointment',
                onPressed: () async {
                  final getDate = DateConverted.getDate(_currentDay);
                  final getTime = DateConverted.getTime(_currentIndex!);

                  reservision(ref, context, reserveModel!);
                },
                disable: _timeSelected && _dateSelected ? false : true,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _tableCalender() {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: DateTime.now(),
      lastDay: DateTime.utc(2024, 12, 31),
      calendarFormat: _format,
      currentDay: _currentDay,
      calendarStyle: const CalendarStyle(
        todayDecoration:
            BoxDecoration(color: Colors.lightBlue, shape: BoxShape.circle),
      ),
      availableCalendarFormats: const {CalendarFormat.month: "Month"},
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusedDay = focusedDay;
          _dateSelected = true;
        });
      },
    );
  }
}
