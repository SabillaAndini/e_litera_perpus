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
      body: Padding(
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
                              horizontal: 50, vertical: 10),
                          backgroundColor: Color(0xffC25B4A),
                        ),
                        child: Text(
                          'PINJAM',
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
              'Kami bertiga teman baik. Remaja, murid kelas sebelas. Penampilan kami sama seperti mur...',
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
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Set the number of comments
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                          'Username $index'), // Replace with actual username
                      subtitle: Text(
                        'Bukunya menarik dan cukup memotivasi, saya juga belajar cukup banyak hal-hal baru.',
                      ), // Replace with actual comment
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
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
