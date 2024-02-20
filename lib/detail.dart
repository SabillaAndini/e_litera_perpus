import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import 'formPinjam.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool readMore = false;
  String text =
      'Help Me Find My Stomach adalah sebuah buku yang bercerita tentang petualangan sekelompok murid pada umumnya. Kami sedang berada di masa di mana kami sedang mengerjakan sebuah projek untuk tugas akhir. Ini adalah kisah kami dengan lika-liku dan drama dalam mengerjakan tugas akhir yang merepotkan ini.';

  TextEditingController commentController = TextEditingController();

  List<Widget> commentCards = List.generate(
    5,
    (index) => Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/avatarprofile.png'),
          radius: 20,
        ),
        title: Text(
          'Username $index',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Bukunya menarik dan cukup memotivasi, saya juga belajar cukup banyak hal-hal baru.',
        ),
      ),
    ),
  );

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
                        image: AssetImage('assets/buku_1.png'),
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
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'By: Angela Gunning',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Stok: 5 Buku',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
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
                            // Logika peminjaman buku
                            setState(() {
                              readMore = !readMore;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FormPinjamPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            backgroundColor:
                                readMore ? Colors.grey : Color(0xffC25B4A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            readMore ? 'Dipinjam' : 'Pinjam Buku',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
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
              ReadMoreText(
                text,
                trimLines: 2,
                colorClickableText: Colors.blue,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Selengkapnya',
                trimExpandedText: 'Sembunyikan',
                moreStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 16),
              // Kolom komentar
              Text(
                'Komentar',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                child: ListView(
                  children: commentCards,
                ),
              ),
              SizedBox(height: 10),
              // Form komentar
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: commentController,
                      decoration: InputDecoration(
                        labelText: 'Tambahkan komentar...',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 1,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      //Logika untuk mengatasi saat mengirim komentar
                      String newComment = commentController.text;
                      // Hapus
                      commentController.clear();
                      // menambahkan komenter baru
                      setState(() {
                        commentCards.add(
                          Card(
                            elevation: 5,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/avatarprofile.png'),
                                radius: 20,
                              ),
                              title: Text(
                                'New User',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(newComment),
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
