import 'package:e_litera_perpus/favorit.dart';
import 'package:e_litera_perpus/kategori.dart';
import 'package:e_litera_perpus/notifikasi.dart';
import 'package:e_litera_perpus/pinjam.dart';
import 'package:e_litera_perpus/profile.dart';
import 'package:flutter/material.dart';

import 'detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<String> bookImages = [
    'assets/buku_1.png',
    'assets/buku_2.png',
    'assets/buku_3.png',
    'assets/buku_4.png',
    'assets/buku_5.png',
    'assets/buku_6.png',
  ];

  List<int> bookRatings = [4, 4, 4, 4, 4, 4];

  List<String> bookTitles = [
    'Help Me Find My Stomach',
    'The Adventure Begins',
    'Mystery of the Moon',
    'Magic of the Forest',
    'Put The Petal To The Metal',
    'In the Shadows Monster'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Image.asset(
                'assets/elitera.png',
                height: 30,
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotifikasiPage()),
              );
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: 280,
                  height: 50,
                  child: TextField(
                    autocorrect: false,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      labelText: 'Pencarian',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      suffixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xff494241),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.filter_list))
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 400,
            height: 200,
            child: Image.asset(
              'assets/homepage.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 150),
            child: Text(
              'Rekomendasi untuk kamu',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 15,
              ),
            ),
          ),
          // Tambahkan Card dan GridView di sini
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              itemCount: 6,
              itemBuilder: (ctx, i) {
                int rating = bookRatings[i % bookRatings.length];
                return InkWell(
                  onTap: () {
                    // Navigasi ke halaman detail buku
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailPage()),
                    );
                  },
                  child: Card(
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  bookImages[i % bookImages.length],
                                  fit: BoxFit.fill,
                                  height: 200,
                                ),
                              ),
                              Text(
                                bookTitles[i % bookTitles.length],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'By: Angela Gunning',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: List.generate(
                                  5,
                                  (index) => Icon(
                                    index < rating
                                        ? Icons.star
                                        : Icons.star_border,
                                    color:
                                        index < 4 ? Colors.yellow : Colors.grey,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 5,
                mainAxisExtent: 264,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xffC25B4A),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Kategori',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: 'Pinjam',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          if (_selectedIndex == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KategoriPage()),
            );
          }
          if (_selectedIndex == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoritPage()),
            );
          }
          if (_selectedIndex == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PinjamPage()),
            );
          }
          if (_selectedIndex == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
      ),
    );
  }
}
