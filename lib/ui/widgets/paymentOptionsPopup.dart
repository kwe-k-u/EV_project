import 'package:ev_project/ui/pages/paymentmethod/addPaymentMethodPage.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';



class PaymentOptionsPopup extends StatelessWidget {
  PaymentOptionsPopup({Key? key}) : super(key: key);
  final AppResources resources = AppResources();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:12.0, right:12.0, top:12.0),
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: [
          Text("Select a new Payment Method",
            overflow: TextOverflow.fade,
            style: TextStyle(
                fontWeight: FontWeight.w600
            ),
          ),

          ListTile(
            onTap: (){
              Navigator.pop(context);
              AppResources.openPage(context, AddPaymentMethodPage(mobileMoneyBool: true,));
            },
            title: Text("Mobile money", overflow: TextOverflow.fade,),
            leading: Icon(Ionicons.phone_portrait, color: resources.primaryColor),
          ),

          ListTile(
            onTap: (){
              Navigator.pop(context);
              AppResources.openPage(context, AddPaymentMethodPage(mobileMoneyBool: false,));
            },
            title: Text("Visa Card", overflow: TextOverflow.fade,),
            leading: Icon(Ionicons.card_outline, color: resources.primaryColor),
          ),
        ],
      )
    );
  }
}
