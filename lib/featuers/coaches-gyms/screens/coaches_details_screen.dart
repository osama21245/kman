import 'package:flutter/material.dart';
import 'package:kman/models/coache_model.dart';

import '../../../core/common/custom_uppersec.dart';
import '../../../theme/pallete.dart';
import '../../play/widget/play/showrating.dart';

class CoachesDetailsScreen extends StatelessWidget {
  CoacheModel? coacheModel;
  CoachesDetailsScreen({super.key, required this.coacheModel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomUpperSec(
            size: size,
            color: Pallete.fontColor,
            title: "COACHES",
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Divider(
            thickness: 3,
            color: Colors.black,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.032),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: size.height * 0.1,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Pallete.primaryColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(size.width * 0.02),
                              topRight: Radius.circular(size.width * 0.02))),
                      height: size.height * 0.55,
                      width: size.width,
                      child: Text(""),
                    ),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(size.width * 0.02),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Pallete.fontColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(size.width * 0.02),
                                bottomRight:
                                    Radius.circular(size.width * 0.02))),
                        height: size.height * 0.08,
                        width: size.width,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Book Now",
                                style: TextStyle(
                                    fontFamily: "Muller",
                                    color: Pallete.whiteColor,
                                    fontSize: size.width * 0.04,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "${coacheModel!.price}\$/Month",
                                style: TextStyle(
                                    fontFamily: "Muller",
                                    color: Pallete.whiteColor,
                                    fontSize: size.width * 0.04,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Positioned.fill(
                    child: Column(
                  children: [
                    Container(
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Pallete.primaryColor),
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.01),
                          child: Center(
                            child: CircleAvatar(
                                backgroundColor: Pallete.primaryColor,
                                radius: size.width * 0.2,
                                backgroundImage: AssetImage(
                                    "assets/page-1/images/coaches-gyms.png")),
                          ),
                        )),
                    SizedBox(
                      height: size.width * 0.01,
                    ),
                    Text(
                      "Coach",
                      style: TextStyle(
                        fontFamily: "Muller",
                        color: Pallete.whiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: size.width * 0.03,
                      ),
                    ),
                    Text(
                      "${coacheModel!.name}",
                      style: TextStyle(
                          fontFamily: "Muller",
                          color: Pallete.whiteColor,
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: size.width * 0.008,
                    ),
                    Text(
                      "${coacheModel!.categoriry}",
                      style: TextStyle(
                        fontFamily: "Muller",
                        color: Pallete.whiteColor,
                        fontSize: size.width * 0.05,
                      ),
                    ),
                    RatingDisplayWidget(
                        rating: coacheModel!.raTing,
                        color: Pallete.ratingColor,
                        size: size),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Education",
                            style: TextStyle(
                              fontFamily: "Muller",
                              color: Color.fromARGB(255, 250, 220, 52),
                              fontSize: size.width * 0.037,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${coacheModel!.education}",
                            style: TextStyle(
                              fontFamily: "Muller",
                              height: size.width * 0.0037,
                              color: Pallete.whiteColor,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: size.width * 0.02,
                          ),
                          Text(
                            "Experience",
                            style: TextStyle(
                              fontFamily: "Muller",
                              color: Color.fromARGB(255, 250, 220, 52),
                              fontSize: size.width * 0.037,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${coacheModel!.experience}",
                            style: TextStyle(
                              fontFamily: "Muller",
                              height: size.width * 0.0037,
                              color: Pallete.whiteColor,
                              fontSize: size.width * 0.036,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: size.width * 0.02,
                          ),
                          Text(
                            "Benifits",
                            style: TextStyle(
                              fontFamily: "Muller",
                              color: Color.fromARGB(255, 250, 220, 52),
                              fontSize: size.width * 0.037,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${coacheModel!.benefits}",
                            style: TextStyle(
                              fontFamily: "Muller",
                              height: size.width * 0.0037,
                              color: Pallete.whiteColor,
                              fontSize: size.width * 0.036,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
                // Positioned(
                //   left: 12,
                //   bottom: size.height * 0.34,
                //   child:
                // )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
