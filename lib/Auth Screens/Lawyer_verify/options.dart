import 'package:flutter/material.dart';
import 'package:open_court/Auth%20Screens/nid.dart';
import 'package:open_court/main.dart';
import 'package:open_court/utils/Pallete.dart';

class Options extends StatefulWidget {
  const Options({super.key});

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  bool isNidAdded = false;
  bool isBarLicenseAdded = false;
  bool isCertificateAdded = false;
  bool isImageAuthenticated = false;

  void _submitVerification() {
    if (isNidAdded &&
        isBarLicenseAdded &&
        isCertificateAdded &&
        isImageAuthenticated) {
      // Proceed with verification submission
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verification submitted successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please complete all verification steps.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lawyer Verification Process')),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          padding: EdgeInsets.all(20),
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNidPage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'NID',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                      color: Pallete.mainfont,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNidPage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Bar License',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                      color: Pallete.mainfont,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNidPage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Certificate',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                      color: Pallete.mainfont,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNidPage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Photo',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                      color: Pallete.mainfont,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
