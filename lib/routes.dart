import 'package:get/get.dart';
import 'package:kman/booking_screen.dart';
import 'package:kman/featuers/play/screens/play_home_screen.dart';

import 'core/constants/routesname.dart';
import 'core/middleWare/myMiddleWare.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => BookingScreen(),
  ), //middlewares: [myMiddlware()]
];
