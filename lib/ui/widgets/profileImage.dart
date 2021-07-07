import 'package:ev_project/ui/widgets/loaderIcon.dart';
import 'package:flutter/material.dart';


class ProfileImageWidget extends StatefulWidget {
  final double width;
  final double height;
  final Function()? onPressed;
  final String url;
  ProfileImageWidget({Key? key,
    required this.width,
    required this.url,
    required this.height, this.onPressed}) : super(key: key);

  @override
  _ProfileImageWidgetState createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: Image.network(widget.url,
            // loadingBuilder: (context, widget, chunk){
            // if (chunk == null) return widget;
            // return LoaderIcon(
            //   dotRadius: 6.0,
            //   radius: 12,
            // );
            // },
            errorBuilder: (context,object, stacktrace){
              return Column(
              children: [
                Icon(Icons.error_outline),
                Text("Could not load image")
              ],
            );
            },
            fit: BoxFit.fill,
            width: widget.width,
            height: widget.height,
          )
      ),
    );
  }
}
