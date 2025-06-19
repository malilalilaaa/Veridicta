import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:open_court/user/Hire_lawyer/appointment_booking.dart';
import 'package:open_court/utils/Pallete.dart';
import 'package:open_court/user/Hire_lawyer/lawyer_row.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({super.key});

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: Pallete.bg),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Pallete.icon,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 8,
                      top: 80,
                    ),
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 8,
                      top: 80,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Adv. DipJol",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            "Cardiologist\nBAMS, MBBS, MD, DDLT. ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Pallete.footer,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IgnorePointer(
                              ignoring: true,
                              child: RatingStars(
                                value: 3,
                                starCount: 5,
                                starSize: 10,
                                starSpacing: 2,
                                maxValue: 5,
                                maxValueVisibility: false,
                                valueLabelVisibility: false,
                                animationDuration: const Duration(
                                  milliseconds: 1000,
                                ),
                                starOffColor: const Color(0xff7c7c7c),
                                starColor: const Color(0xffDE6732),
                              ),
                            ),
                            Text(
                              "(4.0)",
                              maxLines: 2,
                              style: TextStyle(
                                color: Pallete.mainfont,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            children: [
                              Text(
                                "14",
                                maxLines: 2,
                                style: TextStyle(
                                  color: Pallete.mainfont,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                " Years Experience",
                                maxLines: 2,
                                style: TextStyle(
                                  color: Pallete.mainfont,
                                  fontSize: 14,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "50\$",
                                maxLines: 2,
                                style: TextStyle(
                                  color: Pallete.mainfont,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                " Fees",
                                maxLines: 2,
                                style: TextStyle(
                                  color: Pallete.mainfont,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 120,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/lawyer.png",
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 10),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  " Timings",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                "Temporary closed",
                                style: TextStyle(
                                  color: Color(0xffDE8D8D),
                                  fontSize: 10,
                                ),
                              ),
                              Text(" | ", style: TextStyle(fontSize: 10)),
                              Text(
                                "Open ✓",
                                style: TextStyle(
                                  color: Color(0xff3BB94F),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Mon-FRI ( 11:00am- 05:00pm)",
                            style: TextStyle(
                              color: Pallete.proButton,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Services and Facility",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Cardiac Rehabilitisation",
                            style: TextStyle(
                              color: Pallete.proButton,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "Cardiac Surgery",
                            style: TextStyle(
                              color: Pallete.proButton,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "Cardiac Intensive care",
                            style: TextStyle(
                              color: Pallete.proButton,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 8),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "See All",
                              style: TextStyle(
                                color: Pallete.proButton,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.black26, height: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Experience",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            itemBuilder: (context, index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 6,
                                    height: 6,
                                    margin: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Pallete.mainfont,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "The Dr. Manish Chutake has a cumulative years of Experience of 4000  heart surgeries.",
                                      style: TextStyle(
                                        color: Pallete.proButton,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder:
                                (context, index) => const SizedBox(height: 8),
                            itemCount: 3,
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.black26, height: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Feedback",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "The service of the Dr. Manish Chutake and staff is Good.",
                            style: TextStyle(
                              color: Pallete.proButton,
                              fontSize: 12,
                            ),
                          ),
                          Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xffEDEDED),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    "Give Feedback",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) =>
                                                  const AppointmentBookingScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Pallete.mainfont,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "Book",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.black26, height: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Address",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              "Plot No. 123, Behind Somalwada Highschool,Shankar Nagar,Nagpur",
                              style: TextStyle(
                                color: Pallete.proButton,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.phone,
                                size: 22,
                                color: Pallete.mainfont,
                              ),
                              const SizedBox(width: 8),
                              const Expanded(
                                child: Text(
                                  "+91 987654321",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
