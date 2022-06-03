import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

bool menu1 = true, menu2 = false, menu3 = false, menu4 = false;

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          color: backgroundColor,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: appColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                margin: EdgeInsets.only(top: 100, bottom: 100, right: 20),
                width: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    menyWidget(
                        icon: Icons.home,
                        text: 'Home',
                        width: 100,
                        bgColor: menu1 ? backgroundAppColor : appColor,
                        colorBlue: menu1 ? appColor : textMenuColor,
                        press: () {
                          setState(() {
                            menu1 = true;
                            menu2 = false;
                            menu3 = false;
                            menu4 = false;
                          });
                        }),
                    menyWidget(
                        icon: Icons.list,
                        text: 'Transaction',
                        width: 140,
                        bgColor: menu2 ? backgroundAppColor : appColor,
                        colorBlue: menu2 ? appColor : textMenuColor,
                        press: () {
                          setState(() {
                            menu2 = true;
                            menu1 = false;
                            menu3 = false;
                            menu4 = false;
                          });
                        }),
                    menyWidget(
                        icon: Icons.person,
                        text: 'Casier',
                        width: 100,
                        bgColor: menu3 ? backgroundAppColor : appColor,
                        colorBlue: menu3 ? appColor : textMenuColor,
                        press: () {
                          setState(() {
                            menu3 = true;
                            menu2 = false;
                            menu1 = false;
                            menu4 = false;
                          });
                        }),
                    menyWidget(
                        icon: Icons.settings,
                        text: 'Setting',
                        width: 120,
                        bgColor: menu4 ? backgroundAppColor : appColor,
                        colorBlue: menu4 ? appColor : textMenuColor,
                        press: () {
                          setState(() {
                            menu4 = true;
                            menu2 = false;
                            menu3 = false;
                            menu1 = false;
                          });
                        }),
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      color: backgroundAppColor,
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: MediaQuery.of(context).size.width * 0.92,
                  height: MediaQuery.of(context).size.width * 0.92,
                  child: (menu1 == true)
                      ? Text('data')
                      : (menu2 == true)
                          ? Text('data2')
                          : (menu3 == true)
                              ? Text('data3')
                              : Text('data4')),
            ],
          ),
        ),
      ),
    );
  }

  menyWidget(
      {required IconData icon,
      required String text,
      required double width,
      required Color colorBlue,
      bgColor,
      required VoidCallback press}) {
    return RotatedBox(
      quarterTurns: -1,
      child: InkWell(
        onTap: press,
        child: Container(
          height: 45,
          width: width,
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 10),
              Icon(
                icon,
                color: colorBlue,
              ),
              SizedBox(width: 5),
              Text(
                text,
                style: TextStyle(color: colorBlue),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
