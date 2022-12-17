import 'package:fabswap/pages/navigation.dart';
import 'package:fabswap/variables/global_variable.dart';
import 'package:flutter/material.dart';

import 'feed.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);



  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _controllerSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
          bottomNavigationBar: const Navi(),
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
                              Navigator.popAndPushNamed(context, '/feed');
                            },
                            child: const Icon(Icons.arrow_back_ios)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          height: 50,
                          width: 280,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 220, 212, 195),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextField(
                            controller: _controllerSearch,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.black,fontSize: 15),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 2, color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                  // filled: true,
                                  // fillColor: Colors.white,
                                ),
                                hintText: 'Search Profile',
                                hintStyle: const TextStyle(
                                  //for changing label text color
                                  color: Colors.black,
                                  fontSize: 15,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            if(_controllerSearch.text.isNotEmpty)
              for (int z = 0; z < feedModel.response!.length; z++)
                if(feedModel.response![z].username!.contains(_controllerSearch.text))
                  feedData(
                    indexProfile: z.toString(),
                    username:feedModel.response![z].username.toString(),
                    dressName:feedModel.response![z].dressName.toString(),
                    dressSize:feedModel.response![z].dressSize.toString(),
                    dressPrice:feedModel.response![z].dressPrice.toString(),
                    likes:feedModel.response![z].likes.toString(),
                    comments:feedModel.response![z].comments.toString(),
                    image:feedModel.response![z].image.toString(),
                    time:feedModel.response![z].createdAt.toString(),
                  )
          ],

        ),
      ),
    ));
  }
}
