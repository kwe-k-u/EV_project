

class PlaceSearch {
  String name;
  String placeId;


  PlaceSearch({required this.name, required this.placeId});

  factory PlaceSearch.fromJson(Map<String, dynamic> map){
    return PlaceSearch(
        name: map["description"],
        placeId: map["place_id"]
    );
  }
}
