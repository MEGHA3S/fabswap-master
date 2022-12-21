
import 'package:fabswap/controllers/show_snackbar.dart';
import 'package:fabswap/networking/web.dart';
import 'package:fabswap/routes.dart';
import '../variables/global_variable.dart';
import 'package:flutter/material.dart';

void uploadNewProductToFeed(context,String img,String dressName,String dressSize,String dressPrice,String category){
  if(img.isEmpty || dressName.isEmpty || dressSize.isEmpty || dressPrice.isEmpty || category.isEmpty){
    showSnackBar(context, "Enter complete data to upload");
    return;
  }
  functionStoreFeed(userModel.response![int.parse(myId)-1].name.toString(), img, dressName, dressSize, dressPrice, category, myId,context);
}

void uploadedSuccessfully(context){
  Navigator.popAndPushNamed(context, MyRoutes.feedpage);
  showSnackBar(context, 'Uploaded Succesfully');
}