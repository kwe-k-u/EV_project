import 'package:ev_project/ui/pages/homepage.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:splash/splash.dart';

void main() {
  runApp(MyApp());
  runApp(BetterFeedback(
    child: MyApp(),
    theme: FeedbackThemeData(
      background: Colors.grey,
      feedbackSheetColor: Colors.grey[50]!,
      drawColors: [
        Colors.red,
        Colors.green,
        Colors.blue,
        Colors.yellow,
      ],
    ),
    localeOverride: const Locale('en'),
  ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final AppResources resources = AppResources();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EV project',
      theme: ThemeData(
        splashFactory: PathSplash.splashFactory(resources.createSamplePath())
      ),
      home: Homepage(),
    );
  }
}
