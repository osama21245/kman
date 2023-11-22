import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/error_text.dart';
import '../../../core/common/loader.dart';
import '../controller/play_controller.dart';

class PlayHomeScreen extends ConsumerStatefulWidget {
  final String? collection;
  const PlayHomeScreen({super.key, this.collection});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayHomeScreenState();
}

Alignment _alignment = Alignment.centerLeft;
FilterStatus status = FilterStatus.upcoming; //initial status

enum FilterStatus { upcoming, complete, cancel }

class _PlayHomeScreenState extends ConsumerState<PlayHomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> schedules = [];
    return Scaffold(
      body: SafeArea(
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
                      width: 160,
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
              ref.watch(getGroundsProvider(widget.collection!)).when(
                  data: (ground) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: ground.length,
                        itemBuilder: ((context, index) {
                          final grounds = ground[index];

                          return Card(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ListTile(
                                title: Text("${grounds.name}"),
                              ));
                        }),
                      ),
                    );
                  },
                  error: (error, StackTrace) {
                    print(error);

                    return ErrorText(error: error.toString());
                  },
                  loading: () => const Loader())
            ],
          ),
        ),
      ),
    );
  }
}
//starting files