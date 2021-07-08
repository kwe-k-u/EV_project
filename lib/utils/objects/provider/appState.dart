


import 'package:flutter/material.dart';



class AppState extends ChangeNotifier{
  late RequestState _requestState = RequestState.Idle;



  RequestState get requestState => this._requestState;


  set requestState(RequestState state){
    this._requestState = state;
    notifyListeners();
  }

}


enum RequestState {
  Idle,
  Searching_rider,
  Rider_found,
  On_trip,

}