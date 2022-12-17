import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Row(
                        children: const [
                          Image(
                            image: AssetImage("assets/images/namaste.png"),
                            height: 80,
                          ),
                          Center(
                              child: Text(
                            "Welcome New ",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          )),
                          Image(
                            image: AssetImage("assets/images/namaste.png"),
                            height:80,
                          ),

                        ],
                      )),
                  const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Center(
                          child: Text(
                        " Family Members ",
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ))),
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        box('Name'),
                        box('Email'),
                        box('Phone No'),
                        box('Password'),
                        box('Confirm Password'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(top: 20, left: 10),
                              child: Center(
                                  child: Text(
                                      "Verify that you read and agreed to",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, right: 50),
                              child: Center(
                                  child: Text(
                                      "Term & condition and  Private Policy",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/login');
                    },
                    child: const Text("Register",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget box(String label) {
  return Container(
    padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
    child: TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(10),
            // filled: true,
            // fillColor: Colors.white,
          ),
          labelText: label,
          labelStyle: const TextStyle(
            //for changing label text color
            color: Colors.white,
          )),
    ),
  );
}
