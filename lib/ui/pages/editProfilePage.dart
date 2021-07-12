import 'dart:io';

import 'package:ev_project/ui/widgets/CustomDropDown.dart';
import 'package:ev_project/ui/widgets/customButton.dart';
import 'package:ev_project/ui/widgets/customTextField.dart';
import 'package:ev_project/ui/widgets/profileImage.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:ev_project/utils/objects/provider/rideUser.dart';
import 'package:ev_project/utils/services/firebaseStorage.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final AppResources resources = AppResources();
  late RideUser user;
  late String institution;
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phoneNumber;
  File? file;
  //todo add controller for image

  @override
  void initState() {
    super.initState();
    user = context.read<RideUser>();

    username = new TextEditingController(text: user.username);
    phoneNumber = new TextEditingController(text: user.phoneNumber);
    email = new TextEditingController(text: user.email);
    institution = user.institution;

  }

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
        backgroundColor: Colors.transparent,
        body: Consumer<RideUser>(
          builder: (context, dy,child){
            return Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 12.0),
              child: TweenAnimationBuilder<double>(

                tween: Tween(begin: 0.0, end:1.0),
                duration: Duration(milliseconds: 2000),
                child: SingleChildScrollView(
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

                      Align(
                        alignment: Alignment.center,
                        child: ProfileImageWidget(
                          width: size.width * 0.3,
                          height: size.width * 0.3,
                          file: file,
                          url: user.profileImageUrl,
                          onPressed: ()async{
                            final picker = ImagePicker();

                            final pickedFile = await picker.getImage(source: ImageSource.gallery);
                            if (pickedFile != null) {
                              setState(() {
                                file = File(pickedFile.path);
                              });
                            }
                          },
                        ),
                      ),
                      CustomTextField(
                          width: MediaQuery.of(context).size.width * 0.7,
                          hintText: "Username",
                          controller: username,
                          icon: Icons.person
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.02,),
                      CustomTextField(
                        width: MediaQuery.of(context).size.width * 0.7,
                        hintText: "Email",
                        controller: email,
                        icon: Icons.email_outlined,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.02,),
                      CustomTextField(
                        width: MediaQuery.of(context).size.width * 0.7,
                        hintText: "Phone Number",
                        controller: phoneNumber,
                        icon: Icons.phone,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.05,),
                      CustomDropDown(
                        label: "Institution",
                        width: size.width * 0.8,
                        height: size.height * 0.13,
                        onChanged: (value){
                          institution = value;//todo replace with controller?
                        },
                        items: [
                          "Please Select",
                          "Ashesi University",
                          "",
                          ""
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.05,),
                      CustomRoundedButton(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text("Save Changes", style: TextStyle(color: Colors.white), overflow: TextOverflow.fade,),
                          color: resources.secondaryColor,
                          onPressed: () async{
                            user.phoneNumber = phoneNumber.text;
                            user.email = email.text;
                            user.username = username.text;
                            if (file != null)
                              await uploadImage(user: user, image: file!);
                            await updateProfile(user);
                            Navigator.pop(context);
                          })

                    ],
                  ),
                ),
                builder: (context,value, child){
                  return ShaderMask(
                    blendMode: BlendMode.modulate,
                    shaderCallback: (rect){
                      return RadialGradient(
                          radius:   value * 5,
                          stops: [0, 0.5, 0.6, 1],
                          colors: [
                            Colors.white,
                            Colors.white,
                            // resources.secondaryColor,
                            // resources.primaryColor,
                            Colors.transparent,
                            Colors.transparent,
                          ],
                          // center: FractionalOffset(0.95,0.9)
                          center: Alignment(0.5,-0.5)
                      )
                          .createShader(rect);
                    },
                    child: child,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
