import 'package:fabswap/variables/global_variable.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: Row(
          children: [
            Container(
              width: 280,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 280,
                    color: Colors.white10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.popAndPushNamed(context, '/feed');
                          },
                            child: const Icon(Icons.close)
                        ),
                       const  Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "FabSwap Markets",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                       // const Padding(
                       //      padding: EdgeInsets.only(left: 10),
                       //      child: Icon(Icons.flag)),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(onTap: (){
                        categorySelected = "A";
                        feedPageStateKey.currentState!.refresh();
                        Navigator.pop(context);
                      } ,
                          child: iconsList("All", "assets/images/menf.png")),
                      InkWell(onTap: (){
                        categorySelected = "F";
                        feedPageStateKey.currentState!.refresh();
                        Navigator.pop(context);
                      },
                          child: iconsList("Women", "assets/images/womenf.png")),
                      InkWell(onTap: (){
                        categorySelected = "M";
                        feedPageStateKey.currentState!.refresh();
                        Navigator.pop(context);
                      },
                          child: iconsList("Men", "assets/images/menf.png")),
                      InkWell(
                        onTap: (){
                          categorySelected = "K";
                          feedPageStateKey.currentState!.refresh();
                          Navigator.pop(context);
                        },
                          child: iconsList("Kids", "assets/images/kidsf.png")),
                      // iconsList("Beauty", "assets/images/beauty.png"),
                      // iconsList("Plus Size", "assets/images/plus.png"),
                    ],
                  )
                ],
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width - 280,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget iconsList(String text, String image) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 40,
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(100),
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(100),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image(
              image: AssetImage(image),
              height: 60,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10,left: 20),
          child: Center(
            child: TextButton(
              onPressed: (){

              },
              child: Text(text,
                  style: const TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ],
    ),
  );
}
