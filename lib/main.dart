import 'package:fabswap/controllers/local_data_controller.dart';
import 'package:fabswap/pages/add.dart';
import 'package:fabswap/pages/buy.dart';
import 'package:fabswap/pages/cart.dart';
import 'package:fabswap/pages/feed.dart';
import 'package:fabswap/pages/feedlisting.dart';
import 'package:fabswap/pages/front.dart';
import 'package:fabswap/pages/image.dart';
import 'package:fabswap/pages/login.dart';
import 'package:fabswap/pages/profile.dart';
import 'package:fabswap/pages/search.dart';
import 'package:fabswap/pages/signup.dart';
import 'package:fabswap/routes.dart';
import 'package:flutter/material.dart';
import 'networking/web.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  functionFetchUser();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.frontpage,
      routes:
      {
        MyRoutes.frontpage : (context) => const  FrontPage(),
        MyRoutes.signuppage: (context) => const SignUpPage(),
        MyRoutes.loginpage : (context) => const LoginPage(),
        MyRoutes.feedpage : (context) => const FeedPage(),
        MyRoutes.feedlistpage : (context) => const FeedListing(),
        MyRoutes.picturepage : (context) => const PicturePage(),
        MyRoutes.cartpage: (context) => const CartPage(),
        MyRoutes.buypage: (context) => const BuyPage(),
        MyRoutes.profilepage: (context) => const ProfilePage(),
        MyRoutes.searchpage: (context) => const Search(),
        MyRoutes.addpage: (context) => const AddPage(),

      },
    );
  }
}
