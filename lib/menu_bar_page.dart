import 'package:flutter/material.dart';
import 'package:sidangonline/menu_utama/page_account/account_page.dart';
import 'package:sidangonline/menu_utama/page_promo/promo_page.dart';
import 'package:sidangonline/menu_utama/page_home/home_page.dart';

class menu_bar_page_ extends StatefulWidget {
  const menu_bar_page_({Key? key}) : super(key: key);

  @override
  State<menu_bar_page_> createState() => _menu_bar_page_State();
}

class _menu_bar_page_State extends State<menu_bar_page_> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _kTabPages = [
      home_page_(),
      promo_page_(),
      account_page_(),
    ];
    final _kBottomNavBarItems = [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.date_range_rounded,
            size: 30,
          ),
          label: 'Jadwal'),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.search_rounded,
          size: 30,
        ),
        label: 'Cari',
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.people_alt_rounded, size: 30), label: 'Profile'),
    ];
    assert(_kTabPages.length == _kBottomNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      elevation: 10,
      backgroundColor: Color.fromARGB(255, 77, 6, 22),
      items: _kBottomNavBarItems,
      currentIndex: _currentTabIndex,
      selectedFontSize: 12,
      unselectedItemColor: Color.fromARGB(170, 245, 240, 225),
      selectedItemColor: Color.fromARGB(255, 245, 240, 225),
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _kTabPages[_currentTabIndex],
        bottomNavigationBar: bottomNavBar,
      ),
    );
  }
}
