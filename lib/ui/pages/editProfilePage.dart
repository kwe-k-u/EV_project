import 'package:ev_project/ui/widgets/customButton.dart';
import 'package:ev_project/ui/widgets/customTextField.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final AppResources resources = AppResources();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.app_settings_alt_outlined),
        onPressed: (){
          resources.sendFeedback(context);
        },
      ),
      body: Container(
        padding: EdgeInsets.only(top: 12.0),
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
              child: InkWell(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                    child: Image.network("https://picsum.photos/200",
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.3,
                    )
                ),
                onTap: ()async{
                  final picker = ImagePicker();

                  final pickedFile = await picker.getImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    // return File(pickedFile.path);
                  }
                },
              ),
            ),
            CustomTextField(
              width: MediaQuery.of(context).size.width * 0.7,
              hintText: "Username",
              icon: Icons.person
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.02,),
            CustomTextField(
              width: MediaQuery.of(context).size.width * 0.7,
              hintText: "Email",
              icon: Icons.email_outlined,
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.02,),
            CustomTextField(
              width: MediaQuery.of(context).size.width * 0.7,
              hintText: "Phone Number",
              icon: Icons.phone,
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.05,),
            CustomRoundedButton(
              width: MediaQuery.of(context).size.width * 0.7,
                child: Text("Save Changes", style: TextStyle(color: Colors.white),),
                color: resources.secondaryColor,
                onPressed: (){
                  Navigator.pop(context);
                })

          ],
        ),
      ),
    );
  }
}
