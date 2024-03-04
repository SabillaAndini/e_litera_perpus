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
  Map<String, String> bookImagesMap = {
    'Help Me Find My Stomach': 'assets/buku_1.png',
    'Mystery of the Moon': 'assets/buku_3.png',
    'Magic of the Amazing Forest': 'assets/buku_4.png',
  };

  List<int> bookRatings = [4, 4, 4];

  List<String> bookTitles = [
    'Help Me Find My Stomach',
    'Mystery of the Moon',
    'Magic of the Amazing Forest',
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
              SizedBox(width: 5),
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
      body: Expanded(
        child: GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          itemCount: bookTitles.length,
          itemBuilder: (ctx, i) {
            if (isFavorite[i]) {
              return SizedBox.shrink(); // Mengabaikan card yang di-favoritkan
            }

            int rating = bookRatings[i % bookRatings.length];
            String bookTitle = bookTitles[i % bookTitles.length];
            String bookImage =
                bookImagesMap[bookTitle] ?? 'assets/default_image.png';

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                          bookImage: bookImage, bookTitle: bookTitle)),
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
                                color: index < rating
                                    ? Colors.yellow
                                    : Colors.grey,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(1),
                          child: IconButton(
                            icon: Icon(
                              isFavorite[i]
                                  ? Icons.favorite_border
                                  : Icons.favorite,
                              color: isFavorite[i] ? Colors.black : Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                isFavorite[i] = !isFavorite[i];
                              });
                            },
                          ),
                        ),
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xffC25B4A),
        unselectedItemColor: Colors.grey,
        items: [
          buildNavBarItem(Icons.home, 'Beranda', 0),
          buildNavBarItem(Icons.category_outlined, 'Kategori', 1),
          buildNavBarItem(Icons.favorite_outline, 'Favorit', 2),
          buildNavBarItem(Icons.book_outlined, 'Pinjam', 3),
          buildNavBarItem(Icons.person, 'Profile', 4),
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

  BottomNavigationBarItem buildNavBarItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
      backgroundColor:
          _selectedIndex == index ? Colors.grey[200] : Colors.white,
    );
  }
}
