import 'package:flutter/material.dart';

class Rounded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      decoration: new BoxDecoration(
        color: Color(0xff16A085),
        borderRadius: new BorderRadius.vertical(
          bottom:
              new Radius.elliptical(MediaQuery.of(context).size.width, 100.0),
        ),
      ),
    );
  }
}
