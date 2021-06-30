import 'package:ev_project/ui/pages/addPromoCodePage.dart';
import 'package:ev_project/ui/widgets/paymentOptionsPopup.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';


class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({Key? key}) : super(key: key);

  @override
  _PaymentMethodsPageState createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {

  final AppResources resources = AppResources();
  List<bool> _selected = [true, false, false];

  // _PaymentMethodsPageState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.app_settings_alt_outlined),
      //   onPressed: () {
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
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {

                  _selected = [false, false, false];
                  _selected[0] = true;
                });
              },
              title: Text("Cash"),
              leading:
              Icon(Ionicons.cash_outline, color: resources.primaryColor),
              trailing: _selected[0] ?Icon(Icons.check_circle, color: Colors.green): null,
            ),
            ListTile(
              onTap: () {
                setState(() {

                  _selected = [false, false, false];
                  _selected[1] = true;
                });
              },
              title: Text("Mobile money"),
              subtitle: Text("+233******48"),
              leading:
              Icon(Ionicons.phone_portrait, color: resources.primaryColor),
              onLongPress: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Are you sure?"),
                      content: Text("Remove this payment option"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("No")),
                        TextButton(onPressed: () {}, child: Text("Yes")),
                      ],
                    ));
              },
              trailing: _selected[1] ?Icon(Icons.check_circle, color: Colors.green): null,
            ),
            ListTile(
              onTap: () {
                setState(() {

                  _selected = [false, false, false];
                  _selected[2] = true;
                });
              },
              title: Text("Visa Card"),
              subtitle: Text("9904 *******05"),
              leading:
              Icon(Ionicons.card_outline, color: resources.primaryColor),

              onLongPress: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Are you sure?"),
                      content: Text("Remove this payment option"),
                      actions: [
                        TextButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text("No")),
                        TextButton(onPressed: () {}, child: Text("Yes")),
                      ],
                    ));
              },
              trailing: _selected[2] ?Icon(Icons.check_circle, color: Colors.green): null,
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
              title: Text("Add payment method"),
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
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            ListTile(
              title: Text("Enter promo code"),
              leading: Icon(Ionicons.megaphone, color: resources.primaryColor),
              onTap: () {
                AppResources.openPage(context, AddPromoCodePagePage());
              },
            ),
          ],
        ),
      ),
    );
  }
}



