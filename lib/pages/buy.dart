import 'package:flutter/material.dart';

class BuyPage extends StatelessWidget {
  const BuyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: const BoxDecoration(color: Colors.white60),
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: InkWell(
                                onTap: () {
                                  Navigator.popAndPushNamed(
                                      context, '/feedlist');
                                },
                                child: const Icon(Icons.arrow_back_ios))),
                        const Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            "Add Shipping Address",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 60),
                          child: Text(
                            "Next",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(color: Colors.white10),
                      child: Column(
                        children: [
                          box('Country'),
                          box('Full Name'),
                          box('Mobile Number'),
                          box('Address'),
                           box('Locality/town'),
                           box('city'),
                          box('state'),

                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget box(String label) {
  return Padding(
    padding: const EdgeInsets.only(top: 5),
    child: TextField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0.05, color: Colors.grey),
            // filled: true,
            // fillColor: Colors.white,
          ),
          labelText: label,
          labelStyle: const TextStyle(
            //for changing label text color
            color: Colors.grey,
          )),
    ),
  );
}
