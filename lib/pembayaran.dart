import 'package:flutter/material.dart';

class MetodePembayaranPage extends StatefulWidget {
  const MetodePembayaranPage({Key? key}) : super(key: key);

  @override
  State<MetodePembayaranPage> createState() => _MetodePembayaranPageState();
}

class _MetodePembayaranPageState extends State<MetodePembayaranPage> {
  final List<String> metodePembayaran = [
    'GoPay/GopPay Later',
    'Virtual Account',
    'Credit/Debit Card',
    'ShopeePay/SPayLater',
    'QRIS',
    'Alfa Group',
    'Indomaret',
    'Akulaku PayLater',
    'Kredivo',
  ];

  final List<List<String>> metodePembayaranImages = [
    [
      'assets/pembayaran/Gopay.png',
      'assets/pembayaran/GPay.png',
      'assets/pembayaran/QRIS.png',
    ],
    [
      'assets/pembayaran/BCA.png',
      'assets/pembayaran/Mandiri.png',
      'assets/pembayaran/BNI.png',
      'assets/pembayaran/PermataBank.png',
      'assets/pembayaran/BRI.png'
    ],
    [
      'assets/pembayaran/bank.png',
      'assets/pembayaran/visa.png',
      'assets/pembayaran/jcb.png',
      'assets/pembayaran/American.png'
    ],
    [
      'assets/pembayaran/ShopeePay.png',
      'assets/pembayaran/SPayLater.png',
      'assets/pembayaran/QRIS.png',
    ],
    [
      'assets/pembayaran/QRIS.png',
      'assets/pembayaran/Dana.png',
      'assets/pembayaran/Ovo.png',
      'assets/pembayaran/LinkAja.png'
    ],
    [
      'assets/pembayaran/alfa.png',
      'assets/pembayaran/Alfamidi.png',
      'assets/pembayaran/DanDan.png',
    ],
    [
      'assets/pembayaran/Indomaret.png',
      'assets/pembayaran/Isaku.png',
    ],
    [
      'assets/pembayaran/Akulaku.png',
    ],
    [
      'assets/pembayaran/Kredivo.png',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metode Pembayaran'),
      ),
      body: ListView.builder(
        itemCount: metodePembayaran.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white, // Mengatur warna card menjadi putih
            elevation: 0.7, // Penambahan shadow
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ListTile(
              contentPadding: EdgeInsets.all(20),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    metodePembayaran[index],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: metodePembayaranImages[index].length,
                    itemBuilder: (gridContext, gridIndex) {
                      return Image.asset(
                        metodePembayaranImages[index][gridIndex],
                        width: 3,
                        height: 3,
                      );
                    },
                  ),
                ],
              ),
              trailing: Icon(Icons
                  .keyboard_arrow_right), // Menambahkan ikon keyboard_arrow_right di sebelah kanan
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('Metode Pembayaran: ${metodePembayaran[index]}'),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
