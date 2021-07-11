import 'package:ev_project/ui/pages/dashboard.dart';
import 'package:ev_project/ui/pages/emailSignInPage.dart';
import 'package:ev_project/ui/pages/emailSignUpPage.dart';
import 'package:ev_project/ui/widgets/TextButtonRow.dart';
import 'package:ev_project/ui/widgets/customButton.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:ev_project/utils/objects/provider/rideUser.dart';
import 'package:ev_project/utils/services/auth.dart';
import 'package:ev_project/utils/services/firebaseStorage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';


class Homepage extends StatelessWidget {
  final  AppResources resources = AppResources();

  Homepage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.app_settings_alt_outlined),
        //   onPressed: (){
        //     resources.sendFeedback(context);
        //   },
        // ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Spacer(flex: 9,),
              CustomRoundedButton(
                  child: Row(
                    children: [
                      Spacer(flex: 3,),
                      Icon(Icons.email, color: Colors.white,),
                      Spacer(flex: 1,),
                      Text("Sign in with Email", style: TextStyle(color: Colors.white), overflow: TextOverflow.fade,),
                      Spacer(flex: 5,),
                    ],
                  ),
                  color: resources.secondaryColor,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> EmailSignInPage())
                    );
                  }
              ),


              Spacer(flex: 1,),
              CustomRoundedButton(
                  child: Row(
                    children: [
                      Spacer(flex: 3,),
                      Icon(Ionicons.logo_google, color: Colors.white,),
                      Spacer(flex: 1,),
                      Text("Sign in with Google", style: TextStyle(color: Colors.white), overflow: TextOverflow.fade,),
                      Spacer(flex: 5,),
                    ],
                  ),
                  color: resources.secondaryColor,
                  onPressed: ()async {
                    User? _user = await signInWithGoogle();
                    if (_user != null) {
                      Map<String, dynamic>? data = await getUserProfile(
                          _user.uid);
                      RideUser rideUser = RideUser.fromMapAndUser(_user, data);
                      //todo better implementation?
                      context.read<RideUser>().reassign(rideUser);


                      if (data != null) { //if the user is an existing user
                        //todo remove if condition when cloud trigger for new user is added
                        //syncing additional data;
                        // if (data.containsKey("profileUrl"))
                        //   rideUser.profileImageUrl = data["profileUrl"];
                        // rideUser.paymentMethods = data["paymentMethods"] ?? [];
                        // rideUser.currentPaymentMethodIndex = data["currentPaymentMethodIndex"];
                        
                        if (!data.containsKey("institution"))
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.orange,
                                content: Text("Kindly add an institution to your profile", overflow: TextOverflow.fade,),
                              )
                          );
                      }
                      AppResources.openPage(
                          context, Dashboard());
                    }
                  }
              ),

              Spacer(flex: 1,),



              TextButtonRow(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> EmailSignUpPage()
                    ));
                  },
                  buttonText: "Sign Up",
                  text: "Don't have an account?"
              ),

              Spacer(flex: 9,),
            ],
          ),
        ),
      ),
    );
  }
}
