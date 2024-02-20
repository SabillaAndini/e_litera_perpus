import 'package:e_litera_perpus/favorit.dart';
import 'package:e_litera_perpus/formPinjam.dart';
import 'package:e_litera_perpus/pembayaran.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'kategori.dart';
import 'notifikasi.dart';
import 'profile.dart';

class PinjamPage extends StatefulWidget {
  const PinjamPage({Key? key}) : super(key: key);

  @override
  _PinjamPageState createState() => _PinjamPageState();
}

class _PinjamPageState extends State<PinjamPage> {
  int _selectedIndex = 3;

  List<String> bookImages = [
    'assets/buku_1.png',
    'assets/buku_2.png',
    'assets/buku_3.png',
    'assets/buku_4.png',
    'assets/buku_5.png',
  ];

  List<String> bookTitles = [
    'Help Me Find My Stomach',
    'The Adventure Begins',
    'Mystery of the Moon',
    'Magic of the Amazing Forest',
    'Put The Petal To The Metal',
    'In the Shadows Monster'
  ];

  List<String> bookAuthors = [
    'Angela Gunning',
    'John Doe',
    'Jane Smith',
    'Michael Johnson',
    'Emily Williams',
    'David Brown'
  ];

  List<double> bookRatings = [4.5, 3.8, 4.2, 4.6, 4.7, 4.3];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
          bottom: TabBar(
            tabs: [
              Tab(text: 'Pinjam'),
              Tab(text: 'Terlambat'),
              Tab(text: 'Selesai'),
            ],
          ),
          automaticallyImplyLeading: false,
        ),
        body: TabBarView(
          children: [
            // Tab View Buku Dipinjam
            ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image.asset(
                            bookImages[index],
                            width: 50,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                          title: Text(bookTitles[index]),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Text('Tanggal Peminjaman: 01/01/2024'),
                              ),
                              Text('Tanggal Pengembalian: 01/02/2024'),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Logika untuk pengembalian buku
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffC25B4A),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 5.0),
                                child: Text(
                                  'Pengembalian',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            // Tab View Buku Terlambat
            ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image.asset(
                            bookImages[index],
                            width: 50,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                          title: Text(bookTitles[index]),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Text('Denda yang Dibayar: Rp. 4.000'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Text('Tanggal Peminjaman: 01/01/2024'),
                              ),
                              Text('Tanggal Pengembalian: 01/02/2024'),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.warning,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MetodePembayaranPage()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xffC25B4A),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Text(
                                      'Bayar Denda',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // Tab View Buku Selesai
            ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          bookImages[index],
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        ListTile(
                          title: Text(bookTitles[index]),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Pengarang: ${bookAuthors[index]}'),
                              Text('Rating: ${bookRatings[index]}'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FormPinjamPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffC25B4A),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 5.0,
                              ),
                              child: Text(
                                'Pinjam',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
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
              label: 'Rak Pinjam',
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
            if (_selectedIndex == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            }
          },
        ),
      ),
    );
  }
}
