import 'package:fabswap/pages/navigation.dart';
import 'package:fabswap/variables/global_variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controllers/launch_popup.dart';
import 'package:share_plus/share_plus.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  // TODO: implement key
  Key? get key => feedPageStateKey;

  @override
  State<FeedPage> createState() => FeedPageState();
}

class FeedPageState extends State<FeedPage> {

  final TextEditingController _controllerSearch = TextEditingController();

  void refresh(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        decoration: const BoxDecoration(color: Colors.white60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          launchDrawer(context);
                                        },
                                        child: Row(
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.only(left: 3),
                                              child: Icon(
                                                Icons.menu,
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text(
                                                "All",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 180,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 220, 212, 195),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child:  TextField(
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
                                ],
                              ),
                            ),
                            // const Padding(
                            //   padding: EdgeInsets.only(left: 5),
                            //   child: Icon(
                            //     Icons.person_search_outlined,
                            //     color: Colors.black,
                            //     size: 35,
                            //   ),
                            // ),
                            const Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Icon(
                                CupertinoIcons.heart,
                                color: Colors.black,
                                size: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      if(_controllerSearch.text.isEmpty)
                      for (int z = 0; z < feedModel.response!.length; z++)
                        if(categorySelected == feedModel.response![z].category || categorySelected == "A")
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
                ],
              ),
            ],
          ),
          bottomNavigationBar: const Navi(),
        ));
  }
}



Widget lowerLike(String text, IconData icon) {
  return Padding(
      padding: const EdgeInsets.only(top: 10, left: 40),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.red,
            size: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ));
}

class feedData extends StatefulWidget {
 final String username,  dressName,  dressSize,
       dressPrice, likes,  comments,image,time,indexProfile;
  const feedData({Key? key, required this.username, required this.dressName, required this.dressSize, required this.dressPrice, required this.likes, required this.comments, required this.image, required this.time, required this.indexProfile}) : super(key: key);

  @override
  State<feedData> createState() => _feedDataState();
}

class _feedDataState extends State<feedData> {
  bool z = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child:  Image(
                  image: NetworkImage(userModel.response![int.parse(feedModel.response![int.parse(widget.indexProfile)].userId.toString())].profileImg.toString()),
                  width: 50,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child:  Text(
                  widget.username,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                "shared their listing from their",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 67),
          child: Row(
            children: const [
              Text(
                "boutique",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 67, top: 5),
          child: Row(
            children: [
              Text(
               widget.time,
                style:const  TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
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
                      Navigator.pushNamed(context, '/feedlist',arguments: {'indexProfile': widget.indexProfile});
                    },
                    child:  Image(
                      image: NetworkImage(widget.image),
                      height: 200,
                      width: 200,)),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60, top: 20),
          child: Row(
            children: [
              Text(
                widget.dressName,
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
                "₹ ${widget.dressPrice} ",
                style:const  TextStyle(
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
                  " Size : ${widget.dressSize}",
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
              children:  [
                if(z)
                Text(
                  "${int.parse(widget.likes)+1} Likes",
                  style:const  TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                )
                else
                  Text(
                    "${widget.likes} Likes",
                    style:const  TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 20),
                //   child: Text(
                //     " ${widget.comments} Comments",
                //     style: const TextStyle(
                //       color: Colors.grey,
                //       fontSize: 15,
                //     ),
                //   ),
                // ),
              ],
            )),
        const Divider(
          color: Colors.black12,
        ),
        Row(
          children: [
            InkWell(
                onTap: (){
                   z=!z;
                   setState(() {

                   });
                },
                child: Column(
                  children: [
                    if(z)
                      lowerLike("Like",CupertinoIcons.heart_fill)
                    else
                      lowerLike("Like",CupertinoIcons.heart),
                  ],
                )),
            // lowerLike("Comment", Icons.add_comment_outlined),
            InkWell(
              onTap: (){
                Share.share('check out my website https://example.com');
                },
                child: lowerLike("Share", Icons.share)),
          ],
        ),
        const  Padding(
          padding:  EdgeInsets.only(top: 10),
          child: Divider(
            color: Colors.black12,
          ),
        ),



      ],
    );
  }
}

