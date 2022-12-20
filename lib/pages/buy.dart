 import 'package:fabswap/controllers/show_snackbar.dart';
import 'package:fabswap/routes.dart';
import 'package:flutter/material.dart';

class BuyPage extends StatelessWidget {
  const BuyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar:  InkWell(
          onTap: (){
            showSnackBar(context, "Order Placed");
            Navigator.pushReplacementNamed(context,MyRoutes.successPage);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: Colors.black,
            child: const Center(child: Text("Buy Now",style: TextStyle(color: Colors.white,fontSize: 20),),),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
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

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Text("Select payment mode: ",style: TextStyle(color: Colors.grey.shade500,fontSize: 16),),
                          ),
                          MaterialButton(onPressed: (){
                            showSnackBar(context, "COD Selected");
                          },
                            color: Colors.cyan,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: const Text("COD",style: TextStyle(color: Colors.white),),
                          )
                        ],
                      ),


                    ],
                  ),
                ),
              ),





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
