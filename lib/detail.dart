import 'package:e_litera_perpus/formPinjam.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Buku'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul, Penulis, Rating
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar buku
                  Container(
                    width: 140,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/buku_1.png'), // Ganti dengan path gambar sesuai buku
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  // Informasi buku (judul, penulis, dll.)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Help Me Find My Stomach',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'By: Angela Gunning',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Stok: 5 Buku',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        SizedBox(height: 8),
                        SizedBox(height: 8),
                        // Tambahan: Rating
                        Row(
                          children: List.generate(
                            4,
                            (index) => Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          )..add(
                              Icon(
                                Icons.star,
                                color: Colors.grey,
                              ),
                            ),
                        ),
                        SizedBox(height: 16),
                        // Tambahan: Tombol Pinjam
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FormPinjamPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 8),
                            backgroundColor: Color(0xffC25B4A),
                          ),
                          child: Text(
                            'Pinjam',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Deskripsi buku
              Text(
                'Deskripsi Buku',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'murid pada umumnya. Kami sedang berada di masa di mana kami sedang mengerjakan sebuah projek untuk tugas akhir. Ini adalah kisah kami dengan lika-liku dan drama dalam mengerjakan tugas akhir yang merepotkan ini.',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 16),
              // Kolom komentar
              Text(
                'Komentar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // List of comments (using ListView.builder)
              Container(
                height: 200,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text('Username $index'),
                        subtitle: Text(
                          'Bukunya menarik dan cukup memotivasi, saya juga belajar cukup banyak hal-hal baru.',
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              // Form komentar
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tambahkan komentar...',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.send),
                ),
                maxLines: 1,
                style: TextStyle(fontSize: 14), // Menambahkan style font size
              ),
            ],
          ),
        ),
      ),
    );
  }
}
