import 'package:flutter/material.dart';

class Navi extends StatelessWidget {
  const Navi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white24,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                iconsBottom(Icons.feed,'/feed',context),
                iconsLabel("feed"),
              ],
            ),
            Column(
              children: [
                iconsBottom(Icons.search, '/search', context),
                iconsLabel("search"),
              ],
            ),
            Column(
              children: [
                iconsBottom(Icons.add_a_photo,'/add',context),
                iconsLabel("add"),
              ],
            ),
            Column(
              children: [
                iconsBottom(Icons.person_pin_circle_outlined,'/profile',context),
                iconsLabel("profile")
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget iconsBottom(IconData icon, String route,context) {
  return Padding(
    padding: const EdgeInsets.only(top: 5, right: 10),
    child: InkWell(
        onTap: () {

          Navigator.popAndPushNamed(context, route);
        },
        child: Icon(
          icon,
          size: 30,
        )),
  );
}

Widget iconsLabel(String text) {
  return Padding(
      padding: const EdgeInsets.only(top: 3, right: 20, left: 20),
      child: Text(text));
}
