import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:kman/featuers/play/screens/play_home_screen.dart';
import 'package:kman/featuers/play/widget/play/custom_play_card.dart';

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
                      if (status == FilterStatus.Grounds) {
                      } else {
                        Get.to(ReservisionScreen(
                          color: color,
                          collection: collection,
                          groundId: grounds.id,
                        ));
                      }
                    },
                    child: CustomPlayCard(color: color, groundModel: grounds));
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
