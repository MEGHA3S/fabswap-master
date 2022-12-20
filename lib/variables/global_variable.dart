// Url
import 'dart:convert';
import 'package:fabswap/models/feed_model.dart';
import 'package:fabswap/models/user_model.dart';
import 'package:fabswap/pages/feed.dart';
import 'package:flutter/cupertino.dart';

import '../pages/cart.dart';

String urlBase = 'https://10.0.2.2:8000/';
String urlConnector = '/';
String urlApi = 'api';
String urlRootUser = 'UserController';
String categorySelected='A';
String myId="0";
int totalAmount=0;

GlobalKey<FeedPageState> feedPageStateKey = GlobalKey();
GlobalKey<CartPageState> cartPageStateKey = GlobalKey();

FeedModel feedModel= FeedModel.fromJson(jsonDecode(''));
UserModel userModel= UserModel.fromJson(jsonDecode(''));


