import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:kman/featuers/play/screens/play_home_screen.dart';

import '../../../../core/common/error_text.dart';
import '../../../../core/common/loader.dart';
import '../../controller/play_controller.dart';
import '../../screens/reservision_screen.dart';

class CustomGetGrounds extends ConsumerWidget {
  String collection;
  Color color;
  FilterStatus status;
  CustomGetGrounds(
      {super.key,
      required this.collection,
      required this.color,
      required this.status});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getGroundsProvider(collection)).when(
        data: (ground) {
          return Expanded(
            child: ListView.builder(
              itemCount: ground.length,
              itemBuilder: ((context, index) {
                final grounds = ground[index];
                return InkWell(
                  onTap: () {
                    if (status == FilterStatus.ground) {
                    } else {
                      Get.to(ReservisionScreen(
                        color: color,
                        collection: collection,
                        groundId: grounds.id,
                      ));
                    }
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color.fromARGB(255, 228, 227, 227),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        title: Text("${grounds.name}"),
                      )),
                );
              }),
            ),
          );
        },
        error: (error, StackTrace) {
          print(error);

          return ErrorText(error: error.toString());
        },
        loading: () => const Loader());
  }
}
