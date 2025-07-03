import 'package:flutter/material.dart';
import 'package:open_court/utils/Pallete.dart';
import 'package:open_court/user/Hire_lawyer/lawyer_profile.dart';
import 'package:open_court/user/Hire_lawyer/lawyer_row.dart';

class DoctorsListScreen extends StatefulWidget {
  const DoctorsListScreen({super.key});

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close, color: Colors.white, size: 25),
        ),
        title: Text(
          "Doctors List",
          style: TextStyle(
            color: Pallete.footer,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 35,
            decoration: BoxDecoration(
              color: Pallete.footer,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              itemBuilder: (context, index) {
                return DoctorRow(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LawyerProfileScreen(),
                      ),
                    );
                  },
                );
              },
              separatorBuilder:
                  (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(color: Colors.black12, height: 1),
                  ),
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
