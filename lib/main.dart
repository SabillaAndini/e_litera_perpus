import 'package:e_litera_perpus/favorit.dart';
import 'package:e_litera_perpus/homepage.dart';
import 'package:e_litera_perpus/kategori.dart';
import 'package:e_litera_perpus/login.dart';
import 'package:e_litera_perpus/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'My App',
    initialRoute: '/',
    routes: {
      '/': (context) => LoginPage(),
      '/home': (context) => HomePage(),
      '/profile': (context) => ProfilePage(),
      '/kategori': (context) => KategoriPage(),
      '/bottom': (context) => BottomNavigationBarExample(),
    },
  ));
}

class BottomNavigationBarExample extends StatefulWidget {
  @override
  _BottomNavigationBarExampleState createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    LoginPage(),
    HomePage(),
    FavoritPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
        ],
      ),
    );
  }
}


