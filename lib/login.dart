import 'package:e_litera_perpus/homepage.dart';
import 'package:e_litera_perpus/register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // fungsi untuk menyambungkan API
  Future<void> login() async {
    Uri url = Uri.parse('http://127.0.0.1:8000/api/auth/login-mobile');
    try {
      final response = await http.post(
        url,
        body: {
          'email': _usernameController.text,
          'password': _passwordController.text,
        },
      );
      if (response.statusCode == 200) {
        // respon jika login berhasil
        final data = response.body;
        // Lakukan sesuatu dengan data
        print(data);
      } else {
        // jika gagal melakukan login
        throw Exception('Failed to login');
      }
    } catch (e) {
      // Handle error/permasalahan yang terjadi
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const SizedBox(height: 60.0),
                      const Text(
                        "Selamat Datang",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'assets/gambar_1.png',
                        height: 130,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: "Nama Pengguna",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Color(0xffC25B4A).withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama Pengguna harus diisi';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      PasswordTextField(controller: _passwordController),
                      const SizedBox(height: 20),
                    ],
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.only(top: 3, left: 3),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            login(); // Panggil method login() di sini
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          }
                        },
                        child: const Text(
                          "Masuk",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Color(0xffC25B4A),
                        ),
                      )),
                  const Center(child: Text("Or")),
                  GoogleSignInButton(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Belum Punya Akun?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()),
                            );
                          },
                          child: const Text(
                            "Daftar",
                            style: TextStyle(color: Color(0xffC25B4A)),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordTextField({required this.controller});

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: "Kata Sandi",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        fillColor: Color(0xffC25B4A).withOpacity(0.1),
        filled: true,
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          icon: _isObscure
              ? Icon(Icons.visibility_off_outlined)
              : Icon(Icons.visibility),
        ),
      ),
      obscureText: _isObscure,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Kata Sandi harus diisi';
        }
        return null;
      },
    );
  }
}

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Color(0xffC25B4A),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          // Tambahkan logika tindakan ketika tombol ditekan
          print("Google Sign In button pressed");
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 20.0,
              width: 20.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/google-logo.png'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 18),
            const Text(
              "Masuk Dengan Google",
              style: TextStyle(
                fontSize: 10,
                color: Color(0xffC25B4A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
