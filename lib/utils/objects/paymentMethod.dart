

import 'package:ev_project/utils/helper/helperMethods.dart';

class PaymentMethod{
  String? id;
  late String name;
  late String value;
  late PaymentMethodType type;



  PaymentMethod(String name, String value, PaymentMethodType type, {String? id}){
    this.name = name;
    this.value = value;
    this.type = type;
    this.id = id;
  }


  ///Returns a boolean value to indicate if the method has a firestore id (exists) or is new
  get isNew=> this.id == null;

  PaymentMethod.fromJson(Map<String,dynamic> map){
    this.name = map["name"];
    this.type = parseMethodType(map["type"]);
    this.value = map["value"];

    // return this;
  }



  Map<String, dynamic> toMap(){
    return {
      "name" : this.name,
      "type" : parseMethodType(type, type: PaymentMethod),
      "value" : value
    };
    
    
  }
}



enum PaymentMethodType{
  cash,
  mobile_money,
  credit_card
}