import 'package:ev_project/ui/pages/pamentmethod/creditCardPaymentMethodPage.dart';
import 'package:ev_project/ui/pages/pamentmethod/mobileMoneyPaymentMethodPage.dart';
import 'package:ev_project/ui/widgets/customButton.dart';
import 'package:ev_project/ui/widgets/customTextField.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:ev_project/utils/objects/paymentMethod.dart';
import 'package:ev_project/utils/services/firebaseStorage.dart';
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
      return MobileMoneyPaymentMethodPage();

    return CreditCardPaymentMethodPage();
  }




}