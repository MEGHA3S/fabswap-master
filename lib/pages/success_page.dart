import 'package:fabswap/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccessPageScreen extends StatelessWidget {
  const SuccessPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:   [
          const Icon(CupertinoIcons.check_mark_circled_solid,color: Colors.green,size: 70,),
          const Text("\nYour Order has been placed with orderId 55283421 and will be delivered to you within 3-4 working days.\n",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
          MaterialButton(
            onPressed: (){
              Navigator.pushReplacementNamed(context, MyRoutes.feedpage);
            },
            color: Colors.amber.shade700,
          child: const Text("Home",style: TextStyle(color: Colors.white),),
          )

        ],
      ),
    );
  }
}
