import 'package:ev_project/ui/widgets/customButton.dart';
import 'package:ev_project/ui/widgets/profileImage.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:ev_project/utils/objects/provider/appState.dart';
import 'package:ev_project/utils/objects/provider/rideUser.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:provider/provider.dart';


class RequestStatusWidget extends StatefulWidget {

  final Widget body;
  RequestStatusWidget({Key? key, required this.body}) : super(key: key);

  @override
  _RequestStatusWidgetState createState() => _RequestStatusWidgetState();
}

class _RequestStatusWidgetState extends State<RequestStatusWidget> {
  SheetController controller = new SheetController();
  TextStyle textStyle = new TextStyle();
  AppResources resources = AppResources();
  late RideUser user;
  late AppState appState;
  bool tapped = false;
  bool show = false;


  @override
  void initState() {
    super.initState();
    user = context.read<RideUser>();
    appState = context.read<AppState>();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingSheet(
      duration: const Duration(milliseconds: 900),
      controller: controller,
      color: Colors.white,
      shadowColor: Colors.black26,
      elevation: 12,
      maxWidth: 500,
      cornerRadius: 16,
      cornerRadiusOnFullscreen: 12.0,
      closeOnBackdropTap: true,
      addTopViewPaddingOnFullscreen: true,
      isBackdropInteractable: true,
      border: Border.all(
        color: Colors.grey.shade300,
        width: 0.5,
      ),
      snapSpec: SnapSpec(
        snap: true,
        positioning: SnapPositioning.relativeToAvailableSpace,
        snappings: const [
          SnapSpec.headerSnap,
          // 0.2,
          0.5,
        ],
        onSnap: (state, snap) {
          //rebuild UI
          setState(() {

          });
        },
      ),
      liftOnScrollHeaderElevation: 12.0,
      liftOnScrollFooterElevation: 12.0,
      body: widget.body,
      headerBuilder: buildHeader,
      // footerBuilder: buildFooter,
      builder: buildChild,
    );
  }








  Widget buildHeader(BuildContext context, SheetState state) {
    return Container(
      child: ListTile(
        leading: ProfileImageWidget(
          url: user.profileImageUrl,
          width: MediaQuery.of(context).size.width * 0.12,
          height: MediaQuery.of(context).size.width * 0.12,
        ),
        title: Text("Your ride is arriving", overflow: TextOverflow.fade,),
        subtitle: Text("10 minutes away", overflow: TextOverflow.fade,),
        trailing: SizedBox(
          width: MediaQuery.of(context).size.width *0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Ionicons.heart,
                color: Colors.red,
                size: 16.0,
              ),
              Text("62", overflow: TextOverflow.fade,)
            ],
          ),
        ),
      ),
    );
  }


  Widget buildChild(BuildContext context, SheetState state) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.38,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Trip details",
                  overflow: TextOverflow.fade,
                  style: TextStyle(color: Colors.grey)
              )
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  flex: 1,
                  child: Icon(Icons.location_pin),
                ),
                Flexible(
                  flex: 4,
                  child: Text("Pick up location", overflow: TextOverflow.fade,),
                ),


                Flexible(
                  flex: 1,
                  child: Icon(Icons.location_pin),
                ),
                Flexible(
                  flex: 4,
                  child: Text("Destination location", overflow: TextOverflow.fade,),
                ),
              ],
            ),
          ),

          Divider(thickness: 2.0,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: size.width * 0.3,
                child: Column(
                  children: [
                    Text("Estimated cost",
                      style: TextStyle(
                          color: Colors.grey),
                      overflow: TextOverflow.fade,
                    ),
                    Text("8.45",
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0
                      ),
                    ),
                    Text("GHC", overflow: TextOverflow.fade,)
                  ],
                ),
              ),
              SizedBox(
                width: size.width * 0.3,
                child: Column(
                  children: [
                    Text("Estimated duration",
                        style: TextStyle(color: Colors.grey),
                      overflow: TextOverflow.fade,
                    ),
                    Text("15",
                      overflow: TextOverflow.fade,
                        style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0
                    ),
              ),
                    Text("minutes", overflow: TextOverflow.fade,)
                  ],
                ),
              ),
              CustomRoundedButton(
                width: size.width * 0.15,
                  height: size.height *0.065,
                  onPressed: ()=> null,
                  child: Icon(Icons.message_outlined),
                color: resources.secondaryColor,
              )
            ],
          ),


          Spacer(flex: 2,),
          CustomRoundedButton(
            width: MediaQuery.of(context).size.width * 0.6,
              child: Text("CANCEL RIDE",
                overflow: TextOverflow.fade,
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              color: Colors.red,
              onPressed: () {
              appState.requestState = RequestState.Cancel;
              }
          ),

          Spacer(flex: 5,)
        ],
      ),
    );
  }




}
