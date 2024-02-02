import 'package:flutter/material.dart';
import 'detail.dart';
import 'homepage.dart';
import 'kategori.dart';
import 'notifikasi.dart';
import 'pinjam.dart';
import 'profile.dart';

class FavoritPage extends StatefulWidget {
  @override
  _FavoritPageState createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
  int _selectedIndex = 2;
  List<String> bookImages = [
    'assets/buku_1.png',
    'assets/buku_2.png',
    'assets/buku_3.png',
    'assets/buku_4.png',
    'assets/buku_5.png',
    'assets/buku_6.png'
  ];
  List<String> bookTitles = [
    'Help Me Find My Stomach',
    'The Adventure Begins',
    'Mystery of the Moon',
    'Magic of the Amazing Forest',
    'Put The Petal To The Metal',
    'In the Shadows Monster'
  ];
  List<bool> isFavorite = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            children: [
              Image.asset('assets/elitera.png', height: 30),
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
      body: GridView.builder(
        shrinkWrap: true,
        padding:
            const EdgeInsets.symmetric(horizontal: 10), // Mengurangi padding
        itemCount: 6,
        itemBuilder: (ctx, i) => InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailPage())),
          child: Card(
            child: Container(
              height: 180, // Mengurangi tinggi container
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
                        child: Image.asset(bookImages[i % bookImages.length],
                            fit: BoxFit.cover), // Mengganti fit ke BoxFit.cover
                      ),
                      SizedBox(height: 5),
                      Text(bookTitles[i % bookTitles.length],
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5), // Mengurangi height
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8, // Mengurangi childAspectRatio
          crossAxisSpacing: 5, // Menambah crossAxisSpacing
          mainAxisSpacing: 5,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xffC25B4A),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined), label: 'Kategori'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'Favorit'),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined), label: 'Pinjam'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);

          if (_selectedIndex == 0)
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          if (_selectedIndex == 1)
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => KategoriPage()));
          if (_selectedIndex == 3)
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PinjamPage()));
          if (_selectedIndex == 4)
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
        },
      ),
    );
  }
}
