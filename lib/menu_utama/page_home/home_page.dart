import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sidangonline/menu_utama/page_home/login_page.dart';
import 'package:sidangonline/menu_utama/page_promo/promo_instore/promo_instore.dart';
import 'package:sidangonline/menu_utama/page_promo/promo_nasional/promo_nasional.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class home_page_ extends StatefulWidget {
  const home_page_({Key? key}) : super(key: key);

  @override
  _home_page_State createState() => _home_page_State();
}

//deklarasi variable --------------------------------------------------------------------------------
List itemList = [1, 2, 3, 4, 5];

late Timer _rootTimer;

var tujuan = "";
var listData1 = [];
var listData2 = [];
var idmember = "";
var nama = "";

class _home_page_State extends State<home_page_> {
// deklarasi class

  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    // TODO: implement initState

    super.initState();

    loadSharedPreference();
  }

// list Fuction --------------------------------------------------------------------------------------------------------------------------

  Future _fetchListItems1(path) async {
    var dio = Dio();
    print(ip + path);
    Response response = await dio.get(
      ip + path, //endpoint api Login
      options: Options(contentType: Headers.jsonContentType),
    );

    Map<String, dynamic> map = jsonDecode(response.data);
    //print("member 0:");
    //print("bkembalian");
    //print(map["member"]);

    print(response.data);
    List<dynamic> kembalian = [];
    try {
      kembalian = map["member"] as List<dynamic>;
    } catch (ex) {
      print("error");
      print(ex);
    }

    //#print("kembalian");
    //print(kembalian);
    // List<dynamic> kembalian = jsonDecode(response.data);
    return kembalian;
  }

  loadSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      try {
        var userindex = jsonDecode(prefs.getString('user')!);
        idmember = userindex["idMember"];
      } catch (ex) {
        idmember = "";
      }
      //token = prefs.getString('token');
    });
  }

//list Wigdet --------------------------------------------------------------------------------------------------------------------------

  Widget getlogin() {
    if (idmember != "") {
      return Text(
        '',
        style:
            TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 20),
      );
    } else {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        // Icon(
        //   Icons.merge_outlined,
        //   size: 25,
        //   color: Colors.black,
        // ),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => const login_page_()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                "assets/images/icon/user.png",
                color: Color.fromARGB(255, 0, 0, 0),
                height: 28,
              ),
            ))
      ]);
    }
  }

  Widget getlogo() {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.00,
          left: 0,
          right: 0,
          bottom: 0),
      height: MediaQuery.of(context).size.height * 0.07,
      child: Text("Dolanyuk"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          //wrap with PreferredSize
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.06),

          child: AppBar(
            //                    shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.vertical(
            //     bottom: Radius.circular(30),
            //   ),
            // ),

            title: getlogo(),
            actions: [getlogin()],
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            elevation: 3,
          ),
        ),
        // drawer: const navigationdrawer(),
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(

              // color: Color.fromARGB(255, 243, 241, 241),
              ),
          child: SingleChildScrollView(
            // physics: ScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width * 0.35),
                ),
                Container(
                    margin: EdgeInsets.only(
                      top: 0,
                      left: 5,
                      right: 5,
                      bottom: 0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      //  borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Text("data")),
              ],
            ),
          ),
        ));
  }
}

class navigationdrawer extends StatelessWidget {
  const navigationdrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildheader(context),
              buildmenuitems(context),
            ],
          ),
        ),
      );
  Widget buildheader(BuildContext context) => Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        color: Color.fromARGB(255, 245, 240, 225),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 103, 9, 29)),
              ),
              Text(
                "Factory Shoppers",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 103, 9, 29)),
              )
            ],
          ),
        ),
      );

  Widget buildmenuitems(BuildContext context) => Container(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: Icon(Icons.store_sharp),
              title: const Text(
                "Promo Nasional",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const promo_nasional_()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.local_grocery_store_sharp),
              title: const Text(
                "Promo Instore",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const promo_instore_()),
                );
              },
            ),
            Divider(
              height: 1,
              color: Colors.black54,
            )
          ],
        ),
      );
}

_launchURL(tujuan) async {}
// final Uri _url = Uri.parse('https://www.thefactoryshop.co.id/');
// void _launchUrl() async {
//   if (!await launchUrl(_url)) throw 'Could not launch $_url';
//
//https://www.instagram.com/thefactoryshop_/
