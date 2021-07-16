

import 'package:ev_project/utils/appResources.dart';
import 'package:ev_project/utils/objects/paymentMethod.dart';
import 'package:flutter/material.dart';

///Parses enums between strings and the enum type.
///If parsing from string to enum, [type] must be specified.
///If parsing from enum to string, only the enum is passed as [data]
dynamic parseMethodType(dynamic data, {Type? type}){
//============================================================
//      Methods local to the method

  ///converts string representation of payment method types into PaymentMethodtype types
  PaymentMethodType method(String method){
    switch(method){
      case "mobile_money":
        return PaymentMethodType.mobile_money;
      case "credit_card":
        return PaymentMethodType.credit_card;
      default:
        return PaymentMethodType.cash;
    }
  }

  //================================================================
  //main function
  if (type != null)
    return data.toString().split(".").elementAt(1);

      return method(data.toString());


}





///Displays a snackbar with the [message] and [color] passed
void showSnack({
  required BuildContext context,
  required String message,
  Color? color}){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color ?? AppResources().primaryColor,
      )
  );
}