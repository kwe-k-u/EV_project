

import 'package:ev_project/utils/objects/rideLocation.dart';

class RideRequest{
  late String id;
  late RideLocation pickupLocation;
  late DateTime startDateTime;
  late DateTime completionDateTime;
  late DateTime requestDateTime;
  late RideLocation dropOffLocation;
  late double? fare;

}