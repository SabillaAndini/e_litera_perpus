import 'package:e_litera_perpus/pembayaran.dart';
import 'package:flutter/material.dart';

class DendaPage extends StatefulWidget {
  const DendaPage({Key? key}) : super(key: key);

  @override
  State<DendaPage> createState() => _DendaPageState();
}

class _DendaPageState extends State<DendaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Denda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            buildDendaCard(
              'Put The Petal To Metal',
              'Rp 4.000',
              Icons.warning,
              Colors.red,
              'assets/buku_5.png',
              DateTime(2024, 2, 1),
              DateTime(2024, 2, 10),
            ),
            SizedBox(
              height: 10,
            ),
            buildDendaCard(
              'Mystery of the Moon',
              'Rp 0',
              Icons.access_time,
              Colors.orange,
              'assets/buku_3.png',
              DateTime(2024, 1, 25),
              DateTime(2024, 2, 5),
            ),
            SizedBox(
              height: 10,
            ),
            buildDendaCard(
              'Magic of the Amazing Forest',
              'Rp 20.000',
              Icons.warning,
              Colors.red,
              'assets/buku_4.png',
              DateTime(2024, 2, 5),
              DateTime(2024, 2, 15),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDendaCard(
      String title,
      String amount,
      IconData iconData,
      Color iconColor,
      String imagePath,
      DateTime tanggalPeminjaman,
      DateTime tanggalPengembalian) {
    int hariKeterlambatan =
        DateTime.now().difference(tanggalPengembalian).inDays;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: 100,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    amount,
                    style: TextStyle(
                      fontSize: 16,
                      color: iconColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tanggal Peminjaman: ${tanggalPeminjaman.toLocal()}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Tanggal Pengembalian: ${tanggalPengembalian.toLocal()}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Keterlambatan: $hariKeterlambatan hari',
                    style: TextStyle(
                      fontSize: 12,
                      color: hariKeterlambatan > 0 ? Colors.green : Colors.red,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(iconData, color: iconColor),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MetodePembayaranPage()),
                          );
                        },
                        child: Text('Bayar Denda'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
