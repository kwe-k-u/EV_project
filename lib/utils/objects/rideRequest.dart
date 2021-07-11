

import 'package:ev_project/utils/objects/rideLocation.dart';

class RideRequest{
  late String _id;
  late RideLocation pickupLocation;
  late DateTime? startDateTime;
  late DateTime? completionDateTime;
  late DateTime requestDateTime;
  late RideLocation dropOffLocation;
  late double? fare;


  //Returns id of the request. If none exists, the hashcode of the request is used
  String get id => _id ;

  RideRequest.fromJson(Map<String, dynamic> map){
    this._id = map["id"];
    this.pickupLocation = RideLocation.fromJson(map["pickupLocation"]);
    this.startDateTime = map["startDateTime"];
    this.requestDateTime = map["requestDateTime"];
    this.completionDateTime = map["completionDateTime"];
    this.dropOffLocation = RideLocation.fromJson(map["dropOffLocation"]);
    this.fare = map["fare"];
  }


  Map<String, dynamic> asMap(){
    return {
      "id" : this.id,
      "pickupLocation" : this.pickupLocation.asMap(),
      "dropOffLocation" : this.dropOffLocation.asMap(),
      "startDateTime" : this.startDateTime,
      "requestDateTime" : this.requestDateTime,
      "completionDateTime" : this.completionDateTime,
      "fare" : this.fare
    };
  }

}