import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: ListTile(
                title: Text('Sabilla Andini (Petugas)'),
                subtitle: Text(
                    'Peminjaman buku kamu yang berjudul Help Me Find My Stomach Permintaan telah disetujui oleh petugas perpustakaan. Selamat membaca dan jangan lupa untuk mengembalikan bukunya yaa.'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              child: ListTile(
                title: Text('Sabilla Andini (Petugas)'),
                subtitle: Text(
                    'Peminjaman buku kamu yang berjudul Help Me Find My Stomach Permintaan telah disetujui oleh petugas perpustakaan. Selamat membaca dan jangan lupa untuk mengembalikan bukunya yaa. '),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              child: ListTile(
                title: Text('Sabilla Andini (Petugas)'),
                subtitle: Text(
                    'Peminjaman buku kamu yang berjudul Help Me Find My Stomach Permintaan telah disetujui oleh petugas perpustakaan. Selamat membaca dan jangan lupa untuk mengembalikan bukunya yaa. '),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
