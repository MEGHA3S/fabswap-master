import 'package:fabswap/networking/web.dart';
import 'package:fabswap/variables/global_variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/show_snackbar.dart';

class FeedListing extends StatelessWidget {
  const FeedListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routes =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final indexProfile = routes['indexProfile'];
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
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: InkWell(
                                onTap: () {
                                  Navigator.pop(context, '/feed');
                                },
                                child: const Icon(Icons.arrow_back_ios))),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Listing Details",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: InkWell(
                              onTap: () {
                                //print(userModel.response![int.parse(myId)-1].cart.toString().substring(1).split(',').length);
                                Navigator.pushNamed(context, '/cart');
                                print("");
                              },
                              child:
                                  const Icon(Icons.add_shopping_cart_outlined)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: InkWell(
                              onTap: () { Share.share('check out my website https://example.com');},
                              child: const Icon(Icons.share)),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  lowerData(context, indexProfile!),
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
                  "₹${feedModel.response![int.parse(indexProfile)].dressPrice.toString()}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: const BoxDecoration(color: Colors.blue),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          functionUpdateCart(
                              (int.parse(indexProfile) + 1).toString());
                          showSnackBar(context, "Item Added to Cart");
                          totalAmount = totalAmount + int.parse(feedModel.response![int.parse(indexProfile)].dressPrice.toString());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Column(
                            children: const [
                              Text(
                                "Add to",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Cart",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.popAndPushNamed(context, "/buy");
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

Widget lowerData(context, String indexProfile) {
  return Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                image: NetworkImage(userModel
                    .response![int.parse(feedModel
                        .response![int.parse(indexProfile)].userId
                        .toString())]
                    .profileImg
                    .toString()),
                width: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                Navigator.popAndPushNamed(context, '/profile');
              },
              child: Text(
                feedModel.response![int.parse(indexProfile)].username
                    .toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 150, top: 10),
            child: Icon(CupertinoIcons.heart_fill,color: Colors.red,),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            // child: Icon(Icons.add_comment_outlined),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 60),
        child: Row(
          children: [
            Text(
              feedModel.response![int.parse(indexProfile)].createdAt
                  .toString()
                  .substring(0, 10),
              style: const TextStyle(color: Colors.grey, fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120, top: 10),
              child: Text(
                feedModel.response![int.parse(indexProfile)].likes.toString(),
                style: const TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: 40, top: 10),
            //   child: Text(
            //
            //     style: TextStyle(color: Colors.grey, fontSize: 15),
            //   ),
            // ),
          ],
        ),
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 5),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: InkWell(
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/picture');
                  },
                  child: Image(
                      width: 100,
                      height: 100,
                      image: NetworkImage(
                        feedModel.response![int.parse(indexProfile)].image
                            .toString(),
                      ))),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 60, top: 20),
        child: Row(
          children: [
            Text(
              feedModel.response![int.parse(indexProfile)].dressName.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 60, top: 20),
        child: Row(
          children: [
            Text(
              feedModel.response![int.parse(indexProfile)].dressPrice
                  .toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                " | ",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                " Size : ${feedModel.response![int.parse(indexProfile)].dressSize.toString()} ",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20, left: 60),
        child: Row(
          children: const [
            // Text(
            //   "Description",
            //   style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold),
            // )
          ],
        ),
      ),
      lowerCategory(
        feedModel.response![int.parse(indexProfile)].category.toString(),
      ),
      lowerSize("Size", indexProfile),
      // lowerColor("Colour")
    ],
  );
}

Widget lowerCategory(String category) {
  return Column(
    children: [
      Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 30, left: 60),
            child: Text(
              "Category",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 30),
        child: Row(
          children: [
            if (category == 'M')
              Row(
                children: [
                  lowerContainer("Men"),
                  lowerContainer("Casuals"),
                ],
              ),
            if (category == 'F')
              Row(
                children: [
                  lowerContainer("Women"),
                  lowerContainer("Dresses"),
                ],
              ),
            if (category == 'K')
              Row(
                children: [
                  lowerContainer("Kids"),
                  lowerContainer("Kids Wear"),
                ],
              ),
          ],
        ),
      )
    ],
  );
}

Widget lowerContainer(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 30),
    child: Container(
      height: 30,
      width: 70,
      decoration: BoxDecoration(
        color: const Color.fromARGB(100, 227, 191, 95),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Center(
        child: Text(
          text,
          style:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Widget lowerSize(String text, String indexProfile) {
  return Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 60),
            child: Text(
              text,
              style: const TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 30),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(100, 227, 191, 95),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Center(
                  child: Text(
                    feedModel.response![int.parse(indexProfile)].dressSize
                        .toString(),
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    ],
  );
}
