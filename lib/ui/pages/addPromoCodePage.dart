import 'package:ev_project/ui/widgets/customButton.dart';
import 'package:ev_project/ui/widgets/customTextField.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class AddPromoCodePagePage extends StatelessWidget {
   AddPromoCodePagePage({Key? key}) : super(key: key);
   final AppResources resources = AppResources();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   heroTag: "",
        //   child: Icon(Icons.app_settings_alt_outlined),
        //   onPressed: (){
        //     resources.sendFeedback(context);
        //   },
        // ),
        body: Container(
          child: Column(
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
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              CustomTextField(
                width: MediaQuery.of(context).size.width * 0.9,
                hintText: '\t\tPromo Code',
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomRoundedButton(
                  color: resources.secondaryColor,
                  child: Text("Check Promo Code", style: TextStyle(color: Colors.white), overflow: TextOverflow.fade,),
                  onPressed: (){
                    String promoText;
                    bool boolVal = Random().nextDouble() <0.5;
                    if (boolVal)
                      promoText = "Promo Code does not exist";
                    else
                      promoText = "You will receive a 10% on your next trip";

                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: boolVal ? Colors.orange : resources.primaryColor,
                        content: Text(promoText, overflow: TextOverflow.fade,),
                      )
                    );
                    Navigator.pop(context);
                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
