import 'package:flutter/material.dart';

class PicturePage extends StatelessWidget {
  const PicturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: InkWell(
                        onTap: () {
                          Navigator.popAndPushNamed(context, '/feedlist');
                        },
                        child: const Icon(Icons.cancel))),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 200),
                child: ClipRRect(
                  // borderRadius: const BorderRadius.only(
                  //   topLeft: Radius.circular(20),
                  //   topRight: Radius.circular(20),
                  //   bottomLeft: Radius.circular(20),
                  //   bottomRight: Radius.circular(20),
                  // ),
                  child: InkWell(
                      onTap: () {

                      },
                      child: const Image(
                          image: AssetImage("assets/images/feeddress.png"))),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
