import 'package:fabswap/variables/global_variable.dart';
import 'package:flutter/material.dart';

import '../networking/web.dart';


class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);
  @override
  // TODO: implement key
  Key? get key => cartPageStateKey;

  @override
  State<CartPage> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {

  void refresh(){
    setState(() {

    });
  }

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
                                  Navigator.pop(context);
                                },
                                child: const Icon(Icons.arrow_back_ios))),
                        const Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            "My Cart",
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

                  // heree

                  for (int z = 0;
                  z <
                      userModel.response![int.parse(myId) - 1].cart
                          .toString()
                          .substring(1)
                          .split(',')
                          .length -
                          1;
                  z++)
                    CartItemsWidget(
                      dressImage: feedModel.response![int.parse(userModel.response![int.parse(myId) - 1].cart.toString().substring(1).split(',').toList()[z+0])-1].image.toString(),
                      dressName: feedModel.response![int.parse(userModel.response![int.parse(myId) - 1].cart.toString().substring(1).split(',').toList()[z+0])-1].dressName.toString(),
                      dressPrice: feedModel.response![int.parse(userModel.response![int.parse(myId) - 1].cart.toString().substring(1).split(',').toList()[z+0])-1].dressPrice.toString(),
                      dressSize: feedModel.response![int.parse(userModel.response![int.parse(myId) - 1].cart.toString().substring(1).split(',').toList()[z+0])-1].dressSize.toString(),
                      createdAt: feedModel.response![int.parse(userModel.response![int.parse(myId) - 1].cart.toString().substring(1).split(',').toList()[z+0])-1].createdAt.toString(),
                      userName: feedModel.response![int.parse(userModel.response![int.parse(myId) - 1].cart.toString().substring(1).split(',').toList()[z+0])-1].username.toString(),
                      indexCart: feedModel.response![int.parse(userModel.response![int.parse(myId) - 1].cart.toString().substring(1).split(',').toList()[z+0])-1].id.toString(),
                    )
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Row(
            children: [
               Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "₹${totalAmount.toString()}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 210),
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/buy");
                      },
                      child: const Text(
                        "Buy Now",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
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


class CartItemsWidget extends StatelessWidget {
  final String dressImage,
      dressName,
      dressPrice,
      dressSize,
      createdAt,
      userName,
  indexCart;
  const CartItemsWidget(
      {Key? key,
      required this.dressImage,
      required this.dressName,
      required this.dressPrice,
      required this.dressSize,
      required this.createdAt,
      required this.userName, required this.indexCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: const Image(
                  image: NetworkImage(
                      "https://img.freepik.com/premium-vector/female-user-profile-avatar-is-woman-character-screen-saver-with-emotions_505620-617.jpg?w=2000"),
                  width: 50,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: InkWell(
                onTap: () {},
                child: Text(
                  userName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Row(children: [
            Text(
              createdAt,
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Row(children: [
            Image(
              image: NetworkImage(dressImage),
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    dressName,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text("₹$dressPrice", style: TextStyle(fontSize: 15)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text("Size : $dressSize",
                        style: const TextStyle(fontSize: 15, color: Colors.grey)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: InkWell(
                        onTap: () {
                          functionDeleteCart(indexCart);
                          totalAmount = totalAmount - int.parse(dressPrice);
                          if(totalAmount<0){
                            totalAmount=0;
                          }
                        },
                        child: const Text("Remove",
                            style:
                                TextStyle(fontSize: 15, color: Colors.grey))),
                  )
                ],
              ),
            )
          ]),
        )
      ],
    );
  }
}
