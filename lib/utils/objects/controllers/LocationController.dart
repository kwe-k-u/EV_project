

import 'package:ev_project/utils/objects/place_search.dart';
import 'package:ev_project/utils/services/locationHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends TextEditingController{
  LatLng? _latLng;
  ///Returns a list of places that have names that match the current value of
  ///the controller
  ///
  /// suggestions are a map with placeId as keys and place names as values

  LocationController() : super();


  LatLng? get latLng => this._latLng!;



  @override
  set text(newValue) {
    super.text = newValue;
    getLatLngFromAddress(newValue).then(
            (value) {
              _latLng = value;
              notifyListeners();
            });

  }


  set latlng(LatLng latLng){
    this._latLng = latLng;
    getAddressFromLatLng(latLng).then((value){
      super.text = value;
      notifyListeners();
    });

  }


  void setValues(LatLng latLng,String name){
    this._latLng = latLng;
    super.text = name;
    notifyListeners();
  }


}