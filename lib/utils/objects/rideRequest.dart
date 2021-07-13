

import 'package:ev_project/utils/objects/rideLocation.dart';

class RideRequest{
  late String _id;
  late RideLocation pickupLocation;
  DateTime? startDateTime;
  DateTime? completionDateTime;
  late DateTime requestDateTime;
  late RideLocation dropOffLocation;
  double? fare;
  //todo method to generate id


  //Returns id of the request. If none exists, the hashcode of the request is used
  String get id => _id;

  RideRequest({
     String? id,
    required RideLocation pickupLocation,
    required DateTime requestDateTime,
    DateTime? completionDateTime,
    DateTime? startDateTime,
    required RideLocation dropOffLocation,
    double? fare
  }){
    this._id = id ?? this.hashCode.toString();
    this.pickupLocation = pickupLocation;
    this.requestDateTime = requestDateTime;
    this.completionDateTime = completionDateTime;
    this.requestDateTime = requestDateTime;
    this.dropOffLocation = dropOffLocation;
    this.fare = fare;
  }


  RideRequest.fromJson(Map<String, dynamic> map){
    this._id = map["id"] ?? this.hashCode.toString();
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