import 'package:flutter/material.dart';
import 'package:open_court/responsive/responsive.dart';
import 'package:open_court/user/Hire_lawyer/lawyer_cell.dart';
import 'package:open_court/utils/Pallete.dart';
import 'package:open_court/widgets/Hire_Lawyer/category_button.dart';
import 'package:open_court/widgets/Hire_Lawyer/section_row.dart';
import 'package:open_court/user/Hire_lawyer/category_filter.dart';
import 'package:open_court/user/Hire_lawyer/lawyer_profile.dart';

class LawyerHomescreen extends StatefulWidget {
  const LawyerHomescreen({super.key});

  @override
  State<LawyerHomescreen> createState() => _LawyerHomescreenState();
}

class _LawyerHomescreenState extends State<LawyerHomescreen> {
  List categoryArr = [
    {"title": "Criminal Law", "img": "assets/cl.png"},
    {"title": "Environmental law", "img": "assets/env_l.png"},
    {"title": "Municipal law", "img": "assets/ml.png"},
    {"title": "Security Law", "img": "assets/pl.png"},
  ];

  List adsArr = [
    {"img": "assets/ngo1.png"},
    {"img": "assets/ngo2.png"},
  ];

  List nearDoctorArr = [
    {
      "name": "Adv. DipJol",
      "degree": "LLB, LLM, PhD (Law)",
      "img": "assets/lawyer.png",
    },
    {
      "name": "Adv. Sakib Khan",
      "degree": "LLB, LLM, PhD (Law)",
      "img": "assets/lawyer2.jpeg",
    },
    {
      "name": "Adv. Misha Sawdager",
      "degree": "LLB, LLM, PhD (Law)",
      "img": "assets/lawyer3.jpeg",
    },
  ];

  List nearShopArr = [
    {
      "name": "Jai Ambey Medical",
      "address": "Surat",
      "img": "assets/img/s1.png",
    },
    {
      "name": "All Relif Medical",
      "address": "Surat",
      "img": "assets/img/s2.png",
    },
    {
      "name": "Matru Chaya Medical",
      "address": "Surat",
      "img": "assets/img/s3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      extendBodyBehindAppBar: true,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 10.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: FloatingActionButton(
            mini: true,
            backgroundColor: Colors.transparent,
            elevation: 2,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: Pallete.bg),
        child: Responsive(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    itemBuilder: (context, index) {
                      var obj = categoryArr[index];

                      return CategoryButton(
                        title: obj["title"],
                        icon: obj["img"],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => const CategoryFilterScreen(),
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 25),
                    itemCount: categoryArr.length,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    itemBuilder: (context, index) {
                      var obj = adsArr[index];
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 1),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              obj["img"],
                              width: MediaQuery.of(context).size.width * 0.85,
                              height: MediaQuery.of(context).size.width * 0.425,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 15),
                    itemCount: adsArr.length,
                  ),
                ),
                SectionRow(title: "Doctors near by you", onPressed: () {}),
                SizedBox(
                  height: 220,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return DoctorCell(
                        obj: nearDoctorArr[index],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LawyerProfileScreen(),
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 20),
                    itemCount: nearDoctorArr.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
