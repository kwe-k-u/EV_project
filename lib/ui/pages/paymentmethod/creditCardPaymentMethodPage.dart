import 'package:ev_project/ui/widgets/customButton.dart';
import 'package:ev_project/ui/widgets/customTextField.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:ev_project/utils/objects/paymentMethod.dart';
import 'package:ev_project/utils/objects/provider/rideUser.dart';
import 'package:ev_project/utils/services/firebaseStorage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ionicons/ionicons.dart';

class CreditCardPaymentMethodPage extends StatefulWidget {
  const CreditCardPaymentMethodPage({Key? key}) : super(key: key);

  @override
  _CreditCardPaymentMethodPageState createState() => _CreditCardPaymentMethodPageState();
}

class _CreditCardPaymentMethodPageState extends State<CreditCardPaymentMethodPage> {
  AppResources resources = AppResources();
  TextEditingController name = new TextEditingController();
  TextEditingController number = new TextEditingController();
  TextEditingController date = new TextEditingController();
  TextEditingController ccv = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
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
                hintText: 'Custom Name',
                controller: name,
                icon: Ionicons.card_outline,
                keyboardType: TextInputType.text,
              ),
              CustomTextField(
                width: MediaQuery.of(context).size.width * 0.9,
                hintText: 'Card Number',
                controller: number,
                icon: Ionicons.card_outline,
                keyboardType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextField(
                    width: MediaQuery.of(context).size.width * 0.4,
                    hintText: "Expiry Date",
                    controller: date,
                    keyboardType: TextInputType.number,
                  ),
                  CustomTextField(
                    width: MediaQuery.of(context).size.width * 0.4,
                    hintText: "CCV",
                    controller: ccv,
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
                  child: Text("Add Method",
                      style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.fade,
                  ),
                  onPressed: (){
                    PaymentMethod method  = new PaymentMethod(name.text, number.text, PaymentMethodType.credit_card);//todo expiry date
                    addPaymentMethod(context.read<RideUser>(), method).then((value) {

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: resources.primaryColor,
                            content: Text("Successfully added credit card", overflow: TextOverflow.fade,),
                          )
                      );
                      Navigator.pop(context);

                    }).onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.orange,
                            content: Text("Error. Try again in a few minutes", overflow: TextOverflow.fade,),
                          )
                      );
                    });

                    // PaymentMethod method = new PaymentMethod("Credit card", number.text, PaymentMethodType.mobile_money);
                    // addPaymentMethod(method).then((value) {
                    //   if (value != null)

                    // }).onError((error, stackTrace) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(
                    //         backgroundColor: Colors.orange,
                    //         content: Text("Error. Try again in a few minutes"),
                    //       )
                    //   );
                    // });
                  },
                ),
              )

            ],
          )
      ),
    );
  }
}
