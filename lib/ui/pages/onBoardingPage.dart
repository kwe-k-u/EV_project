import 'package:ev_project/ui/pages/dashboard.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';


class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  AppResources resources = AppResources();


  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Dashboard()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/image.png',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.app_settings_alt_outlined),
        //   onPressed: (){
        //     resources.sendFeedback(context);
        //   },
        // ),
        body: IntroductionScreen(
          key: introKey,
          globalBackgroundColor: Colors.white,
          pages: [
            PageViewModel(
              title: "Get around Campus Fast",
              body:
              "Why trek under the scorching sun when you can move with EV?.",
              image: _buildImage('image.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Save the planet",
              body:
              "Our vehicles are powered by electricity",
              image: _buildImage('image.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Kids and teens",
              body:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              image: _buildImage('image.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Cut cost on your campus travels",
              body:
              "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
              image: _buildFullscreenImage(),
              decoration: pageDecoration.copyWith(
                contentMargin: const EdgeInsets.symmetric(horizontal: 16),
                fullScreen: true,
                bodyFlex: 2,
                imageFlex: 3,
              ),
            ),
            PageViewModel(
              title: "All the time, anytime",
              body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
              image: _buildImage('image.png'),
              footer: ElevatedButton(
                onPressed: () {
                  introKey.currentState?.animateScroll(0);
                },
                child: const Text(
                  'FooButton',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: resources.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              decoration: pageDecoration,
            ),
            // PageViewModel(
            //   title: "Title of last page - reversed",
            //   bodyWidget: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: const [
            //       Text("Click on ", style: bodyStyle),
            //       Icon(Icons.edit),
            //       Text(" to edit a post", style: bodyStyle),
            //     ],
            //   ),
            //   decoration: pageDecoration.copyWith(
            //     bodyFlex: 2,
            //     imageFlex: 4,
            //     bodyAlignment: Alignment.bottomCenter,
            //     imageAlignment: Alignment.topCenter,
            //   ),
            //   image: _buildImage('img1.jpg'),
            //   reverse: true,
            // ),
          ],
          onDone: () => _onIntroEnd(context),
          //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
          showSkipButton: true,
          skipFlex: 0,
          nextFlex: 0,
          //rtl: true, // Display as right-to-left
          skip: const Text('Skip', overflow: TextOverflow.fade,),
          next: const Icon(Icons.arrow_forward),
          done: const Text('Done', overflow: TextOverflow.fade, style: TextStyle(fontWeight: FontWeight.w600)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          // dotsContainerDecorator: const ShapeDecoration(
          //   color: Colors.black87,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
          //   ),
          // ),
        ),
      ),
    );
  }
}
