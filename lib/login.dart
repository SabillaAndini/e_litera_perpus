import 'package:e_litera_perpus/homepage.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarExample extends StatefulWidget {
  @override
  _BottomNavigationBarExampleState createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    LoginPage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
                child: Image.asset(
                  'assets/gambar_1.png', // Ganti dengan URL gambar Anda
                  width: 150,
                  height: 150,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color(0xff494241),
                      ),
                      labelText: 'Nama pengguna',
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Color(0xff494241),
                      ),
                      labelText: 'Kata sandi',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  backgroundColor: Color(0xffC25B4A),
                ),
                child: Text(
                  "MASUK",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold), // Tambahkan warna pada teks
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: const Color.fromARGB(255, 182, 172, 172),
                      indent: 20.0,
                      endIndent: 10.0,
                    ),
                  ),
                  Text(
                    'ATAU',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 182, 172, 172),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: const Color.fromARGB(255, 182, 172, 172),
                      indent: 10.0,
                      endIndent: 20.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/512/2991/2991148.png',
                      height: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "MASUK DENGAN AKUN GOOGLE",
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Implementasi pembuatan akun
                },
                child: Text(
                  'Belum mempunyai akun? Daftar',
                  style: TextStyle(
                    color: Color(0xffC25B4A),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Implementasi masuk dengan akun Google
                },
                child: Text(
                  'Lupa sandi?',
                  style: TextStyle(
                    color: Color(0xffC25B4A),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
