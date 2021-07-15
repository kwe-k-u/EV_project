import 'package:ev_project/ui/pages/homepage.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:ev_project/utils/objects/provider/appState.dart';
import 'package:ev_project/utils/objects/provider/rideUser.dart';
import 'package:feedback/feedback.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splash/splash.dart';

void main() {
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
  final AppResources resources = AppResources();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done && !snapshot.hasError)
            return MultiProvider(
              providers: [
                ChangeNotifierProvider<RideUser>(create: (_) => RideUser()),
                ChangeNotifierProvider<AppState>(create: (_) => AppState())
              ],
              child: MaterialApp(
                title: 'EV project',
                theme: ThemeData(
                    splashFactory: PathSplash.splashFactory(resources.createSamplePath())
                ),
                home: Homepage(),
              ),
              builder: (context, widget){
                return widget!;
              },
            );
          else
            return MaterialApp(
              home: Scaffold(
                body: Container(),
              ),
            );
        }
    );
  }
}
