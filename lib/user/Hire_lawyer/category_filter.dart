import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:open_court/utils/Pallete.dart';
import 'package:open_court/user/Hire_lawyer/lawyer_list.dart';

class CategoryFilterScreen extends StatefulWidget {
  const CategoryFilterScreen({super.key});

  @override
  State<CategoryFilterScreen> createState() => _CategoryFilterScreenState();
}

class _CategoryFilterScreenState extends State<CategoryFilterScreen> {
  DateTime? selectDate;
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
          "Heart Issue",
          style: TextStyle(
            color: Pallete.footer,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
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
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Search Heart Specialist",
                hintStyle: TextStyle(color: Pallete.searchBar, fontSize: 14),
                prefixIcon: Icon(Icons.search, color: Pallete.searchBar),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Select Area",
                hintStyle: TextStyle(color: Pallete.proButton, fontSize: 14),
                prefixIcon: Icon(Icons.location_on, color: Pallete.proButton),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              var results = await showCalendarDatePicker2Dialog(
                context: context,
                config: CalendarDatePicker2WithActionButtonsConfig(
                  firstDayOfWeek: 1,
                  calendarType: CalendarDatePicker2Type.single,
                  selectedDayTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  selectedDayHighlightColor: Pallete.footer,
                  centerAlignModePicker: true,
                  customModePickerIcon: const SizedBox(),
                ),
                dialogSize: const Size(325, 400),
                value: [],
                borderRadius: BorderRadius.circular(15),
              );

              if (results != null) {
                setState(() {
                  selectDate = results.first;
                });
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Icon(Icons.date_range, color: Pallete.footer),
                  const SizedBox(width: 8),
                  Text(
                    selectDate != null
                        ? selectDate!.day.toString()
                        : "Select Date",
                    style: TextStyle(
                      color: selectDate == null ? Pallete.icon : Pallete.footer,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DoctorsListScreen(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              height: 50,
              decoration: BoxDecoration(
                color: Pallete.footer,
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Search",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
