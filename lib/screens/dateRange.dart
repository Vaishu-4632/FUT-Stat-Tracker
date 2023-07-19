import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekRangeDates extends StatefulWidget {
  @override
  _WeekRangeDatesState createState() => _WeekRangeDatesState();
}

class _WeekRangeDatesState extends State {
  late DateTime startDate;

  @override
  void initState() {
    super.initState();
    startDate = DateTime(2022, 7, 11); // Change this with your desired start date
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: List.generate(
          3, growable: true,// Number of weeks to display
          (index) {
            
            final weekStartDate = startDate.add(Duration(days: index * 7));
            final weekEndDate = weekStartDate.add(Duration(days: 6));

            final formatter = DateFormat.MMMd();
            final startDateStr = formatter.format(weekStartDate);
            final endDateStr = formatter.format(weekEndDate);

            return Expanded(
              
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(
                    child: Text('$startDateStr - $endDateStr'),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}