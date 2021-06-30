import 'package:ev_project/ui/pages/aboutPage.dart';
import 'package:ev_project/ui/pages/editProfilePage.dart';
import 'package:ev_project/ui/pages/homepage.dart';
import 'package:ev_project/ui/pages/paymentMethods.dart';
import 'package:ev_project/ui/pages/tripHistoryPage.dart';
import 'package:ev_project/ui/widgets/customButton.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:flutter/material.dart';


class SettingsPage extends StatelessWidget {
  final AppResources resources = AppResources();

  SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   heroTag: "feedback",
      //   child: Icon(Icons.app_settings_alt_outlined),
      //   onPressed: (){
      //     resources.sendFeedback(context);
      //   },
      // ),
      body: Container(
        padding: EdgeInsets.only(top: 8.0),
        child: Column(
          children: [

            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: IconButton(
                  icon: Icon(Icons.chevron_left,
                  size: 35,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            SizedBox(
              width: size.width,
              height: size.height * 0.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.network("https://picsum.photos/200",
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.width * 0.2,
                      )
                  ),
                  Row(
                    children: [
                      Spacer(flex: 3,),
                      Column(
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0, top: 12.0),
                            child: Text("Alex Fluid"),
                          ),
                          Text("Ashesi University, ER")
                        ]
                      ),
                      FloatingActionButton(
                        elevation: 0,
                        mini: true,
                        backgroundColor: Colors.indigoAccent,
                        child: Icon(Icons.edit, size: 20,color: Colors.white,),

                        onPressed: () {
                          AppResources.openPage(context, EditProfilePage());
                        },
                      ),

                      Spacer(flex: 2,),
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              shape: Border.all(width: 0.5, color: Colors.grey),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> TripHistoryPage()
                )
                );
              },
              title: Text("Trip History"),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              shape: Border.all(width: 0.5, color: Colors.grey),
              onTap: (){
                AppResources.openPage(context, PaymentMethodsPage());
                // resources.openPage(context, PaymentMethodsPage());
              },
              title: Text("Payment Methods"),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              shape: Border.all(width: 0.5, color: Colors.grey),
              title: Text("Help"),
              trailing: Icon(Icons.chevron_right),
              onTap: (){},
            ),
            ListTile(
              shape: Border.all(width: 0.5, color: Colors.grey),
              onTap: (){
                AppResources.openPage(context, AboutPage());
              },
              title: Text("About"),
              trailing: Icon(Icons.chevron_right),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomRoundedButton(
                borderRadius: 8.0,
                width: MediaQuery.of(context).size.width * 0.4,
                  onPressed: (){
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(
                          builder: (context)=> Homepage()
                      )
                  );
                  },
                child: Text("LOG OUT", style: TextStyle(color: Colors.white),),
                color: resources.secondaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
