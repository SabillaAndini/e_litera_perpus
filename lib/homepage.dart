import 'dart:io';
import 'package:e_litera_perpus/denda.dart';
import 'package:e_litera_perpus/detail.dart';
import 'package:e_litera_perpus/login.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'favorit.dart';
import 'kategori.dart';
import 'notifikasi.dart';
import 'pinjam.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  TextEditingController _searchController = TextEditingController();
  List<String> filteredBookTitles = List.from(bookTitles);

  File? _selectedImage;
  bool _isImageSelected = false;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _isImageSelected = true;
      });
    }
  }

  Map<String, String> bookImagesMap = {
    'Help Me Find My Stomach': 'assets/buku_1.png',
    'The Adventure Begins': 'assets/buku_2.png',
    'Mystery of the Moon': 'assets/buku_3.png',
    'Magic of the Amazing Forest': 'assets/buku_4.png',
    'Put The Petal To The Metal': 'assets/buku_5.png',
    'In the Shadows Monster': 'assets/buku_6.png',
  };

  List<int> bookRatings = [4, 3, 4, 4, 4, 4];

  static List<String> bookTitles = [
    'Help Me Find My Stomach',
    'The Adventure Begins',
    'Mystery of the Moon',
    'Magic of the Amazing Forest',
    'Put The Petal To The Metal',
    'In the Shadows Monster'
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
              SizedBox(width: 5),
              InkWell(
                onTap: () {
                  _showAvatarDialog();
                },
                child: _isImageSelected
                    ? CircleAvatar(
                        backgroundImage: FileImage(_selectedImage!),
                        radius: 20,
                      )
                    : CircleAvatar(
                        backgroundImage: AssetImage('assets/avatarprofile.png'),
                        radius: 20,
                      ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
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
                  width: 340,
                  height: 50,
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      filterBooks(value);
                    },
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
              ],
            ),
          ),
          SizedBox(height: 10),
          _searchController.text.isEmpty
              ? Container(
                  width: 340,
                  height: 100,
                  child: Image.asset(
                    'assets/homepage.png',
                    fit: BoxFit.cover,
                  ),
                )
              : Container(),
          _searchController.text.isEmpty ? SizedBox(height: 20) : Container(),
          _searchController.text.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(right: 150),
                  child: Text(
                    'Rekomendasi untuk kamu',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : Container(),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              itemCount: filteredBookTitles.length,
              itemBuilder: (ctx, i) {
                int rating = bookRatings[i % bookRatings.length];
                String bookTitle =
                    filteredBookTitles[i % filteredBookTitles.length];
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
                                    index < rating
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: index < rating
                                        ? Colors.yellow
                                        : Colors.grey,
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
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 10,
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

  void filterBooks(String query) {
    setState(() {
      filteredBookTitles = bookTitles
          .where((title) => title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _showAvatarDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: 300.0,
            height: 300.0,
            child: Column(
              children: [
                Card(
                  color: Color(0xffC25B4A),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _isImageSelected
                            ? CircleAvatar(
                                backgroundImage: FileImage(_selectedImage!),
                                radius: 30,
                              )
                            : CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/avatarprofile.png'),
                                radius: 30,
                              ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Natalia Dita',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProfilePage(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: BorderSide.none,
                                  shape: const StadiumBorder(),
                                ),
                                child: const Text(
                                  'Lihat Profil',
                                  style: TextStyle(
                                    color: Color(0xffC25B4A),
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.payment,
                            color: Color(0xffC25B4A),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DendaPage()),
                            );
                          },
                        ),
                        Text(
                          'Denda',
                          style: TextStyle(
                            color: Color(0xffC25B4A),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.logout, color: Color(0xffC25B4A)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                        ),
                        Text(
                          'Keluar Dari Aplikasi',
                          style: TextStyle(
                            color: Color(0xffC25B4A),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
