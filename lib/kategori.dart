import 'package:flutter/material.dart';

import 'favorit.dart';
import 'homepage.dart';
import 'pinjam.dart';
import 'profile.dart';

class KategoriPage extends StatefulWidget {
  KategoriPage({Key? key}) : super(key: key);

  @override
  _KategoriPageState createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  int _selectedIndex = 1;

  final List<Map<String, String>> kategoriData = [
    {'title': ' Umum', 'imageUrl': 'assets/bgbuku1.jpg'},
    {'title': 'Filsafat dan Psikologi', 'imageUrl': 'assets/bgbuku2.jpg'},
    {'title': 'Sosial', 'imageUrl': 'assets/bgbuku3.jpg'},
    {'title': 'Agama', 'imageUrl': 'assets/bgbuku4.jpg'},
    {'title': 'Bahasa', 'imageUrl': 'assets/bgbuku5.jpg'},
    {'title': 'Sains dan Matematika', 'imageUrl': 'assets/bgbuku6.jpg'},
    {'title': 'Teknologi', 'imageUrl': 'assets/bgbuku7.jpg'},
    {'title': 'Seni dan Rekreasi', 'imageUrl': 'assets/bgbuku8.jpg'},
    {'title': 'Literatur dan Sastra', 'imageUrl': 'assets/bgbuku9.jpg'},
    {'title': 'Sejarah dan Geografis', 'imageUrl': 'assets/bgbuku10.jpg'},
    // Tambahkan data kategori lainnya sesuai kebutuhan
  ];

  final List<Map<String, String>> kategoriUmum = [
    {'title': 'Publikasi Umum'},
    {'title': 'Informasi Umum'},
    {'title': 'Ensiklopedia'},
    {'title': 'Biografi'},
    {'title': 'Majalah'},
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
            onPressed: () {},
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          for (var data in kategoriData)
            Column(
              children: [
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Card(
                    color: Color(0xffC25B4A),
                    elevation: 5,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.category_outlined,
                              color: Colors.white),
                          title: Text(
                            data['title']!,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          trailing: PopupMenuButton<String>(
                            icon: Icon(Icons.keyboard_arrow_down_rounded,
                                color: Colors.white),
                            onSelected: (String result) {
                              // Tambahkan logika untuk menangani item yang dipilih
                              print(result);
                            },
                            itemBuilder: (BuildContext context) =>
                                kategoriUmum.map((data) {
                              return PopupMenuItem<String>(
                                value: data['title']!,
                                child: Text(data['title']!),
                              );
                            }).toList(),
                          ),
                        ),
                        // Tambahkan elemen-elemen lain di sini, contohnya gambar
                        Image.asset(
                          data['imageUrl']!, // Menggunakan imageUrl dari data
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        // Tambahan elemen-elemen lain sesuai kebutuhan
                      ],
                    ),
                  ),
                ),
              ],
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

          if (_selectedIndex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
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
