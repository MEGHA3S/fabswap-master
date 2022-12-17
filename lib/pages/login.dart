import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Center(
                    child: Image(
                  image: const AssetImage("assets/images/cart.png"),
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                )),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 0),
                child: Center(
                  child: Text("Login to",
                      style: TextStyle(color: Colors.black, fontSize: 40)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Center(
                  child: Text("FabSwap",
                      style: TextStyle(color: Colors.white, fontSize: 40)),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  box('Email'),
                  box('Password'),
                ],
              ),
              Column(
                children: [
                  boxOuter("Login",context,'/feed'),
                  boxOuter("Forget Password ?",context,'/'),
                  const Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10)),
                  const Center(
                    child: Text(
                      "OR",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  boxOuter("Register",context,'/signup')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget box(String text) {
  return Container(
    padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
    child: TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(10),
            // filled: true,
            // fillColor: Colors.white,
          ),
          labelText: text,
          labelStyle: const TextStyle(
            //for changing label text color
            color: Colors.white,
          )),
    ),
  );
}

Widget boxOuter(String text,context,String route) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
    child: Container(
      width: 350,
      height: 50,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 245, 37, 22),
          borderRadius: BorderRadius.circular(10)),
      child: TextButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, route);
        },
        child: Text(text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
    ),
  );
}
