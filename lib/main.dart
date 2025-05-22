import 'package:flutter/material.dart';
import 'package:habbiton_diabetic_workflow/screens/diabetic_workflow_screens/Start_screen/Start_screen.dart';
import 'package:habbiton_diabetic_workflow/screens/diabetic_workflow_screens/assessement_screen/provider/assessement_provider.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late SharedPreferences preferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();
  await preferences.setString('jwtToken',
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTI3LCJ1c2VyX3R5cGUiOjUsImlhdCI6MTc0NzkwNzg5NCwiZXhwIjoxNzQ3OTk0Mjk0fQ.m08l9RZihsTcUK9ZdvrZxGOHUSSLy1gPRsqsYsi7pAU");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DiabetesController(),
        )
      ],
      //  child:GlobalLoaderOverlay(
      //     useDefaultLoading: false,
      //     overlayWidget: Center(
      //       child: CircularProgressIndicator(),
      //     ),
      child: MyApp(),
    ),
    //)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}
