


import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class AppState extends ChangeNotifier{
  RequestState _requestState = RequestState.Idle;
  LatLng? _center;


  RequestState get requestState => this._requestState;
  LatLng get center {
    var val = this._center ?? LatLng(0, 0);
    //this is used to trigger null equivalent events for child listeners
    //necessary because we want to ensure "select from map" feature doesn't
    //the wrong coordinate
    this._center = null;

    return val;
  }

  set requestState(RequestState state){
    this._requestState = state;
    if (state == RequestState.Cancel){
      //todo method to cancel the trip and then change state to idle;
      this._requestState = RequestState.Idle; //todo after waiting cancel future
    }
    notifyListeners();
  }

  set center(LatLng center){
    this._center = center;
    notifyListeners();
  }



}


enum RequestState {
  Idle,
  Searching_rider,
  Rider_found,
  On_trip,
  Cancel

}