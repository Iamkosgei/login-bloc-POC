import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nnke/utils/colors.dart';
import 'package:nnke/utils/constants.dart';

import 'ui/pages/start_up/start_up_page.dart';
import 'utils/locator.dart';
import 'utils/named_navigator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NNKE',
      theme: ThemeData(
        primarySwatch: materialPrimaryColor,
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const StartUpPage(),
      onGenerateRoute: generateRoute,
      initialRoute: splashPage,
    );
  }
}
