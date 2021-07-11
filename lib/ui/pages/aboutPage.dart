import 'package:ev_project/utils/appResources.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class AboutPage extends StatelessWidget {
  final AppResources resources = AppResources();

  AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.app_settings_alt_outlined),
        //   onPressed: (){
        //     resources.sendFeedback(context);
        //   },
        // ),


        body: Container(
          padding: EdgeInsets.only(
            top: 12.0
          ),
          child: SingleChildScrollView(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.chevron_left,
                        size: 35,
                      ),
                      onPressed: () {
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
                      CircleAvatar(
                        // foregroundColor: resources.primaryColor,
                        minRadius: 30,

                        child: Icon(Ionicons.logo_github, size: 50,),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(
                            flex: 2,
                          ),
                          Column(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 4.0, top: 12.0),
                              child: Text("version 1.0.1", style: TextStyle(color: Colors.grey), overflow: TextOverflow.fade,),
                            ),
                            Text("Ashesi EV Project", overflow: TextOverflow.fade,)
                          ]),
                          Spacer(
                            flex: 2,
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                Row(
                  children: [
                    Container(
                      color: Colors.indigo,
                      child: SizedBox(
                        width: size.width /3,
                        height: 40,

                      ),
                    ),
                    Container(
                      color: Colors.indigoAccent,
                      child: SizedBox(
                        width: size.width /3,
                        height: 40,

                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: SizedBox(
                        width: size.width /3,
                        height: 40,

                      ),
                    ),
                  ],
                ),

                ListTile(
                  shape: Border.all(width: 0.5, color: Colors.grey),
                  title: Text("Terms and conditions", overflow: TextOverflow.fade,),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                ListTile(
                  shape: Border.all(width: 0.5, color: Colors.grey),
                  onTap: () {},
                  title: Text("Privacy Statement", overflow: TextOverflow.fade,),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  shape: Border.all(width: 0.5, color: Colors.grey),
                  onTap: () {},
                  title: Text("Contact Us", overflow: TextOverflow.fade,),
                  trailing: Icon(Icons.chevron_right),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
