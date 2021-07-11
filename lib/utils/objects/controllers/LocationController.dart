

import 'package:ev_project/utils/objects/place_search.dart';
import 'package:ev_project/utils/services/locationHandler.dart';
import 'package:flutter/cupertino.dart';

class LocationController extends TextEditingController{
  Map<String,String> _suggestions = {};
  ///Returns a list of places that have names that match the current value of
  ///the controller
  ///
  /// suggestions are a map with placeId as keys and place names as values
  Map<String,String> get suggestions => this._suggestions;

  LocationController() : super();

  @override
  set text(newValue) {
    super.text = newValue;
    _updateSuggestions();
  }


  Future<void> _updateSuggestions() async{
    _suggestions = {};
    List<PlaceSearch> places = await getPlaceSuggestions(text);
    places.forEach((element) {
      _suggestions[element.placeId] = element.name;
    });
  }
}