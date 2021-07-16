
import 'package:ev_project/ui/pages/dashboard.dart';
import 'package:ev_project/ui/pages/emailSignUpPage.dart';
import 'package:ev_project/ui/pages/onBoardingPage.dart';
import 'package:ev_project/ui/widgets/TextButtonRow.dart';
import 'package:ev_project/ui/widgets/customButton.dart';
import 'package:ev_project/ui/widgets/customTextField.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:ev_project/utils/objects/provider/rideUser.dart';
import 'package:ev_project/utils/services/auth.dart';
import 'package:ev_project/utils/services/firebaseStorage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class EmailSignInPage extends StatefulWidget {
  const EmailSignInPage({Key? key}) : super(key: key);

  @override
  _EmailSignInPageState createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {

  final AppResources resources = AppResources();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

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
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [



              Spacer(flex: 9,),

              CircleAvatar(
                // foregroundColor: resources.primaryColor,
                minRadius: 30,

                child: Icon(Ionicons.logo_github, size: 50,),
              ),

              Spacer(flex: 1,),
              CustomTextField(
                width: size.width * 0.8,
                height: size.height * 0.08,
                controller: email,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                icon: Icons.email_outlined

              ),


              Spacer(flex: 1,),
              CustomTextField(
                width: size.width * 0.8,
                height: size.height * 0.08,
                controller: password,
                hintText: "Password",
                  keyboardType: TextInputType.text,
                obscureText: true,
                icon: Icons.lock_outlined
              ),

              Spacer(flex: 1,),

              CustomRoundedButton(
                child: Text("Log In", style: TextStyle(color: Colors.white), overflow: TextOverflow.fade,),
                color: resources.secondaryColor,
                onPressed: () async{

                  User? user = await logInWithEmail(email:email.text.trim(), password: password.text.trim(), context: context);
                  if (user == null)
                    print("No user");
                  else {
                    print("user info ${user.toString()}");
                    Map<String, dynamic>? map = await getUserProfile(user.uid);
                    RideUser rideUser = RideUser.fromMapAndUser(user, map);
                    context.read<RideUser>().reassign(rideUser);
                    if (await resources.showIntroPage())
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => OnBoardingPage()
                      ));
                    else
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => Dashboard()
                      ));
                  }
                },
              ),

              TextButtonRow(
                  text: "Don't have an account??",
                  buttonText: "Sign Up",
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context)=> EmailSignUpPage())
                    );
                  }
              ),

              Spacer(flex: 9,),
            ],
          ),
        ),
      ),
    );
  }
}
