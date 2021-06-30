import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:ev_project/ui/pages/emailSignInPage.dart';
import 'package:ev_project/ui/pages/onBoardingPage.dart';
import 'package:ev_project/ui/widgets/CustomDropDown.dart';
import 'package:ev_project/ui/widgets/TextButtonRow.dart';
import 'package:ev_project/ui/widgets/customButton.dart';
import 'package:ev_project/ui/widgets/customTextField.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';


class EmailSignUpPage extends StatefulWidget {
  const EmailSignUpPage({Key? key}) : super(key: key);

  @override
  _EmailSignUpPageState createState() => _EmailSignUpPageState();
}

class _EmailSignUpPageState extends State<EmailSignUpPage> {
  final AppResources resources = AppResources();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.app_settings_alt_outlined),
        onPressed: (){
          resources.sendFeedback(context);
        },
      ),
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
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            icon: Icons.email,

          ),


          Spacer(flex: 1,),
          CustomTextField(
            width: size.width * 0.8,
            height: size.height * 0.08,
            hintText: "Password",
            obscureText: true,
            icon: Icons.lock_outline
          ),

          Spacer(flex: 1,),
          CustomTextField(
              width: size.width * 0.8,
              height: size.height * 0.08,
              hintText: "Confirm Password",
              icon: Icons.lock_outline
          ),

          Spacer(flex: 1,),

          CustomDropDown(
            label: "Institution",
            width: size.width * 0.8,
            height: size.height * 0.13,
            onChanged: (value){

            },
            items: [
              "Please Select",
              "Ashesi University",
              "",
              ""
            ],
          ),

          Spacer(flex: 2,),

          CustomRoundedButton(
              child: Text("Create Account", style: TextStyle(color:Colors.white)),
              color: resources.secondaryColor,
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> OnBoardingPage()));
              },
          ),

          TextButtonRow(
            text: "Already have an account?",
            buttonText: "Sign In",
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context)=> EmailSignInPage())
              );
            }
          ),
          Spacer(flex: 9,),
        ],
      ),
      ),
    );
  }
}
