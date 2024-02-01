import 'package:flutter/material.dart';

class FormPinjamPage extends StatefulWidget {
  const FormPinjamPage({Key? key}) : super(key: key);

  @override
  _FormPinjamPageState createState() => _FormPinjamPageState();
}

class _FormPinjamPageState extends State<FormPinjamPage> {
  final TextEditingController _bookTitleController = TextEditingController();
  final TextEditingController _borrowerNameController = TextEditingController();
  final TextEditingController _returnDateController = TextEditingController();

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
            TextField(
              controller: _returnDateController,
              decoration: InputDecoration(
                hintText: 'Tanggal peminjaman',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Tanggal Kembali:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _returnDateController,
              decoration: InputDecoration(
                hintText: 'Tanggal Pengembalian',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add logic to handle the form submission
                  String bookTitle = _bookTitleController.text;
                  String borrowerName = _borrowerNameController.text;
                  String returnDate = _returnDateController.text;

                  // Add your logic to handle the form data
                  print('Judul Buku: $bookTitle');
                  print('Nama Peminjam: $borrowerName');
                  print('Tanggal Peminjaman: $returnDate');
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
