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
        title: Text('Borrow Book Form'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Book Title:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _bookTitleController,
              decoration: InputDecoration(
                hintText: 'Enter book title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Borrower Name:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _borrowerNameController,
              decoration: InputDecoration(
                hintText: 'Enter borrower name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Return Date:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _returnDateController,
              decoration: InputDecoration(
                hintText: 'Enter return date',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Add logic to handle the form submission
                String bookTitle = _bookTitleController.text;
                String borrowerName = _borrowerNameController.text;
                String returnDate = _returnDateController.text;

                // Add your logic to handle the form data
                print('Book Title: $bookTitle');
                print('Borrower Name: $borrowerName');
                print('Return Date: $returnDate');
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF802c6e),
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
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
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
