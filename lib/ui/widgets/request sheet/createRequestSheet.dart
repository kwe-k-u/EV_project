import 'package:ev_project/ui/widgets/customButton.dart';
import 'package:ev_project/ui/widgets/request%20sheet/requestRideWidget.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:ev_project/utils/objects/provider/rideUser.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:provider/provider.dart';


class CreateRequestSheet extends StatefulWidget {
  final Widget body;
  CreateRequestSheet({Key? key, required this.body}) : super(key: key);

  @override
  _CreateRequestSheetState createState() => _CreateRequestSheetState();
}

class _CreateRequestSheetState extends State<CreateRequestSheet> {
  SheetController controller = new SheetController();
  TextStyle textStyle = new TextStyle();
  AppResources resources = AppResources();
  bool tapped = false;
  bool show = false;
  late RideUser user = context.read<RideUser>();

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
      closeOnBackButtonPressed: true,
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
          SnapSpec.headerFooterSnap,
          1.0,
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
      footerBuilder: buildFooter,
      builder: buildChild,
    );
  }








  Widget buildHeader(BuildContext context, SheetState state) {
    if (state.extent > 0.5)

      return _expandedHeader();
    else
      return _collapsedHeader();
  }

  Widget buildFooter(BuildContext context, SheetState state) {



    return Container(
      // shadowDirection: ShadowDirection.top,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      // color: resources.primaryColor.withAlpha(100),
      // shadowColor: Colors.black12,
      child: Row(
        children: <Widget>[
          SheetListenerBuilder(
            buildWhen: (oldState, newState) => newState.progress < 0.25 || newState.progress > 0.75,
            // buildWhen: (oldState, newState) => newState.progress < 0.25 || newState.progress < 0.75,
            builder: (context, state) {
              final isExpanded = state.isExpanded;

              return CustomRoundedButton(
                child: Text(isExpanded ? "Cancel Request" : "Request Ride",
                  overflow: TextOverflow.fade,
                  style: TextStyle(color: Colors.white),),
                color: isExpanded ? Colors.red : resources.secondaryColor,
                onPressed: !isExpanded
                    ? () => controller.scrollTo(state.maxScrollExtent)
                    : controller.collapse,
              );

            },
          ),
        ],
      ),
    );
  }

  Widget buildChild(BuildContext context, SheetState state) {

    return RequestRideWidget();
  }






  Widget _expandedHeader(){
    return Card(
      elevation: 4.0,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8.0),
        // shadowColor: Colors.black12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 2),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 16,
                height: 4,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Create a trip', overflow: TextOverflow.fade,
              style: textStyle.copyWith(
                fontSize: 22,
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }


  Widget _collapsedHeader(){
    return Container(
      color: resources.primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4.0),
      // shadowColor: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 2),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 16,
              height: 4,
              // borderRadius: 2,
              color:
              Colors.grey,
              // Colors.grey.withOpacity(.5 * (1 - interval(0.7, 1.0, state.progress))),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Welcome back, ${user.username}',
            overflow: TextOverflow.fade,
            style: textStyle.copyWith(
              color: Colors.white.withAlpha(150),
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Where would you like to go?', overflow: TextOverflow.fade,
            style: textStyle.copyWith(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

}
