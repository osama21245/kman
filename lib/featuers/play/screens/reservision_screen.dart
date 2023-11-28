// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:kman/core/class/reservisionParameters.dart';
import 'package:kman/featuers/play/controller/play_controller.dart';
import 'package:kman/models/reserved_model.dart';

import '../../../core/common/booking_dataTime_converted.dart';
import '../../../core/common/button.dart';
import '../../../core/common/error_text.dart';
import '../../../core/common/loader.dart';

class ReservisionScreen extends ConsumerStatefulWidget {
  final String? collection;
  final String? groundId;
  final dynamic color;

  ReservisionScreen({this.collection, this.groundId, this.color});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ReservisionScreenState();
}

class _ReservisionScreenState extends ConsumerState<ReservisionScreen> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _dateSelected = false;
  bool _timeSelected = false;
  ReserveModel? reserveModel;
  ReservationsParams? reservationsParams;
  bool iscomplete = true;
  String? day;

  @override
  void initState() {
    day = DateConverted.getDate(_currentDay);
    reservationsParams =
        ReservationsParams(widget.collection!, widget.groundId!, day!);
    super.initState();
  }

  void reservision(
    WidgetRef ref,
    BuildContext context,
    ReserveModel reserveModel,
  ) {
    ref
        .watch(playControllerProvider.notifier)
        .reserve(widget.groundId!, context, widget.collection!, reserveModel);
  }

  void joinGame(WidgetRef ref, BuildContext context, String reserveId) {
    ref
        .watch(playControllerProvider.notifier)
        .joinGame(widget.collection!, widget.groundId!, reserveId, context);
  }

  void leaveGame(WidgetRef ref, BuildContext context, String reserveId) {
    ref
        .watch(playControllerProvider.notifier)
        .joinGame(widget.collection!, widget.groundId!, reserveId, context);
  }

  @override
  Widget build(BuildContext context) {
    final String userId = "";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Reservision",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                _tableCalendar(),
                Center(
                  child: Text(
                    "Select Reservation Date",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          _buildReservationsList(),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
              child: Button(
                width: double.infinity,
                color: widget.color,
                title: iscomplete
                    ? 'Make Appointment'
                    : reserveModel!.collaborations.contains(userId)
                        ? "Leave"
                        : "Join",
                onPressed: () {
                  final getDate = DateConverted.getDate(_currentDay);
                  final getTime = DateConverted.getTime(_currentIndex!);

                  if (_timeSelected && _dateSelected) {
                    if (reserveModel!.collaborations.contains(userId) &&
                        reserveModel!.iscomplete == "false") {
                      leaveGame(ref, context, reserveModel!.id);
                    } else if (!reserveModel!.collaborations.contains(userId) &&
                        reserveModel!.iscomplete == "false") {
                      joinGame(ref, context, reserveModel!.id);
                    } else {
                      reservision(ref, context, reserveModel!);
                    }
                  }
                },
                disable: !(_timeSelected && _dateSelected),
              ),
            ),
          )
        ],
      ),
    );
  }

  //***************************************************** */

  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: DateTime.now(),
      lastDay: DateTime.utc(2024, 12, 31),
      calendarFormat: _format,
      currentDay: _currentDay,
      calendarStyle: CalendarStyle(
        todayDecoration:
            BoxDecoration(color: widget.color, shape: BoxShape.circle),
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
          day = DateConverted.getDate(_currentDay);
          reservationsParams =
              ReservationsParams(widget.collection!, widget.groundId!, day!);
        });
      },
    );
  }
  //***************************************************** */

  Widget _buildReservationsList() {
    return ref.watch(getreservisionsProvider(reservationsParams!)).when(
          data: (reservations) {
            return SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final reservation = reservations[index];
                  return _buildReservationItem(reservation, index);
                },
                childCount: reservations.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.5,
              ),
            );
          },
          error: (error, StackTrace) {
            print(error);
            return SliverToBoxAdapter(
              child: ErrorText(error: error.toString()),
            );
          },
          loading: () => const SliverToBoxAdapter(
            child: Loader(),
          ),
        );
  }
  //***************************************************** */

  Widget _buildReservationItem(ReserveModel reservation, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          if (reservation.iscomplete) {
            reserveModel = reservation;
            _currentIndex = index;
            _timeSelected = true;
            iscomplete = true;
          } else {
            reserveModel = reservation;
            _currentIndex = index;
            _timeSelected = true;
            iscomplete = false;
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
            color: _currentIndex == index ? Colors.white : Colors.black,
          ),
          borderRadius: BorderRadius.circular(15),
          color: _currentIndex == index
              ? widget.color
              : !reservation.iscomplete
                  ? Color.fromARGB(96, 158, 158, 158)
                  : null,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${reservation.time}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _currentIndex == index ? Colors.white : null,
              ),
            ),
            if (!reservation.iscomplete)
              Text(
                '${reservation.collaborations.length} Join',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _currentIndex == index ? Colors.white : null,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
