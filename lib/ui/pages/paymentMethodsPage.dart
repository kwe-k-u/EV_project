import 'package:ev_project/ui/pages/addPromoCodePage.dart';
import 'package:ev_project/ui/widgets/paymentOptionsPopup.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:ev_project/utils/objects/paymentMethod.dart';
import 'package:ev_project/utils/objects/provider/rideUser.dart';
import 'package:ev_project/utils/services/firebaseStorage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';


class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({Key? key}) : super(key: key);

  @override
  _PaymentMethodsPageState createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {

  final AppResources resources = AppResources();

  // _PaymentMethodsPageState({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
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
      Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: resources.primaryColor),
              top: BorderSide(width: 0.5, color: resources.primaryColor),
            )),
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text("Payment Methods",
              overflow: TextOverflow.fade,
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),

      ListTile(
        onTap: () {
        },
        title: Text("Cash", overflow: TextOverflow.fade,),
        leading:
        Icon(Ionicons.cash_outline, color: resources.primaryColor),
        trailing: Icon(Icons.check_circle, color: Colors.green),
      ),
      ListTile(
        onTap: () {
          showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel: 'Select a new payment Method',
              barrierColor: Colors.grey.withOpacity(0.5),
              pageBuilder: (context, anim, anim2) => Dialog(
                child: PaymentOptionsPopup(),
              ));
        },
        title: Text("Add payment method", overflow: TextOverflow.fade,),
        leading: Icon(Icons.add, color: resources.primaryColor),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: resources.primaryColor),
              top: BorderSide(width: 0.5, color: resources.primaryColor),
            )),
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text("Promotions",
              overflow: TextOverflow.fade,
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      ListTile(
        title: Text("Enter promo code", overflow: TextOverflow.fade,),
        leading: Icon(Ionicons.megaphone, color: resources.primaryColor),
        onTap: () {
          AppResources.openPage(context, AddPromoCodePagePage());
        },
      ),
    ];
print("restarted");

    return SafeArea(
      child: FutureBuilder(
        initialData: children,
        future: getPaymentMethods(context.read<RideUser>()),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done && !snapshot.hasError){

            List<PaymentMethod> methods = snapshot.data ?? [];
            methods.forEach((element) {
              // setState(() {
              print("top element");
                children.insert(3,
                    MethodListTile(method: element));
              print("top element bottom");

              // });
            });
          }

          return  Scaffold(
            // floatingActionButton: FloatingActionButton(
            //   child: Icon(Icons.app_settings_alt_outlined),
            //   onPressed: () {
            //     resources.sendFeedback(context);
            //   },
            // ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: children,
              ),
            ),
          );
        },
      ),
    );
  }
}


class MethodListTile extends StatelessWidget {
  final PaymentMethod method;
  const MethodListTile({Key? key, required this.method}) : super(key: key);

  IconData icon(PaymentMethodType type){
    switch(type){
      case PaymentMethodType.credit_card:
        return Ionicons.card_outline;
      case PaymentMethodType.mobile_money:
        return Ionicons.phone_portrait;
      default:
        return Ionicons.cash_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("customTile");
    print(method.name);
    print(method.value);

    return ListTile(
      onTap: () {
        // setState(() {
        //
        //   _selected = [false, false, false];
        //   _selected[2] = true;
        // });
      },
      title: Text(method.name, overflow: TextOverflow.fade,),
      subtitle: Text(method.value.replaceRange(2, method.value.length-3, "******"), overflow: TextOverflow.fade,),
      leading:
      Icon(icon(method.type),
          color: AppResources().primaryColor),

      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Are you sure?", overflow: TextOverflow.fade,),
              content: Text("Remove this payment option", overflow: TextOverflow.fade,),
              actions: [
                TextButton(onPressed: () {
                  Navigator.pop(context);
                }, child: Text("No", overflow: TextOverflow.fade,)),
                TextButton(onPressed: () {}, child: Text("Yes", overflow: TextOverflow.fade,)),
              ],
            ));
      },
      // trailing: _selected[2] ?Icon(Icons.check_circle, color: Colors.green): null,
    );
  }
}


