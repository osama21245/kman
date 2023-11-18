import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FootballHomeScreen extends ConsumerStatefulWidget {
  const FootballHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FootballHomeScreenState();
}

enum FilterStatus { upcoming, complete, cancel }

class _FootballHomeScreenState extends ConsumerState<FootballHomeScreen> {
  @override
  Widget build(BuildContext context) {
    FilterStatus status = FilterStatus.upcoming; //initial status
    Alignment _alignment = Alignment.centerLeft;
    List<dynamic> schedules = [];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Appointment Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //this is the filter tabs
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterStatus.upcoming) {
                                  status = FilterStatus.upcoming;
                                  _alignment = Alignment.centerLeft;
                                } else if (filterStatus ==
                                    FilterStatus.complete) {
                                  status = FilterStatus.complete;
                                  _alignment = Alignment.center;
                                } else if (filterStatus ==
                                    FilterStatus.cancel) {
                                  status = FilterStatus.cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(
                              child: Text(filterStatus.name),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: filteredSchedules.length,
            //     itemBuilder: ((context, index) {
            //       var schedule = filteredSchedules[index];
            //       bool isLastElement = filteredSchedules.length + 1 == index;
            //       return Card(
            //         shape: RoundedRectangleBorder(
            //           side: const BorderSide(
            //             color: Colors.grey,
            //           ),
            //           borderRadius: BorderRadius.circular(20),
            //         ),
            //         margin: !isLastElement
            //             ? const EdgeInsets.only(bottom: 20)
            //             : EdgeInsets.zero,
            //         child: Padding(
            //           padding: const EdgeInsets.all(15),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.stretch,
            //             children: [
            //               Row(
            //                 children: [
            //                   CircleAvatar(
            //                     backgroundImage: NetworkImage(
            //                         "http://127.0.0.1:8000${schedule['doctor_profile']}"),
            //                   ),
            //                   const SizedBox(
            //                     width: 10,
            //                   ),
            //                   Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Text(
            //                         schedule['doctor_name'],
            //                         style: const TextStyle(
            //                           color: Colors.black,
            //                           fontWeight: FontWeight.w700,
            //                         ),
            //                       ),
            //                       const SizedBox(
            //                         height: 5,
            //                       ),
            //                       Text(
            //                         schedule['category'],
            //                         style: const TextStyle(
            //                           color: Colors.grey,
            //                           fontSize: 12,
            //                           fontWeight: FontWeight.w600,
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //               const SizedBox(
            //                 height: 15,
            //               ),
            //               ScheduleCard(
            //                 date: schedule['date'],
            //                 day: schedule['day'],
            //                 time: schedule['time'],
            //               ),
            //               const SizedBox(
            //                 height: 15,
            //               ),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Expanded(
            //                     child: OutlinedButton(
            //                       onPressed: () {},
            //                       child: const Text(
            //                         'Cancel',
            //                         style:
            //                             TextStyle(color: Config.primaryColor),
            //                       ),
            //                     ),
            //                   ),
            //                   const SizedBox(
            //                     width: 20,
            //                   ),
            //                   Expanded(
            //                     child: OutlinedButton(
            //                       style: OutlinedButton.styleFrom(
            //                         backgroundColor: Config.primaryColor,
            //                       ),
            //                       onPressed: () {},
            //                       child: const Text(
            //                         'Reschedule',
            //                         style: TextStyle(color: Colors.white),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ),
            //       );
            //     }),
            //   ),
            //  ),
          ],
        ),
      ),
    );
  }
}
//starting files