

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_project/utils/objects/paymentMethod.dart';
import 'package:ev_project/utils/objects/provider/rideUser.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;

const String ROOT = "users/";
const String PAYMENT_METHOD_PATH = "/profile/finances";
const String PROFILE_PATH = "/profile/biodata";
const String TRIP_HISTORY_PATH = "/trip_history";
const String IMAGE_PATH = "/profileImage";



Future<String?> addPaymentMethod(PaymentMethod method)async{
  String? id;

  if (method.isNew) {
    DocumentReference ref = await firestore.collection(PAYMENT_METHOD_PATH).add(method.toMap());
    id = ref.id;
  }
  else {
    await firestore.doc(PAYMENT_METHOD_PATH + "/${method.id}").set(
        method.toMap());
  }
  return id;
}

///Update the saved data of [user] on firestore
Future<void> updateProfile(RideUser user) async{//todo update firebase auth email, password etc
  firestore.doc(ROOT + user.id + PROFILE_PATH).set(user.asMap());//todo include uploadImage here?
}


///Uploads [image] to [user] folder on cloud storage
Future<void> uploadImage({required RideUser user, required File image}) async{
  await storage.ref(user.id + IMAGE_PATH).putFile(image);
  user.profileImageUrl = await storage.ref(user.id + IMAGE_PATH).getDownloadURL();

}


///Returns the user profile information saved on firebase. if none exists, null is returned
Future<Map<String, dynamic>?> getUserProfile(String userId) async{
Map<String, dynamic>? data = (await  firestore.doc(ROOT + userId + PROFILE_PATH)
    .get() ).data();
return data;
}