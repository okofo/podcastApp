import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Subscribe extends StatelessWidget {
  Subscribe({this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: StadiumBorder(),
        color: Colors.blue,
        height: 30,
        splashColor: Colors.blue,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(CupertinoIcons.add , color: Colors.white, size: 20,),
          Text(
            'Subscribe',
            style: TextStyle(fontSize: 12.0 , color: Colors.white),
          ),
          
        ]),
        onPressed: () {});
  }
}
