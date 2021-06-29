import 'package:ev_project/ui/widgets/customButton.dart';
import 'package:ev_project/ui/widgets/customTextField.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';


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
                child: Text(isExpanded ? "Cancel Request" : "Request Ride", style: TextStyle(color: Colors.white),),
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
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.72,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Enter Pickup location")),
          CustomTextField(
            icon: Icons.not_listed_location_outlined,
            width: size.width * 0.7,
          ),


          Align(
              alignment: Alignment.centerLeft,
              child: Text("Enter destination")),
          CustomTextField(
            hintText: "Destination",
            width: size.width * 0.7,
          ),
          Spacer(flex: 1,),
          CustomRoundedButton(
              child: Text("REQUEST RIDE", style: TextStyle(color: Colors.white),),
              color: resources.secondaryColor,
              onPressed: () {
                setState(() {
                  // widget.status = true;
                });
              }
          ),
          SizedBox(height: 2,),
          Divider(thickness: 2.0,),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Cafeteria"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Lobby"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Hakuna"),
            onTap: (){},
          ),

          Spacer(flex: 10,)
        ],
      ),
    );
  }

  // Widget buildSteps(BuildContext context) {
  //   final steps = [
  //     // Step('Go to your pubspec.yaml file.', '2 seconds'),
  //     // Step(
  //     //     "Add the newest version of 'sliding_sheet' to your dependencies.", '5 seconds'),
  //     // Step("Run 'flutter packages get' in the terminal.", '4 seconds'),
  //     // Step("Happy coding!", 'Forever'),
  //   ];
  //
  //   return ListView.builder(
  //     shrinkWrap: true,
  //     physics: const NeverScrollableScrollPhysics(),
  //     itemCount: steps.length,
  //     itemBuilder: (context, i) {
  //       final step = steps[i];
  //
  //       return Padding(
  //         padding: const EdgeInsets.fromLTRB(56, 16, 0, 0),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Text(
  //               step.instruction,
  //               style: textStyle.copyWith(
  //                 fontSize: 16,
  //               ),
  //             ),
  //             const SizedBox(height: 16),
  //             Row(
  //               children: <Widget>[
  //                 Text(
  //                   '${step.time}',
  //                   style: textStyle.copyWith(
  //                     color: Colors.grey,
  //                     fontSize: 15,
  //                   ),
  //                 ),
  //                 const SizedBox(width: 16),
  //                 Expanded(
  //                   child: Container(
  //                     height: 1,
  //                     color: Colors.grey.shade300,
  //                   ),
  //                 )
  //               ],
  //             ),
  //             const SizedBox(height: 8),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }



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
              'Create a trip',
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
            'Welcome back, Kwesi',
            style: textStyle.copyWith(
              color: Colors.white.withAlpha(150),
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Where would you like to go?',
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