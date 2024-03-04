import 'dart:convert';
import 'package:e_litera_perpus/homepage.dart';
import 'package:e_litera_perpus/register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'userData.dart';

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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // fungsi untuk menyambungkan API
  Future<void> login(String method, Map<String, dynamic> mydata) async {
    Uri url = Uri.parse('http://10.0.2.2:8000/api/login-mobile');
    late http.Response response;
    try {
      if (!mydata.containsKey('email') || !mydata.containsKey('password')) {
        throw Exception('Missing email or password in the data');
      }

      response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': mydata['email'],
          'password': mydata['password'],
        }),
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
      if (response != null) {
        print(response.body);
      }
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
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: "Nama Pengguna atau Email",
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
                            return 'Nama Pengguna atau  Email harus diisi';
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
                          UserData.email = _emailController.text;
                          UserData.password = _passwordController.text;
                          if (_formKey.currentState!.validate()) {
                            login('POST', {
                              'email': _emailController.text,
                              'password': _passwordController.text
                            }); // Panggil method login() di sini
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          }
                        },
                        child: const Text(
                          "Masuk",
                          style: TextStyle(fontSize: 15, color: Colors.white),
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
  Future<void> _showGoogleSignInDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/google-logo.png',
                    height: 15,
                    width: 15,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Sign in With Google',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 10),
              const Text(
                'Choose an account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'to continue to ',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Company',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Divider(),
              SizedBox(height: 5),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/loggoogle.png'),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Natalia Dita',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'nataliadita@gmail.com',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        // Warna border
                        width: 2, // Lebar border
                      ),
                    ),
                    child: Icon(
                      Icons.person_2_outlined,
                      size: 24, // Ukuran ikon
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Use another account',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'To continue, Google will share your name, ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'email address, ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'language preference, ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'and profile picture  with Company.',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text:
                            ' Before using this app, you can review Company\'s  ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'privacy policy ',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'and ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'terms of service. ',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Masuk'),
              onPressed: () {
                // tindakan ketika tombol Masuk ditekan
                Navigator.of(context).pop();
                print("Google Sign In button pressed");
              },
            ),
          ],
        );
      },
    );
  }

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
        onPressed: _showGoogleSignInDialog,
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
                fontSize: 15,
                color: Color(0xffC25B4A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
