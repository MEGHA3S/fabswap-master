import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Stack(
        children: [

          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,

            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: Container(
                  width: 200,
                  height: 150,
                  decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(
                        5.0,
                        5.0,
                      ), //Offset
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ]),
                  child: ListView(
                    children: [
                      dotInside("Privacy Policy"),
                      dotInside("Terms & Conditions"),
                      // dotInside("My Purchases"),
                      // dotInside("My Profile")
                    ],
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    ));
  }
}



Widget dotInside(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 30,left: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style:const TextStyle(color: Colors.black,fontSize: 18),),
      ],
    ),
  ) ;
}