import 'package:flutter/material.dart';

import '../controllers/google_login.dart';
import '../networking/web.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    functionFetchFeed();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "FabSwap",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Center(
              child:  Image(
                image: AssetImage("assets/images/girls.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("FabSwap is the #1 way to buy",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.amberAccent)),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text("and sell fashion. Join our",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.amberAccent)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text("community now.",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.amberAccent)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  insideText("Login",context,'/feed'),
                  insideText("SignUp",context,'/signup'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                        onPressed: () {
                          checkGoogleSignIn(context);
                        },
                        child: const Center(
                          child: Text(
                            "Login with Gmail",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget insideText(String text, context , String route ) {
  return Container(
    width: 140,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.redAccent,
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, route);
        },
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        )),
  );
}
