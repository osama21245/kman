import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/core/common/custom_uppersec.dart';
import 'package:kman/theme/pallete.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/providers/checkInternet.dart';
import '../../play/screens/play_home_screen.dart';
import '../../play/widget/play/custom_play_serarch.dart';

class CoachesGymsHomeScreen extends ConsumerStatefulWidget {
  const CoachesGymsHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CoachesGymsHomeScreenState();
}

Alignment _alignment = Alignment.centerLeft;
PlayFilterStatus status = PlayFilterStatus.Reserve;

enum CoachesGymsFilterStatus { Coaches, Gyms }

class _CoachesGymsHomeScreenState extends ConsumerState<CoachesGymsHomeScreen> {
  StatusRequest statusRequest = StatusRequest.success;

  checkinternet() async {
    setState(() {
      statusRequest = StatusRequest.loading2;
    });

    if (await checkInternet()) {
      setState(() {
        statusRequest = StatusRequest.success;
      });
    } else {
      setState(() {
        statusRequest = StatusRequest.offlinefalire2;
      });
    }
  }

  @override
  void initState() {
    checkinternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          CustomUpperSec(
            size: size,
            color: Pallete.fontColor,
            title: "${status.name}",
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Divider(
            thickness: 3,
            color: Colors.black,
          ),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.02),
                child: Row(
                  children: [
                    for (PlayFilterStatus filterStatus
                        in PlayFilterStatus.values)
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (filterStatus == PlayFilterStatus.Reserve) {
                                status = PlayFilterStatus.Reserve;
                                _alignment = Alignment.centerLeft;
                              } else if (filterStatus ==
                                  PlayFilterStatus.Grounds) {
                                status = PlayFilterStatus.Grounds;
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
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.014),
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
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Container(
                    width: size.width * 0.47,
                    height: size.height * 0.054,
                    decoration: BoxDecoration(
                      color: Pallete.primaryColor,
                      borderRadius: BorderRadius.circular(size.width * 0.014),
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
          // InkWell(
          //     onTap: () => showSearch(
          //         context: context,
          //         delegate: SearchGroundDelegate(
          //           ref,
          //           widget.collection!,
          //           color,
          //           backGroundGridentColor,
          //           size,
          //         )),
          //     child: ),
          CustomPlaySearch(size: size)
        ],
      ),
    );
  }
}
