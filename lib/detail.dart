import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'formPinjam.dart';

class DetailPage extends StatefulWidget {
  final String bookImage;
  final String bookTitle;

  const DetailPage({Key? key, required this.bookImage, required this.bookTitle})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Map<String, String> bookDescriptions = {
    'Petualangan Sahabat':
        'Buku ini mengisahkan tentang petualangan sekelompok murid dalam mengerjakan sebuah proyek tugas akhir. Ikuti lika-liku dan drama yang mereka alami dalam perjalanan mereka.',
    'Mystery of the Moon':
        'Buku ini mengisahkan tentang misteri yang terjadi di bulan. Sebuah cerita yang penuh dengan petualangan dan teka-teki yang harus dipecahkan.',
    'Magic of the Amazing Forest':
        'Buku ini membawa pembaca ke dalam hutan ajaib yang penuh dengan keajaiban dan keindahan alam. Ikuti petualangan yang menakjubkan di dalamnya.',
    'The Adventure Begins':
        'Buku ini mengisahkan tentang awal petualangan yang menegangkan dan penuh dengan tantangan. Siapkan diri Anda untuk terbang bersama dalam cerita yang luar biasa.',
    'Put The Petal To The Metal':
        'Buku ini memperkenalkan pembaca pada dunia balap mobil yang seru. Nikmati kecepatan dan adrenalin dalam setiap halaman cerita yang menarik.',
    'In the Shadows Monster':
        'Buku ini mengungkap misteri tentang monster yang ada di balik bayang-bayang. Ikuti jejak para tokoh utama dalam mengungkap kebenaran yang tersembunyi.'
  };

  Map<String, Map<String, String>> bookInfo = {
    'Petualangan Sahabat': {
      'Penulis': 'Angela Gunning',
      'Penerbit': 'Pustaka Utama',
      'Tahun Terbit': '2018',
      'Jumlah': '6',
      'Kategori': 'Petualangan'
    },
    'Mystery of the Moon': {
      'Penulis': 'Marsella Anggit',
      'Penerbit': 'Media Mega Utama',
      'Tahun Terbit': '2020',
      'Jumlah': '4',
      'Kategori': 'Misteri'
    },
    'Magic of the Amazing Forest': {
      'Penulis': 'Ali baskara',
      'Penerbit': 'Argantara media',
      'Tahun Terbit': '2019',
      'Jumlah': '5',
      'Kategori': 'Fantasi'
    },
    'The Adventure Begins': {
      'Penulis': 'Cika Mahira',
      'Penerbit': 'Media Nusantara',
      'Tahun Terbit': '2017',
      'Jumlah': '3',
      'Kategori': 'Petualangan'
    },
    'Put The Petal To The Metal': {
      'Penulis': 'Jojo Alfito',
      'Penerbit': 'Sobat Media Nusantara',
      'Tahun Terbit': '2015',
      'Jumlah': '7',
      'Kategori': 'Fiksi'
    },
    'In the Shadows Monster': {
      'Penulis': 'Vena Erika',
      'Penerbit': 'Media Merdeka',
      'Tahun Terbit': '2021',
      'Jumlah': '2',
      'Kategori': 'Horor'
    },
  };

  bool readMore = false;
  bool isFavorite = false;
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
          'Book $index',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Buku ini sangat menarik dan cukup memotivasi, saya juga belajar cukup banyak hal-hal baru.',
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    String text = bookDescriptions[widget.bookTitle] ?? '';
    Map<String, String> info = bookInfo[widget.bookTitle] ?? {};

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Buku'),
        actions: [
          IconButton(
            icon:
                isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
            onPressed: () {
              // Logika untuk menambahkan atau menghapus buku dari favorit
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
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
                      borderRadius: BorderRadius.circular(0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(widget.bookImage),
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
                          widget.bookTitle,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
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
                            // Logika peminjaman buku
                            setState(() {
                              readMore = !readMore;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FormPinjamPage(bookImage: widget.bookImage),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            backgroundColor: Color(0xffC25B4A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Pinjam Buku',
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
              // SizedBox(height: 16),
              SizedBox(height: 8),
              Text(
                'Penulis           : ${info['Penulis'] ?? ''}',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Text(
                'Penerbit         : ${info['Penerbit'] ?? ''}',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Text(
                'Tahun Terbit  : ${info['Tahun Terbit'] ?? ''}',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Text(
                'Jumlah           : ${info['Jumlah'] ?? ''}',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Text(
                'Kategori         : ${info['Kategori'] ?? ''}',
                style: TextStyle(fontSize: 15, color: Colors.grey),
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
