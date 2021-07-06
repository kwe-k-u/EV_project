

import 'dart:io';
import 'dart:typed_data';

import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AppResources{
  Color primaryColor = Colors.indigo;
  Color secondaryColor = Colors.indigoAccent;
  Color tertiaryColor = Colors.white;

  AppResources();


  ///Draws the line animation for button splash
  Path createSamplePath() {
    final Path p = Path();
    p.moveTo(1, 71.2809197);
    p.cubicTo(11.1406949, 2.07915688, 12.3390041, 1.6853846900000002, 12.3390041,
        2.63418918);
    p.cubicTo(
        12.3390041, 16.1732674, 5.81516078, 54.6265809, 13.4122424, 58.231071);
    p.cubicTo(
        27.5548686, 64.9411419, 11.8667282, 19.1876082, 26.4558632, 13.4902806);
    p.cubicTo(
        38.6551464, 8.72623444, 15.2985909, 53.1096267, 28.392577, 52.3809728);
    p.cubicTo(
        41.7106508, 51.6398489, 22.2219184, 6.02983339, 33.4873992, 13.0989898);
    p.cubicTo(
        46.6984218, 21.3889853, 25.5538004, 66.6773405, 39.2464461, 59.1918404);
    p.cubicTo(
        56.8614014, 49.5620908, 35.7622035, 7.95661241, 54.7839508, 1.45658394);
    p.cubicTo(70.8350029, -4.0283115800000004, 48.4693561, 41.5227406, 62.2607362,
        51.3274976);
    p.cubicTo(
        72.3173477, 58.4770817, 68.1727505, 11.05576, 78.267821, 18.1520588);
    p.cubicTo(
        90.8278549, 26.9810961, 66.3555953, 70.7733492, 80.0853149, 63.8572306);
    p.cubicTo(
        97.9426259, 54.8619062, 79.470813, 9.71643238, 99.3843263, 7.51496928);
    p.cubicTo(
        117.562697, 5.50532827, 81.7027879, 54.7543958, 98.5449215, 61.8164986);
    p.cubicTo(
        114.340936, 68.4399516, 110.550843, 26.5127202, 125.702708, 18.5505734);
    p.cubicTo(
        134.960815, 13.6855353, 113.362224, 55.2607876, 122.054339, 49.4625455);
    p.cubicTo(
        137.016739, 39.4815895, 134.705056, -7.88186677, 149.008965, 3.00368751);
    p.cubicTo(
        167.247867, 16.8838482, 128.12973, 67.079218, 150.740086, 71.2929595);
    p.cubicTo(
        173.820144, 75.5942363, 164.819939, 23.9362081, 183.113131, 9.35945384);
    p.cubicTo(193.769855, 0.8677462640000001, 164.42908, 47.2792898, 177.899089,
        49.6515691);
    p.cubicTo(
        192.693241, 52.2570505, 188.942336, 9.42862005, 203.539865, 12.9569211);
    p.cubicTo(
        503.461572, 85.4496066, -183.197223, 55.4902592, 235.85695, 8.77311965);
    p.cubicTo(
        250.771869, 7.11036961, 222.699989, 43.7915923, 234.225585, 53.306827);
    p.cubicTo(
        243.416271, 60.8944201, 249.754601, 24.2659083, 260.625475, 29.2213741);
    p.cubicTo(
        271.57839, 34.2142382, 260.15265, 53.0856975, 259.916238, 65.0178592);
    return p;
  }



  ///Sends an email of a user's feedback to the developer email
  Future<bool> sendFeedback(BuildContext context) async{


    Future<String> writeImageToStorage(Uint8List feedbackScreenshot) async {
      final Directory output = await getTemporaryDirectory();
      final String screenshotFilePath = '${output.path}/feedback.png';
      final File screenshotFile = File(screenshotFilePath);
      await screenshotFile.writeAsBytes(feedbackScreenshot);
      return screenshotFilePath;
    }


    BetterFeedback.of(context).show((feedback) async {
      final screenshotFilePath =
          await writeImageToStorage(feedback.screenshot);


      final Email email = Email(
        body: feedback.text,
        subject: 'Ashesi EV Project feedback - UI',
        recipients: ['developer.ozone@gmail.com'],
        attachmentPaths: [screenshotFilePath],
        isHTML: false,
      );
      await FlutterEmailSender.send(email);
    });
    return true;
  }


  ///Adds another page to the navigator stack
  AppResources.openPage(BuildContext context, Widget page){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> page));
  }

  Future<bool> showIntroPage() async{
    bool show;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    show =  preferences.getBool("showIntroPage") ?? true;

    //ensuring that intro page is shown just once
    if (show)
      preferences.setBool("showIntroPage", false);
    return show;
  }








  AppResources.openPageWithAnimation(BuildContext context, Widget page){
    Navigator.of(context).push( PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation){
          return page;
          },
        opaque: false),

    );
  }


}