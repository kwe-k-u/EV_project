


import 'package:google_maps_flutter/google_maps_flutter.dart';

class RideLocation{
  late String name;

  late LatLng latLng;

  RideLocation({required this.latLng, required this.name});

  RideLocation.fromJson(Map<String, dynamic> map){
    this.name = map["name"];
    this.latLng = new LatLng(map["lat"], map["lng"]);
  }

  Map<String, dynamic> asMap(){
    return {
      "name" : this.name,
      "lat" : this.latLng.latitude,
      "lng" : this.latLng.longitude,
    };
  }


}