import 'package:ev_project/ui/pages/SettingsPage.dart';
import 'package:ev_project/ui/widgets/request%20sheet/RequestSheet.dart';
import 'package:ev_project/ui/widgets/customButton.dart';
import 'package:ev_project/ui/widgets/customTextField.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  AppResources resources = AppResources();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "",
        child: Icon(Icons.app_settings_alt_outlined),
        onPressed: (){
          resources.sendFeedback(context);
        },
      ),
      body: Container(
        padding: EdgeInsets.only(top: size.height * 0.05),
        // child: SlidingSheet(
        //   elevation: 8,
        //   cornerRadius: 16,
        //   snapSpec: const SnapSpec(
        //     // Enable snapping. This is true by default.
        //     snap: true,
        //     // Set custom snapping points.
        //     snappings: [0.1, 0.6, 1.0],
        //     // Define to what the snappings relate to. In this case,
        //     // the total available space that the sheet can expand to.
        //     positioning: SnapPositioning.relativeToAvailableSpace,
        //   ),
        //   // The body widget will be displayed under the SlidingSheet
        //   // and a parallax effect can be applied to it.
        //   headerBuilder: (context, state) {
        //     return _sheetHeader(size);
        //   },
        //   body: ,
        //   builder: (context, state) {
        //     // This is the content of the sheet that will get
        //     // scrolled, if the content is bigger than the available
        //     // height of the sheet.
        //     return _sheetBody(size);
        //   },
        // ),
        child: RequestSheet(body:_buildBody(MediaQuery.of(context).size,), requestMade: false,),
      ),
    );
  }


  Widget _buildBody(Size size) {
    return Stack(
      children: [
        Image(
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
            image: AssetImage('assets/image.png')),

        Container(
          margin: EdgeInsets.only(left: 6.0, top: 30.0),
          child: FloatingActionButton(
            mini: true,
            backgroundColor: Colors.white,
            child: Icon(Icons.menu, color: Colors.indigo,),

            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingsPage()));
            },
          ),
        ),

      ],
    );
  }

}