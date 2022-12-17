import 'package:fabswap/pages/profile_dot.dart';
import 'package:flutter/material.dart';



void launchDot(context){
  Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) =>
      const DotWidget(

      )));
}