
import 'package:flutter/material.dart';


class TextButtonRow extends StatelessWidget {
  final String text;
  final String buttonText;
  final void Function() onPressed;
  TextButtonRow({Key? key, required this.text, required this.buttonText, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right:4.0),
          child: Text(text),
        ),
        TextButton(child: Text(buttonText,),
          onPressed: onPressed,

        )
      ],
    );
  }
}
