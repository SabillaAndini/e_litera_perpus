import 'package:flutter/material.dart';

import 'favorit.dart';
import 'homepage.dart';
import 'notifikasi.dart';
import 'pinjam.dart';
import 'profile.dart';

class KategoriPage extends StatefulWidget {
  KategoriPage({Key? key}) : super(key: key);

  @override
  _KategoriPageState createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  int _selectedIndex = 1;

  final List<Map<String, dynamic>> kategoriData = [
    {
      'title': 'Umum',
      'imageUrl': 'assets/kategori1.jpeg',
      'subkategori': [
        {'title': 'Publikasi Umum'},
        {'title': 'Informasi Umum'},
        {'title': 'Ensiklopedia'},
        {'title': 'Biografi'},
        {'title': 'Majalah'},
      ],
    },
    {
      'title': 'Filsafat dan Psikologi',
      'imageUrl': 'assets/kategori2.jpeg',
      'subkategori': [
        {'title': 'Isu Kesehatan Mental'},
        {'title': 'Psikologi Positif'},
        {'title': 'Psikologi dalam Filsafat'},
        {'title': 'Filsafat Mindfulness'},
        {'title': 'Psikologi Eksperimental'},
        {'title': 'Filsafat Ontologi'},
        {'title': 'Filsafat Epistemologi'},
        {'title': 'Filsafat Aksiologi'},
      ],
    },
    {
      'title': 'Sosial',
      'imageUrl': 'assets/kategori1.jpeg',
      'subkategori': [
        {'title': 'Sosiologi'},
        {'title': 'Kesejahteraan Masyarakat'},
        {'title': 'Politik dan Ekonomi'},
        {'title': 'Budaya dan Identitas'},
        {'title': 'Isu Kontemporer'},
      ],
    },
    {
      'title': 'Agama',
      'imageUrl': 'assets/bgbuku.jpg',
      'subkategori': [
        {'title': 'Islam'},
        {'title': 'Protestan dan Katolik'},
        {'title': 'Hindu'},
        {'title': 'Buddha'},
        {'title': 'Konghucu'},
      ],
    },
    {
      'title': 'Bahasa',
      'imageUrl': 'assets/bgbuku.jpg',
      'subkategori': [
        {'title': 'Tata Bahasa'},
        {'title': 'Cerpen Indonesia'},
        {'title': 'Bahasa Indonesia'},
        {'title': 'Bahasa Asing'},
      ],
    },
    {
      'title': 'Sains dan Matematika',
      'imageUrl': 'assets/kategori3.jpeg',
      'subkategori': [
        {'title': 'Sains'},
        {'title': 'Matematika Dasar'},
        {'title': 'Kimia'},
        {'title': 'Kalkulus'},
        {'title': 'Fisika'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
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
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications_outlined,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  size: 30,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotifikasiPage()),
                  );
                },
              ),
              SizedBox(width: 5), // Penambahan jarak
              CircleAvatar(
                backgroundImage: AssetImage('assets/avatarprofile.png'),
                radius: 20,
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
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
                                (data['subkategori']
                                        as List<Map<String, String>>)
                                    .map((subkategoriData) {
                              return PopupMenuItem<String>(
                                value: subkategoriData['title']!,
                                child: Text(subkategoriData['title']!),
                              );
                            }).toList(),
                          ),
                        ),
                        Image.asset(
                          data['imageUrl']!,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
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
