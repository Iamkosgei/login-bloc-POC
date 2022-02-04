import 'package:flutter/material.dart';
import 'package:nnke/ui/pages/login_page/login_page.dart';
import 'package:nnke/ui/pages/start_up/start_up_page.dart';

import 'constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splashPage:
      return MaterialPageRoute(builder: (context) => const StartUpPage());
    case loginPage:
      return MaterialPageRoute(builder: (context) => const LoginPage());

    default:
      return MaterialPageRoute(builder: (context) => const StartUpPage());
  }
}
