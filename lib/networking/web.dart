//web connectivity files
import 'dart:convert';
import 'package:fabswap/controllers/feed_controller.dart';
import 'package:fabswap/controllers/local_data_controller.dart';
import 'package:fabswap/models/feed_model.dart';
import 'package:fabswap/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../variables/global_variable.dart';

Future<void> functionFetchUser() async {
  print('inside function');
  fetchLocalId();
  http.Response response = await http.get(Uri.parse('http://10.0.2.2:8000/api/UserController'));
  userModel= UserModel.fromJson(jsonDecode(response.body));
  print(response.body);
}

Future<void> functionUpdateCart(String cartId) async {
  fetchLocalId();
  print( "hnfhfthfth11111" + myId.toString() + 'inside function');
  String newCart = "${userModel.response![int.parse(myId)-1].cart}$cartId,";
  http.Response response = await http.put(Uri.parse('http://10.0.2.2:8000/api/UserController/$myId'),body: {"cart":newCart});
  print(response.body);
  userModel= UserModel.fromJson(jsonDecode(response.body));
  print(response.body);
}


Future<void> functionDeleteCart(String cartId) async {
  fetchLocalId();
  String newCart = "${userModel.response![int.parse(myId)-1].cart?.replaceAll('$cartId,', '')}";
  print( "hnfhfthfth1111122  " + newCart.toString() + "  "+ cartId + '  inside function');

  http.Response response = await http.put(Uri.parse('http://10.0.2.2:8000/api/UserController/$myId'),body: {"cart":newCart});
  print(response.body);
  userModel= UserModel.fromJson(jsonDecode(response.body));
  print(response.body);
  if(cartPageStateKey.currentState!=null){
    cartPageStateKey.currentState!.refresh();
  }
}


Future<void> functionStore(String name,String email , String password, context) async {

  http.Response response = await http.post(Uri.parse('http://10.0.2.2:8000/api/UserController'),body: {'name':name,'email':email,'password':password});
  print("${response.body} tyfytftyfty");
  storeLocalId(response.body);
  Navigator.popAndPushNamed(context, '/feed');
}


Future<void> functionFetchFeed() async {
  print('inside function');
  http.Response response = await http.get(Uri.parse('http://10.0.2.2:8000/api/FeedController'));
  feedModel= FeedModel.fromJson(jsonDecode(response.body));

  print(feedModel.response![0].dressName);
}



Future<void> functionStoreFeed(String userName,String img,String dressName,String dressSize,String dressPrice,String category,String userId,context) async {
  print('inside function');
  http.Response response = await http.post(Uri.parse('http://10.0.2.2:8000/api/FeedController'),body: {'username':userName,'image':img,'dress_name':dressName,'dress_size':dressSize,'dress_price':dressPrice,'category':category,'userId':userId});
  feedModel= FeedModel.fromJson(jsonDecode(response.body));
  if(response.body.length>10){
    uploadedSuccessfully(context);
  }
  print(feedModel.response![0].dressName);
}



