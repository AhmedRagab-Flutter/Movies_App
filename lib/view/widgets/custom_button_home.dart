import 'package:flutter/material.dart';

class CustomButtonHome extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color? color;
  const CustomButtonHome(
      {super.key, required this.onPressed, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      color: color,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
      ),
    );
  }
}
