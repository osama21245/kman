import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:kman/booking_screen.dart';
import 'package:kman/core/common/getcolor.dart';
import 'package:kman/featuers/play/screens/reservision_screen.dart';
import 'package:kman/featuers/play/widget/play_home/custom_play_grident.dart';
import 'package:kman/theme/pallete.dart';

import '../../../core/common/error_text.dart';
import '../../../core/common/loader.dart';
import '../controller/play_controller.dart';
import '../widget/play_home/custom_get_grounds.dart';

class PlayHomeScreen extends ConsumerStatefulWidget {
  final String? collection;
  const PlayHomeScreen({super.key, this.collection});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayHomeScreenState();
}

Alignment _alignment = Alignment.centerLeft;
FilterStatus status = FilterStatus.reserve; //initial status

enum FilterStatus { reserve, ground }

class _PlayHomeScreenState extends ConsumerState<PlayHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final color = getColor(widget.collection!);
    List<Color> backGroundGridentColor = getGrediantColors(widget.collection!);
    return Scaffold(
      appBar: AppBar(),
      body: CustomGridentBackground(
        colors: backGroundGridentColor,
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
                                  if (filterStatus == FilterStatus.reserve) {
                                    status = FilterStatus.reserve;
                                    _alignment = Alignment.centerLeft;
                                  } else if (filterStatus ==
                                      FilterStatus.ground) {
                                    status = FilterStatus.ground;
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
                      width: 140,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
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
              CustomGetGrounds(
                collection: widget.collection!,
                color: color,
                status: status,
              )
            ],
          ),
        ),
      ),
    );
  }
}
//starting files