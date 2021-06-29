import 'package:ev_project/ui/widgets/customButton.dart';
import 'package:ev_project/ui/widgets/customTextField.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sliding_sheet/sliding_sheet.dart';


class RequestStatusSheet extends StatefulWidget {

  final Widget body;
  RequestStatusSheet({Key? key, required this.body}) : super(key: key);

  @override
  _RequestStatusSheetState createState() => _RequestStatusSheetState();
}

class _RequestStatusSheetState extends State<RequestStatusSheet> {
  SheetController controller = new SheetController();
  TextStyle textStyle = new TextStyle();
  AppResources resources = AppResources();
  bool tapped = false;
  bool show = false;



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
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.network("https://picsum.photos/200",
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width * 0.12,
              height: MediaQuery.of(context).size.width * 0.12,
            )
        ),
        title: Text("Your ride is arriving"),
        subtitle: Text("10 minutes away"),
        trailing: SizedBox(
          width: MediaQuery.of(context).size.width *0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Ionicons.heart,
                color: Colors.red,
                size: 16.0,
              ),
              Text("62")
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
                  child: Text("Pick up location"),
                ),


                Flexible(
                  flex: 1,
                  child: Icon(Icons.location_pin),
                ),
                Flexible(
                  flex: 4,
                  child: Text("Destination location"),
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
                    Text("Estimated cost", style: TextStyle(color: Colors.grey),),
                    Text("8.45",
                      style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0
                      ),
                    ),
                    Text("GHC")
                  ],
                ),
              ),
              SizedBox(
                width: size.width * 0.3,
                child: Column(
                  children: [
                    Text("Estimated duration",
                        style: TextStyle(color: Colors.grey)
                    ),
                    Text("15",
                        style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0
                    ),
              ),
                    Text("minutes")
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
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              color: Colors.red,
              onPressed: () {}
          ),

          Spacer(flex: 5,)
        ],
      ),
    );
  }




}
