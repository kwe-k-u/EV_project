
import 'package:dio/dio.dart';
import 'package:ev_project/utils/objects/rideLocation.dart';
import 'package:ev_project/utils/objects/place_search.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



Future<RideLocation> determinePosition() async {
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
  String placeName = await getAddressFromPosition(position);

  return RideLocation(latLng: LatLng(position.latitude, position.longitude), name: placeName);
}


Future<String> getAddressFromPosition(Position position) async {
  try {
    String location = await getAddressFromLatLng(LatLng(position.latitude, position.longitude));
    return location;

  } catch (e) {
    return "${e.toString()}";
  }
}// From a query


Future<String> getAddressFromLatLng(LatLng latLng) async {
  try {

    Placemark placemark = (await placemarkFromCoordinates(latLng.latitude, latLng.longitude) ).first;
    return placemark.name ?? "";

    // Address place = (await Geocoder.local.findAddressesFromCoordinates(new Coordinates(latLng.latitude, latLng.longitude))).first;

    return  "place.addressLine";
  } catch (e) {
    return "${e.toString()}";
  }
}



///Converts a address of a [place] as its LatLng coordinates
Future<LatLng> getLatLngFromAddress(String place) async{
  Location location = (await locationFromAddress(place)).first;
  LatLng latLng = new LatLng(location.latitude, location.longitude);
  return latLng;
}



Future<LatLng> getMapCenter(GoogleMapController controller) async{
  LatLng center;

  var visibleRegion = await controller.getVisibleRegion();
  center = LatLng(
    (visibleRegion.northeast.latitude + visibleRegion.southwest.latitude) / 2,
    (visibleRegion.northeast.longitude + visibleRegion.southwest.longitude) / 2,
  );

  return center;
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


Future<List<PlaceSearch>> getPlaceSuggestions(String text,{String lang = "en"}) async{

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




