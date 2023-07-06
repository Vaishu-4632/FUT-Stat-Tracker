import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:stat_tracker/screens/LandingScreen.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  int currentIndex = 0;
  List generateDates() {
    List dates = [];
    DateTime currentDate = DateTime.now();

    for (int i = 0; i < 10; i++) {
      DateTime startDate = currentDate.add(Duration(days: i * 5));
      DateTime endDate = currentDate.add(Duration(days: i * 5 + 4));
      dates.add(startDate);
      dates.add(endDate);
    }
    return dates;
  }

  List formatDates(List dates) {
    List<dynamic> formattedDatesList = [];

    for (int i = 0; i < dates.length; i += 2) {
      for (int j = 1; j < dates.length; j++) {
        String gameWeek = "Game Week ${j}";

        String startDate = DateFormat("MMM d").format(dates[i]);
        String endDate = DateFormat("MMM d").format(dates[i + 1]);
        String formattedDates = "$gameWeek\n $startDate - $endDate";
        formattedDatesList.add(formattedDates);
      }
    }
    return formattedDatesList;
  }

  @override
  Widget build(BuildContext context) {
    List dates = generateDates();
    List formattedDates = formatDates(dates);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 35, 27, 82),
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(colors: [
              Color.fromARGB(255, 228, 228, 8),
              Color.fromARGB(255, 68, 233, 153),
              Color.fromARGB(255, 86, 143, 241)
            ]).createShader(rect);
          },
          child: const Text(
            'TRACK A NEW MATCH',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.none),
            textAlign: TextAlign.center,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 35, 27, 82),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LandingScreen()));
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: Text(
                'Track your FUT Champs matches to generate new stats.',
                style: TextStyle(color: Colors.white, fontSize: 11),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Week',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
          //     IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {
          //     setState(() {
          //       currentIndex = (currentIndex - 2) % formattedDates.length;
          //     });
          //   },
          // ),
            SizedBox(
              height: 100,
              child: Expanded(
                child: InfiniteListView.builder(
                    scrollDirection: Axis.horizontal,
                    anchor: 1,
                    addAutomaticKeepAlives: true,
                    addRepaintBoundaries: true,
                    itemCount: formattedDates.length,
                    itemBuilder: (BuildContext context, int index) {
                //       final dateRange = formattedDates[(index + currentIndex) %
                //     formattedDates.length];
                // final isSelected = index == 0;
                      return Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          formattedDates[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
