import 'package:flutter/material.dart';

class NotificationModel {
  final String title;
  final String subtitle;
  bool isRead;
  DateTime time; // Tambahkan properti waktu

  NotificationModel(
      {required this.title,
      required this.subtitle,
      this.isRead = false,
      required this.time});
}

class NotifikasiPage extends StatefulWidget {
  const NotifikasiPage({Key? key}) : super(key: key);

  @override
  _NotifikasiPageState createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  List<NotificationModel> notifications = [
    NotificationModel(
      title: 'Sabilla Andini (Petugas)',
      subtitle:
          'Peminjaman buku kamu yang berjudul Help Me Find My Stomach Permintaan telah disetujui oleh petugas perpustakaan. Selamat membaca dan jangan lupa untuk mengembalikan bukunya yaa.',
      time: DateTime.now(),
    ),
    NotificationModel(
      title: 'Sabilla Andini (Petugas)',
      subtitle:
          'Peminjaman buku kamu yang berjudul Help Me Find My Stomach Permintaan telah disetujui oleh petugas perpustakaan. Selamat membaca dan jangan lupa untuk mengembalikan bukunya yaa. ',
      time: DateTime.now(),
    ),
    NotificationModel(
      title: 'Sabilla Andini (Petugas)',
      subtitle:
          'Peminjaman buku kamu yang berjudul Help Me Find My Stomach Permintaan telah disetujui oleh petugas perpustakaan. Selamat membaca dan jangan lupa untuk mengembalikan bukunya yaa. ',
      time: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: notifications.map((notification) {
              return Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: Card(
                  color: notification.isRead
                      ? Colors.grey[300]
                      : Color(0xffC25B4A),
                  child: Stack(
                    children: [
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notification.title,
                              style: TextStyle(
                                color: notification.isRead
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: notification.isRead
                                    ? FontWeight.normal
                                    : FontWeight.bold,
                                fontSize:
                                    15.0, // Tambahkan ukuran teks untuk title
                              ),
                            ),
                            Divider(),
                            Text(
                              notification.subtitle,
                              style: TextStyle(
                                color: notification.isRead
                                    ? Colors.black
                                    : Colors.white,
                                fontSize:
                                    12.0, // Tambahkan ukuran teks untuk subtitle
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            notification.isRead = true;
                          });
                        },
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 10.0,
                        child: Text(
                          "${notification.time.hour}:${notification.time.minute}",
                          style: TextStyle(
                            color: notification.isRead
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
