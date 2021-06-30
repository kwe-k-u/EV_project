import 'package:ev_project/ui/widgets/customButton.dart';
import 'package:ev_project/ui/widgets/customTextField.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';


class AddPaymentMethodPage extends StatefulWidget {
  final bool mobileMoneyBool;
  AddPaymentMethodPage({Key? key, required this.mobileMoneyBool}) : super(key: key);

  @override
  _AddPaymentMethodPageState createState() => _AddPaymentMethodPageState(mobileMoneyBool);
}

class _AddPaymentMethodPageState extends State<AddPaymentMethodPage> {
  final AppResources resources = AppResources();
  final mobileMoneyBool;

  _AddPaymentMethodPageState(this.mobileMoneyBool);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.app_settings_alt_outlined),
      //   onPressed: (){
      //     resources.sendFeedback(context);
      //   },
      // ),
      body: Container(
        padding: EdgeInsets.only(
          top:12.0
        ),
        child: _showPage(),
      ),
    );
  }




  Widget _showPage(){
    if(mobileMoneyBool)
      return _mobileMoney();
    return _creditCard();
  }


  Widget _mobileMoney(){
    return Column(
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
          hintText: 'Mobile Money Number',
          icon: Ionicons.card_outline,
          keyboardType: TextInputType.number,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomRoundedButton(
            color: resources.secondaryColor,
            child: Text("Add Method", style: TextStyle(color: Colors.white)),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        )

      ],
    );
  }


  Widget _creditCard(){
    return Column(
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
          hintText: 'Card Number',
          icon: Ionicons.card_outline,
          keyboardType: TextInputType.number,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextField(
              width: MediaQuery.of(context).size.width * 0.4,
              hintText: "Expiry Date",
              keyboardType: TextInputType.number,
            ),
            CustomTextField(
              width: MediaQuery.of(context).size.width * 0.4,
              hintText: "CCV",
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomRoundedButton(
            color: resources.secondaryColor,
            child: Text("Add Method", style: TextStyle(color: Colors.white)),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        )

      ],
    );
  }


}
