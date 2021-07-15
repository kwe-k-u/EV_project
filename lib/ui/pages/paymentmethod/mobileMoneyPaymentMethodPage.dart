import 'package:ev_project/ui/widgets/customButton.dart';
import 'package:ev_project/ui/widgets/customTextField.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:ev_project/utils/objects/paymentMethod.dart';
import 'package:ev_project/utils/objects/provider/rideUser.dart';
import 'package:ev_project/utils/services/firebaseStorage.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class MobileMoneyPaymentMethodPage extends StatefulWidget {
  // final PaymentMethod? method;
  MobileMoneyPaymentMethodPage({Key? key}) : super(key: key);

  @override
  _MobileMoneyPaymentMethodPageState createState() => _MobileMoneyPaymentMethodPageState();
}

class _MobileMoneyPaymentMethodPageState extends State<MobileMoneyPaymentMethodPage> {
  AppResources resources = AppResources();
  TextEditingController number = TextEditingController();
  TextEditingController name = TextEditingController();
  // late PaymentMethod method;


  @override
  void initState() {
    super.initState();
    // if (widget.method != null) {
    //   method = widget.method!;
    //   number.text = method.value;

    // }
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body:  Column(
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
                hintText: 'Custom name',
                controller: name,
                icon: Ionicons.phone_portrait,
                keyboardType: TextInputType.text,
              ),
              CustomTextField(
                width: MediaQuery.of(context).size.width * 0.9,
                hintText: 'Mobile Money Number',
                controller: number,
                icon: Ionicons.phone_portrait,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomRoundedButton(
                  color: resources.secondaryColor,
                  child: Text("Add Method", style: TextStyle(color: Colors.white), overflow: TextOverflow.fade,),
                  onPressed: (){




                    PaymentMethod method = new PaymentMethod(name.text, number.text, PaymentMethodType.mobile_money);
                    addPaymentMethod(context.read<RideUser>(),method).then((value) {
                      if (value != null)
                        method.id = value;ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: resources.primaryColor,
                            content: Text("Successfully added mobile money", overflow: TextOverflow.fade,),
                          )
                      );
                      Navigator.pop(context, method);

                    }).onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.orange,
                            content: Text("Error. Try again in a few minutes", overflow: TextOverflow.fade,),
                          )
                      );
                    });
                  },
                ),
              )

            ],
          )
      ),
    );
  }
}
