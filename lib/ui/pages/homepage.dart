import 'package:ev_project/ui/pages/emailSignInPage.dart';
import 'package:ev_project/ui/pages/emailSignUpPage.dart';
import 'package:ev_project/ui/widgets/TextButtonRow.dart';
import 'package:ev_project/ui/widgets/customButton.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:ev_project/utils/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';


class Homepage extends StatelessWidget {
  final  AppResources resources = AppResources();

  Homepage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Text("Sign in with Email", style: TextStyle(color: Colors.white),),
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
                    Text("Sign in with Google", style: TextStyle(color: Colors.white),),
                    Spacer(flex: 5,),
                  ],
                ),
                color: resources.secondaryColor,
                onPressed: ()async{
                  User? user = await signInWithGoogle();
                  if (user == null)
                    print("No user");
                  else
                    print("user info ${user.toString()}");
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
    );
  }
}
