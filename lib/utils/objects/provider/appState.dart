


import 'package:flutter/material.dart';



class AppState extends ChangeNotifier{
  late RequestState _requestState = RequestState.Idle;



  RequestState get requestState => this._requestState;


  set requestState(RequestState state){
    this._requestState = state;
    if (state == RequestState.Cancel){
      //todo method to cancel the trip and then change state to idle;
      this._requestState = RequestState.Idle; //todo after waiting cancel future
    }
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