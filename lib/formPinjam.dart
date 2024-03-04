import 'package:flutter/material.dart';

class FormPinjamPage extends StatefulWidget {
  final String bookImage;

  const FormPinjamPage({Key? key, required this.bookImage}) : super(key: key);

  @override
  _FormPinjamPageState createState() => _FormPinjamPageState();
}

class _FormPinjamPageState extends State<FormPinjamPage> {
  final TextEditingController _bookTitleController = TextEditingController();
  final TextEditingController _borrowerNameController = TextEditingController();
  final TextEditingController _peminjamanController = TextEditingController();
  final TextEditingController _pengembalianController = TextEditingController();

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Peminjaman'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            // Container untuk menampilkan gambar
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
            SizedBox(height: 24),
            Text(
              'Nama Peminjam:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _bookTitleController,
              decoration: InputDecoration(
                hintText: 'Nama',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Judul Buku:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _borrowerNameController,
              decoration: InputDecoration(
                hintText: 'Masukkan judul buku',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Tanggal Peminjaman:',
              style: TextStyle(fontSize: 18),
            ),
            TextFormField(
              controller: _peminjamanController,
              readOnly: true,
              onTap: () => _selectDate(context, _peminjamanController),
              decoration: InputDecoration(
                hintText: 'Tanggal peminjaman',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: GestureDetector(
                  onTap: () => _selectDate(context, _peminjamanController),
                  child: Icon(Icons.date_range),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Tanggal Kembali:',
              style: TextStyle(fontSize: 18),
            ),
            TextFormField(
              controller: _pengembalianController,
              readOnly: true,
              onTap: () => _selectDate(context, _pengembalianController),
              decoration: InputDecoration(
                hintText: 'Tanggal Pengembalian',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: GestureDetector(
                  onTap: () => _selectDate(context, _pengembalianController),
                  child: Icon(Icons.date_range),
                ),
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // logika
                  String bookTitle = _bookTitleController.text;
                  String borrowerName = _borrowerNameController.text;
                  String peminjaman = _peminjamanController.text;
                  String pengembalian = _pengembalianController.text;

                  // tambahkan logika form data
                  print('Judul Buku: $bookTitle');
                  print('Nama Peminjam: $borrowerName');
                  print('Tanggal Peminjaman: $peminjaman');
                  print('Tanggal Pengembalian: $pengembalian');

                  // Kembali ke halaman Detail Buku
                  Navigator.pop(context);

                  // Tampilkan notifikasi
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text('Permintaan peminjaman buku sedang diproses'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffC25B4A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.all(10),
                  maximumSize: Size(300, 70),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Kirim',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
