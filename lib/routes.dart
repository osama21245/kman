import 'package:get/get.dart';
import 'package:kman/featuers/screens/football_home_screen.dart';

import 'core/constants/routesname.dart';
import 'core/middleWare/myMiddleWare.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => FootballHomeScreen(),
      middlewares: [myMiddlware()]),
];
