import 'package:flutter/material.dart';

import 'detail.dart';
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
    // Tambahkan data kategori lainnya sesuai kebutuhan
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
                              // Cari kategori yang sesuai dengan subkategori yang dipilih
                              var selectedSubkategori = data['subkategori']
                                  .firstWhere(
                                      (element) => element['title'] == result);
                              // Navigasi ke halaman subkategori
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SubKategoriPage(
                                    subkategori: selectedSubkategori['title'],
                                  ),
                                ),
                              );
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

class SubKategoriPage extends StatelessWidget {
  final String subkategori;

  const SubKategoriPage({Key? key, required this.subkategori})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Contoh data untuk subkategori
    Map<String, String> bookImagesMap = {
      'Help Me Find My Stomach': 'assets/buku_1.png',
      'The Adventure Begins': 'assets/buku_2.png',
      'Mystery of the Moon': 'assets/buku_3.png',
      'Magic of the Amazing Forest': 'assets/buku_4.png',
      'Put The Petal To The Metal': 'assets/buku_5.png',
      'In the Shadows Monster': 'assets/buku_6.png',
    };

    List<int> bookRatings = [4, 3, 4, 4, 4, 4];

    List<String> bookTitles = [
      'Help Me Find My Stomach',
      'The Adventure Begins',
      'Mystery of the Moon',
      'Magic of the Amazing Forest',
      'Put The Petal To The Metal',
      'In the Shadows Monster'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(subkategori),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        itemCount: bookTitles.length,
        itemBuilder: (ctx, i) {
          int rating = bookRatings[i % bookRatings.length];
          String bookTitle = bookTitles[i % bookTitles.length];
          String bookImage =
              bookImagesMap[bookTitle] ?? 'assets/default_image.png';

          return InkWell(
            onTap: () {
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
                            bookImage,
                            fit: BoxFit.fill,
                            height: 200,
                          ),
                        ),
                        Text(
                          bookTitle,
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
                              index < rating ? Icons.star : Icons.star_border,
                              color:
                                  index < rating ? Colors.yellow : Colors.grey,
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
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 5,
          mainAxisExtent: 264,
        ),
      ),
    );
  }
}
