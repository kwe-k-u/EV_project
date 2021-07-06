

import 'package:ev_project/utils/objects/paymentMethod.dart';

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

  switch(type){
    case PaymentMethodType:
      return method(data);
  }


}