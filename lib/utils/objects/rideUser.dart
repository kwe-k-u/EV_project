
import 'package:ev_project/utils/objects/paymentMethod.dart';
import 'package:ev_project/utils/services/firebaseStorage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RideUser{
  late String username;
  late String email;
  late String id;
  late String? phoneNumber;
  late String? institution;
  late String profileImageUrl;
  late List<PaymentMethod> paymentMethods;
  late int currentPaymentMethodIndex;


  RideUser.fromMapAndUser(User user, Map<String, dynamic>? map){
    dynamic data(String key){
      if (map == null)
        return null;
      return map["key"];
    }


    this.email = user.email!;
    this.phoneNumber = user.phoneNumber ?? data("phoneNumber") ?? "";
    this.id = user.uid;
    this.profileImageUrl = user.photoURL ?? data("photoUrl") ?? "";
    this.username = user.displayName ?? user.email!;
    this.paymentMethods = data("paymentMethods") ?? [PaymentMethod("Cash", "", PaymentMethodType.cash)];
    this.currentPaymentMethodIndex = data("currentPaymentMethodIndex") ?? 0;
    this.institution = data("institution");


    if (map == null)
      updateProfile(this.asMap());

  }





  Map<String, dynamic> asMap(){
    return {
      "id" : id, //todo remove id (redundant)
      "phoneNumber" : phoneNumber,
      "photoUrl" : profileImageUrl,
      // "paymentMethods" : paymentMethods,//todo implement #1
      //iterate through methods, and parse
      "currentPaymentMethodIndex" : currentPaymentMethodIndex,
      "institution" : institution
    };
  }



}

