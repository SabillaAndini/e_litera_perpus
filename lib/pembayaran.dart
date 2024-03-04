import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:midpay/midpay.dart';

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

  int _selectedMetode =
      -1; // untuk menyimpan indeks metode pembayaran yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Metode Pembayaran',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xffC25B4A),
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 8, 16, 0),
            alignment: Alignment.topRight,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Choose Within ',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '24:00:00',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  'Rp. 4.000',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  children: [
                    Text(
                      'Order ID #191922521',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Icon(
                      Icons.copy,
                      size: 10,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: metodePembayaran.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  elevation: 0.7,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(20),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          metodePembayaran[index],
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                        SizedBox(
                            height:
                                8), // tambahkan jarak antara gambar barcode dan gambar di atasnya
                        Visibility(
                          visible: _selectedMetode ==
                              index, // hanya tampilkan gambar barcode jika metode dipilih
                          child: Center(
                            // letakkan gambar barcode di tengah
                            child: Image.asset(
                              'assets/barcode.png', // ganti dengan asset gambar barcode Anda
                              width: 100, // sesuaikan ukuran gambar barcode
                              height: 100,
                            ),
                          ),
                        ),
                      ],
                    ),

                    trailing: Icon(Icons
                        .keyboard_arrow_right), // Menambahkan ikon keyboard_arrow_right di sebelah kanan
                    onTap: () {
                      setState(() {
                        _selectedMetode = index; // atur metode yang dipilih
                      });
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text(
                      //         'Metode Pembayaran: ${metodePembayaran[index]}'),
                      //   ),
                      // );
                      // _testPayment();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MetodePembayaranPage(),
  ));
}
