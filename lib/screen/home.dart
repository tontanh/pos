import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_web/constant/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int menuNum = 1;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.9,
            color: Colors.blue,
            child: Text('ton'),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.9,
            child: menuPending(),
          ),
        ],
      ),
    );
  }

  menuPending() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(right: 20, left: 20, top: 25, bottom: 25),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cart',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      child: Center(
                          child: Icon(
                        Icons.close,
                        color: Colors.red,
                      )),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 252, 229, 229),
                      ),
                    )
                  ],
                ),
              ),
              orderWidget(),
              orderWidget(),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            // margin: EdgeInsets.only(right: 20, left: 20),
            height: 150,
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: backgroundAppColorWhite,
                  offset: Offset(0, -10), 
                  blurRadius: 20.0,
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            // child:
          ),
        )
      ],
    );
  }

  orderWidget() {
    return Container(
      height: 60.0,
      margin: EdgeInsets.only(right: 20, left: 20, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: backgroundAppColorWhite,
            offset: Offset(0.0, 10),
            blurRadius: 20.0,
          )
        ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset('assets/images/image.png')),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Food Name'),
                    Text(
                      '20,000 kip',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child: InkWell(
                    onTap: (() {
                      if (menuNum >= 2) {
                        setState(() {
                          menuNum = menuNum - 1;
                        });
                      } else {
                        menuNum = menuNum;
                      }
                    }),
                    child: Center(
                        child: Icon(
                      Icons.remove,
                      color: Colors.blue,
                    )),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 214, 237, 255),
                  ),
                ),
                Container(margin: EdgeInsets.all(5), child: Text('${menuNum}')),
                Container(
                  height: 30,
                  width: 30,
                  child: InkWell(
                    onTap: (() {
                      setState(() {
                        menuNum = menuNum + 1;
                      });
                    }),
                    child: Center(
                        child: Icon(
                      Icons.add,
                      color: Colors.blue,
                    )),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 214, 237, 255),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
