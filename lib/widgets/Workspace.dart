import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WorkSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center (
        child: SpinKitCircle(size: 100.0, color: Colors.blueAccent)
      ),

    );
  }
}