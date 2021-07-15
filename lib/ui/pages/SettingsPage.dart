import 'package:ev_project/ui/pages/aboutPage.dart';
import 'package:ev_project/ui/pages/editProfilePage.dart';
import 'package:ev_project/ui/pages/homepage.dart';
import 'package:ev_project/ui/pages/paymentMethodsPage.dart';
import 'package:ev_project/ui/pages/tripHistoryPage.dart';
import 'package:ev_project/ui/widgets/customButton.dart';
import 'package:ev_project/ui/widgets/profileImage.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:ev_project/utils/objects/provider/rideUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final AppResources resources = AppResources();
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    RideUser user = context.read<RideUser>();


    return SafeArea(
      child: Scaffold(
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
                    ProfileImageWidget(
                      url: user.profileImageUrl,
                      width: size.width * 0.2,
                      height: size.width * 0.2,
                    ),

                    Row(
                      children: [
                        Spacer(flex: 3,),
                        Column(
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0, top: 12.0),
                                child: Text(user.username, overflow: TextOverflow.fade,),
                              ),
                              Text(user.institution, overflow: TextOverflow.fade,)
                            ]
                        ),
                        FloatingActionButton(
                          elevation: 0,
                          mini: true,
                          backgroundColor: Colors.indigoAccent,
                          child: Icon(Icons.edit, size: 20,color: Colors.white,),

                          onPressed: () {
                            AppResources.openPageWithAnimation(context, EditProfilePage());
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
                title: Text("Trip History", overflow: TextOverflow.fade,),
                trailing: Icon(Icons.chevron_right),
              ),
              ListTile(
                shape: Border.all(width: 0.5, color: Colors.grey),
                onTap: (){
                  AppResources.openPage(context, PaymentMethodsPage());
                  // resources.openPage(context, PaymentMethodsPage());
                },
                title: Text("Payment Methods", overflow: TextOverflow.fade,),
                trailing: Icon(Icons.chevron_right),
              ),
              ListTile(
                shape: Border.all(width: 0.5, color: Colors.grey),
                title: Text("Help", overflow: TextOverflow.fade,),
                trailing: Icon(Icons.chevron_right),
                onTap: (){},
              ),
              ListTile(
                shape: Border.all(width: 0.5, color: Colors.grey),
                onTap: (){
                  AppResources.openPage(context, AboutPage());
                },
                title: Text("About", overflow: TextOverflow.fade,),
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
                  child: Text("LOG OUT",
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  color: resources.secondaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

