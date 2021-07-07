
import 'package:ev_project/utils/objects/paymentMethod.dart';
import 'package:ev_project/utils/services/firebaseStorage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RideUser with ChangeNotifier{
  late String _username;
  late String _email;
  late String _id;
  late String? _phoneNumber;
  late String? _institution;
  late String _profileImageUrl;
  late List<PaymentMethod> _paymentMethods;
  late int _currentPaymentMethodIndex;


  RideUser();

  RideUser.fromMapAndUser(User user, Map<String, dynamic>? map){
    dynamic data(String key){
      if (map == null)
        return null;
      return map["key"];
    }


    this._email = user.email!;
    this._phoneNumber = user.phoneNumber ?? data("phoneNumber") ?? "";
    this._id = user.uid;
    this._profileImageUrl = user.photoURL ?? data("photoUrl") ?? "";
    this._username = user.displayName ?? user.email!;
    this._paymentMethods = data("paymentMethods") ?? [PaymentMethod("Cash", "", PaymentMethodType.cash)];
    this._currentPaymentMethodIndex = data("currentPaymentMethodIndex") ?? 0;
    this._institution = data("institution");

    if (map == null)
      updateProfile(this);

    notifyListeners();
  }

  void reassign(RideUser user){

     _username = user.username;
    _email = user.email;
    _id = user.id;
     _phoneNumber = user.phoneNumber;
     this._institution = user.institution;
    this._profileImageUrl = user.profileImageUrl;
    this._paymentMethods = user.paymentMethods;
    this._currentPaymentMethodIndex = user.currentPaymentMethodIndex;
    notifyListeners();
  }


  //setter
  set username(String value) {
    _username = value;
    notifyListeners();
  }

  set currentPaymentMethodIndex(int value) {
    _currentPaymentMethodIndex = value;
    notifyListeners();
  }

  set paymentMethods(List<PaymentMethod> value) {
    _paymentMethods = value;
    notifyListeners();
  }


  set profileImageUrl(String value) {
    _profileImageUrl = value;
    notifyListeners();
  }


  set institution(String value) {
    _institution = value;
    notifyListeners();
  }


  set phoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }


  set id(String value) {
    _id = value;
    notifyListeners();
  }


  set email(String value) {
    _email = value;
    notifyListeners();
  }







  //getters
  String get username => _username;
  int get currentPaymentMethodIndex => _currentPaymentMethodIndex;
  List<PaymentMethod> get paymentMethods => _paymentMethods;
  String get profileImageUrl => _profileImageUrl;
  String get institution => _institution ?? "";
  String get phoneNumber => _phoneNumber ?? "";
  String get id => _id;
  String get email => _email;





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

