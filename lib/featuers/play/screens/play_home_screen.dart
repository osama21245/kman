import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kman/core/common/getcolor.dart';
import 'package:kman/featuers/play/widget/play/custom_play_middlesec.dart';
import 'package:kman/featuers/play/widget/play/custom_play_serarch.dart';
import 'package:kman/featuers/play/widget/play/custom_play_uppersec.dart';
import 'package:kman/featuers/play/widget/play/custom_play_grident.dart';
import 'package:kman/theme/pallete.dart';

import '../widget/play/custom_get_grounds.dart';

class PlayHomeScreen extends ConsumerStatefulWidget {
  final String? collection;
  const PlayHomeScreen({super.key, this.collection});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayHomeScreenState();
}

Alignment _alignment = Alignment.centerLeft;
FilterStatus status = FilterStatus.Reserve; //initial status

enum FilterStatus { Reserve, Grounds }

class _PlayHomeScreenState extends ConsumerState<PlayHomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool checkboxValue = true;
    Size size = MediaQuery.of(context).size;
    final color = getColor(widget.collection!);
    List<Color> backGroundGridentColor = getGrediantColors(widget.collection!);
    return Scaffold(
      body: SafeArea(
        child: CustomGridentBackground(
          colors: backGroundGridentColor,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomPlayUpperSec(
                color: color,
                size: size,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Divider(
                thickness: 3,
                color: Colors.black,
              ),
              CustomPlayMiddleSec(color: color, size: size),
              SizedBox(
                width: size.height * 0.09,
              ),
              CustomPlaySearch(size: size),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.045,
                    top: size.width * 0.01,
                    bottom: size.width * 0.017,
                    right: size.width * 0.022),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width * 0.014),
                        color: color),
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: color,
                          activeColor: Pallete.whiteColor,
                          value: checkboxValue,
                          onChanged: (v) {},
                        ),
                        Text(
                          "i'm Free to play any time,any where",
                          style: TextStyle(color: Pallete.whiteColor),
                        )
                      ],
                    )),
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.02),
                    child: Row(
                      children: [
                        for (FilterStatus filterStatus in FilterStatus.values)
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (filterStatus == FilterStatus.Reserve) {
                                    status = FilterStatus.Reserve;
                                    _alignment = Alignment.centerLeft;
                                  } else if (filterStatus ==
                                      FilterStatus.Grounds) {
                                    status = FilterStatus.Grounds;
                                    _alignment = Alignment.centerRight;
                                  }
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.02),
                                child: Container(
                                    width: size.width * 0.47,
                                    height: size.height * 0.054,
                                    decoration: BoxDecoration(
                                      color: Pallete.greyColor,
                                      borderRadius: BorderRadius.circular(
                                          size.width * 0.014),
                                    ),
                                    child: Center(
                                      child: Text(
                                        filterStatus.name,
                                        style: TextStyle(
                                            color: Pallete.whiteColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: size.height * 0.02),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  AnimatedAlign(
                    alignment: _alignment,
                    duration: const Duration(milliseconds: 200),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: Container(
                        width: size.width * 0.47,
                        height: size.height * 0.054,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius:
                              BorderRadius.circular(size.width * 0.014),
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
                  ),
                ],
              ),
              SizedBox(
                height: size.width * 0.01,
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