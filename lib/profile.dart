import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'kategori.dart';
import 'favorit.dart';
import 'homepage.dart';
import 'notifikasi.dart';
import 'pinjam.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 4;
  File? _selectedImage;
  bool _isImageSelected = false;
  bool _isEditing = false;

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                _isImageSelected
                    ? CircleAvatar(
                        backgroundImage: FileImage(_selectedImage!),
                        radius: 20,
                      )
                    : CircleAvatar(
                        backgroundImage: AssetImage('assets/profile_1.jpg'),
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
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Stack(
                    children: [
                      _isImageSelected
                          ? CircleAvatar(
                              backgroundImage: FileImage(_selectedImage!),
                              radius: 60,
                            )
                          : CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/profile_1.jpg'),
                              radius: 60,
                            ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: _pickImage,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color(0xffC25B4A),
                            ),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('Natalia Dita'),
                  Text('nataliadita@gmail.com'),
                  Text('0812345678'),
                  Text('Jl. Bunga Tulip no 5'),
                  SizedBox(height: 20),
                  Visibility(
                    visible: !_isEditing,
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isEditing = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffC25B4A),
                          side: BorderSide.none,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text('Edit Profile',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _isEditing,
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Name',
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Phone',
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Address',
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _isEditing = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                side: BorderSide.none,
                                shape: const StadiumBorder(),
                              ),
                              child: const Text('Cancel',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Simpan perubahan profil
                                setState(() {
                                  _isEditing = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffC25B4A),
                                side: BorderSide.none,
                                shape: const StadiumBorder(),
                              ),
                              child: const Text('Save Changes',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
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
            if (_selectedIndex == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PinjamPage()),
              );
            }
          },
        ),
      ),
    );
  }
}
