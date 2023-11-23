import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:kman/featuers/play/widget/home/custombottomAppbar.dart';

import '../../../../core/class/bottomAppbar.dart';

class CustomBottomAppBarHome extends StatefulWidget {
  Color color;
  CustomBottomAppBarHome({Key? key, required this.color}) : super(key: key);

  @override
  State<CustomBottomAppBarHome> createState() => _CustomBottomAppBarHomeState();
}

class _CustomBottomAppBarHomeState extends State<CustomBottomAppBarHome> {
  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    changePage(int i) {
      setState(() {
        currentpage = i;
      });
    }

    return BottomAppBar(
        color: widget.color,
        shape: const CircularNotchedRectangle(),
        notchMargin: 3,
        child: Container(
          child: Row(
            children: [
              ...List.generate(bottomAppBarList.length + 1, ((index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : CustomBottomAppbar(
                        Texticon: bottomAppBarList[i].title,
                        icon: bottomAppBarList[i].icon,
                        onpressed: () {
                          changePage(i);
                        },
                        active: currentpage == i ? true : false);
              }))
            ],
          ),
        ));
  }
}
