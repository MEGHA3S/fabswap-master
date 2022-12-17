import 'package:fabswap/pages/drawer.dart';
import 'package:flutter/material.dart';



void launchDrawer(context){
  Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) =>
      const DrawerWidget()));
}