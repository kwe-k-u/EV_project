import 'package:ev_project/utils/appResources.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class TripHistoryTile extends StatelessWidget {
  final AppResources resources = new AppResources();
  final double stars;
  final String destination;
  final String pickup;
  final String date;
  TripHistoryTile(
      {Key? key,
      required this.stars,
      required this.destination,
      required this.pickup,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Card(
      elevation: 12.0,
      child:
      ListTile(
        leading: Container(
          width: size.width * 0.05,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                  child: Icon(Ionicons.location,
                  color: resources.primaryColor,)),
              Align(
                alignment: Alignment.bottomCenter,
                  child: Icon(Ionicons.location,
                    size: 16.0,
                    color: resources.secondaryColor,
                  )
              ),
            ],
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom:12.0),
          child: Text(destination),
        ),
        subtitle: Text(pickup),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                  text: "12.45\t",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                        text: 'GHS',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        )
                    )
                  ]
              ),
            ),
            rating(stars, size),
            Text(
              date,
              style: TextStyle(fontSize: 12.0),
            )
          ],
        ),
      ),
    );
  }
}

Widget rating(double stars, Size size) {
  List<Widget> icons = [];

  for (int i = 1; i <= stars; i++)
    icons.add(Icon(
      Icons.star,
      size: 12.0,
      color: Colors.orange,
    ));

  //if a .5 is included in the rating add it
  if (stars.round() > stars)
    icons.add(Icon(
      Icons.star_half,
      size: 12.0,
      color: Colors.orange,
    ));

  return Container(
    height: 25,
    width: size.width * 0.2,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: icons,
    ),
  );
}
