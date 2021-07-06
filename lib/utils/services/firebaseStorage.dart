
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_project/utils/objects/paymentMethod.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

const String PAYMENT_METHOD_PATH = "/profile/finances";
const String PROFILE_PATH = "/profile/biodata";
const String TRIP_HISTORY_PATH = "/trip_history";
const String ROOT = "users/";



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


Future<void> updateProfile(Map<String, dynamic> map) async{
  firestore.doc(ROOT + map["id"] + PROFILE_PATH).set(map);
}




///Returns the user profile information saved on firebase. if none exists, null is returned
Future<Map<String, dynamic>?> getUserProfile(String userId) async{
Map<String, dynamic>? data = (await  firestore.doc(ROOT + userId + PROFILE_PATH)
    .get() ).data();
return data;
}