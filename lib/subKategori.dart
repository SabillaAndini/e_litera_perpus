import 'package:flutter/material.dart';

class SubKategoriPage extends StatefulWidget {
  const SubKategoriPage({Key? key}) : super(key: key);

  @override
  State<SubKategoriPage> createState() => _SubKategoriPageState();
}

class _SubKategoriPageState extends State<SubKategoriPage> {
  // Contoh daftar subkategori
  final List<String> subcategories = [
    'Subkategori 1',
    'Subkategori 2',
    'Subkategori 3',
    'Subkategori 4',
    // Tambahkan subkategori lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subkategori'),
      ),
      body: ListView.builder(
        itemCount: subcategories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(subcategories[index]),
            // Tambahkan logika untuk menavigasi ke halaman detail subkategori
            onTap: () {
              // Contoh: Navigasi ke halaman detail subkategori dengan parameter subkategori
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailSubkategoriPage(
                    subkategori: subcategories[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Contoh halaman detail subkategori
class DetailSubkategoriPage extends StatelessWidget {
  final String subkategori;

  const DetailSubkategoriPage({Key? key, required this.subkategori})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subkategori),
      ),
      body: Center(
        child: Text('Ini adalah halaman detail untuk $subkategori'),
      ),
    );
  }
}
