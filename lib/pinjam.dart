import 'package:e_litera_perpus/favorit.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'kategori.dart';
import 'profile.dart';

class PinjamPage extends StatefulWidget {
  const PinjamPage({Key? key}) : super(key: key);

  @override
  _PinjamPageState createState() => _PinjamPageState();
}

class _PinjamPageState extends State<PinjamPage> {
  int _selectedIndex = 3;

  // Daftar gambar untuk setiap card
  List<String> bookImages = [
    'assets/buku_1.png',
    'assets/buku_2.png',
    'assets/buku_3.png',
    'assets/buku_4.png',
    'assets/buku_5.png',
  ];

  // Menyimpan status favorit dan status peminjaman setiap item
  List<bool> isFavorite = [false, false, false, false, false];
  List<bool> isBorrowed = [false, false, false, false, false];

  // Fungsi untuk menampilkan dialog konfirmasi
  void _showReturnDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isBorrowed[index]
              ? 'Apakah Anda akan meminjam buku?'
              : 'Apakah Anda akan mengembalikan buku?'),
          content: Text(isBorrowed[index]
              ? 'Konfirmasi Peminjaman'
              : 'Konfirmasi Pengembalian'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Toggle status peminjaman saat tombol 'Ya' ditekan
                setState(() {
                  isBorrowed[index] = !isBorrowed[index];
                });
                Navigator.of(context).pop();
              },
              child: Text('Ya'),
            ),
            TextButton(
              onPressed: () {
                // Aksi ketika tombol 'Tidak' ditekan
                Navigator.of(context).pop();
              },
              child: Text('Tidak'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Buku Dipinjam'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 30, left: 10, right: 10),
        itemCount: 5,
        shrinkWrap: false,
        itemBuilder: (_, item) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Gambar di sisi kiri
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(bookImages[item]),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Remembers what user said earlier in the conversation',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Hello everyone, back again at sahretech. On this occasion, we will learn',
                          style: TextStyle(fontSize: 12),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            // Menggunakan IconButton untuk favorit
                            IconButton(
                              onPressed: () {
                                // Toggle status favorit saat ikon ditekan
                                setState(() {
                                  isFavorite[item] = !isFavorite[item];
                                });
                              },
                              icon: Icon(
                                isFavorite[item]
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite[item]
                                    ? Colors.red
                                    : Colors.black,
                                size: 23,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Tampilkan dialog konfirmasi peminjaman/pengembalian
                                _showReturnDialog(item);
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                backgroundColor: Color(0xffC25B4A),
                              ),
                              child: Text(
                                isBorrowed[item] ? 'PINJAM' : 'KEMBALIKAN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
    );
  }
}
