

import 'package:ev_project/utils/objects/location.dart';

class RideRequest{
  late String id;
  late Location pickupLocation;
  late DateTime startDateTime;
  late DateTime completionDateTime;
  late DateTime requestDateTime;
  late Location dropOffLocation;
  late double? fare;

}