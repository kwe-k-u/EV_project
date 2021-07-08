








import 'package:dio/dio.dart';
import 'package:ev_project/utils/objects/location.dart';
import 'package:ev_project/utils/objects/place_search.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



Future<Location> determinePosition() async {
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
  String placeName = await getAddressFromPosition(position);

  return Location(latLng: LatLng(position.latitude, position.longitude), name: placeName);
}


Future<String> getAddressFromPosition(Position position) async {
  try {


    Address place = (await Geocoder.local.findAddressesFromCoordinates(new Coordinates(position.latitude, position.longitude))).first;

    return  place.addressLine;
    // return  "${place.adminArea}, ${place.addressLine} ${place.countryName}";
  } catch (e) {
    return "${e.toString()}";
  }
}// From a query


Future<String> getAddressFromLatLng(LatLng latLng) async {
  try {


    Address place = (await Geocoder.local.findAddressesFromCoordinates(new Coordinates(latLng.latitude, latLng.longitude))).first;

    return  place.addressLine;
  } catch (e) {
    return "${e.toString()}";
  }
}




Future<LatLng> getLatLngFromAddress(String place) async{
  Address location = (await Geocoder.local.findAddressesFromQuery(place)).first;

  LatLng latLng = LatLng(location.coordinates.latitude, location.coordinates.longitude);

  return latLng;
}



// Future<Location> pickLocation(BuildContext context) async{
//   Location location = await Navigator.push(context, MaterialPageRoute(
//       builder: (context)=> PickLocationPage()
//   ));
//
//   return location;
// }



// Future<Direction> getDirections(LatLng pickup, LatLng dropOff) async{
//
//   Dio dio = new Dio();
//   final response = await dio.get(
//       "https://maps.googleapis.com/maps/api/directions/json?",
//       queryParameters: {
//         'origin' : "${pickup.latitude},${pickup.longitude}",
//         'destination' : "${dropOff.latitude},${dropOff.longitude}",
//         'key' : ""//todo add key
//       });
//
//   if (response.statusCode == 200)
//     return Directions.fromMap(response.data);
//
//
//   return null ;
//
// }


Future<List<PlaceSearch>> getPlaceSuggestions(String text, String lang ) async{

  Dio dio = new Dio();
  final response = await dio.get(
      "https://maps.googleapis.com/maps/api/place/autocomplete/json?"
      ,
      queryParameters: {
        "input" : text,
        // 'types' : "(regions)",//keep just in case we change mind about accuracy later on
        "language" : lang,
        'key' : ""//todo add key
      });
  var json = response.data["predictions"] as List;

  return json.map((e) => PlaceSearch.fromJson(e)).toList();

}




