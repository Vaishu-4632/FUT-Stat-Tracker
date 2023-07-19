import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:stat_tracker/screens/LandingScreen.dart';
import 'package:stat_tracker/screens/dateRange.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:demoji/demoji.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  double _value = 0;
  final _emojis = ['😞','😜','🤓','😃','😁','😂',];
  var _selectFormation;
  var _selectLocation;
  List isCheckedList = [false, false, false, false, false];
  bool isExtraTimeChecked = false;
  bool isPenalityChecked = false;
  bool isDisconnectionChecked = false;
  bool isToxicPlayerChecked = false;
  bool isProplayerChecked = false;
  bool isRageYouChecked = false;
  bool isRageOppChecked = false;
  bool isGiftYouChecked = false;
  bool isGiftOppChecked = false;
  List<String> Items = ['HOME', 'AWAY'];
  List<String> formation = [
    '3-1-4-2',
    '3-4-1-2',
    '3-4-2-1',
    '3-4-3',
    '3-5-2',
    '4-1-2-1-2',
    '4-1-2-1-2(2)',
    '4-1-3-2',
    '4-1-4-1',
    '4-2-2-2',
    '4-2-3-1',
    '4-2-3-1(2)',
    '4-2-4',
    '4-3-1-2',
    '4-3-2-1',
    '4-3-3',
    '4-3-3(2)',
    '4-3-3(3)',
    '4-3-3(4)',
    '4-3-3(5)',
    '4-4-1-1',
    '4-4-1-1(2)',
    '4-4-2',
    '4-4-2(2)',
    '4-5-1',
    '4-5-1(2)',
    '5-2-1-2',
    '5-2-2-1',
    '5-1-2-2',
    '5-4-1'
  ];
  LinearGradient gradient = LinearGradient(
 colors: <Color> [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.blue.shade900,
  Colors.purple
 ]
);
 int currentIndex = 0;
 List _gameweeks = [];
 Future<List> _loadDataFromJson() async {
  String jsonString = await rootBundle.loadString("assets/files/Week.json");
  List data = json.decode(jsonString)["gameweeks"];
  return data;
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(184, 25, 17, 71),
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
        backgroundColor: const Color.fromARGB(185, 16, 10, 48),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LandingScreen()));
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Text(
                  'Track your FUT Champs matches to generate new stats.',
                  style: TextStyle(color: Colors.white, fontSize: 11),
                  textAlign: TextAlign.center,
                ),
              ),
               SizedBox(
                height: 100,
                child:   Container(
                 
                child:Expanded(
                  child: 
         ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _gameweeks.length,
          itemBuilder: (BuildContext context, int index) {
             DateTime startDate = DateTime.parse(_gameweeks[index]["startDate"]);
              DateTime endDate = DateTime.parse(_gameweeks[index]["endDate"]);
              String formattedStartDate = DateFormat.MMMd().format(startDate);
              String formattedEndDate = DateFormat.MMMd().format(endDate);
              
            return Container(
              width: 150, // Adjust as needed
              child: Container(
                 color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Game Week ${_gameweeks[index]["week"]}',style: TextStyle(color: Colors.white),),
                    SizedBox(height: 10),
                    Text('$formattedStartDate - $formattedEndDate',style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            );
          },
        ),
                ),
              ),
              ),
              
              Container(
                alignment: Alignment.center,
                height: 5,
                width: 100,
                color: Color.fromARGB(255, 12, 214, 46),
              ),
              SizedBox(height: 10,),
              const Text(
                'Week',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              
             
              SizedBox(height: 10,),
        //     
      
            
              
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 20),
                  child: const Text(
                    'Score(Goals)',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Your Goals',
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              fillColor: Color.fromARGB(255, 35, 27, 82),
                              filled: true),
                        ),
                      ),
                      // decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'VS',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Opponent Goals',
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              fillColor: Color.fromARGB(255, 35, 27, 82),
                              filled: true),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Opponent's Name",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 90.0),
                        child: Text(
                          "Home/Away",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Opponent Name',
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 15),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              fillColor: Color.fromARGB(255, 35, 27, 82),
                              filled: true),
                        ),
                      ),
                      // decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'VS',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: FormField(
                            enabled: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            builder: (FormFieldState<String> field) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      bottom: 0, top: 10, left: 15),
                                  filled: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  fillColor:
                                      const Color.fromARGB(255, 35, 27, 82),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 0, style: BorderStyle.none),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    hint: const Text(
                                      'Select',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    dropdownColor:
                                        const Color.fromARGB(255, 35, 27, 82),
                                    alignment: Alignment.center,
                                    menuMaxHeight: 150,
                                    items: Items.map((String Items) {
                                      return DropdownMenuItem(
                                        value: Items,
                                        child: Text(
                                          Items,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      );
                                    }).toList(),
                                    value: _selectLocation,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectLocation = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              );
                            },
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Formation",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 70.0),
                        child: Text(
                          "Opp Formation",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 15),
                          child: FormField(
                            enabled: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            builder: (FormFieldState<dynamic> field) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      bottom: 0, top: 10, left: 2),
                                  filled: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  fillColor:
                                      const Color.fromARGB(255, 35, 27, 82),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 0, style: BorderStyle.none),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    hint: const Text(
                                      'Select',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    // dropdownColor: Color.fromARGB(255, 35, 27, 82),
                                    isExpanded: true,
                                    alignment: Alignment.center,
                                    // menuMaxHeight: 700,
                                    items: formation.map((String formation) {
                                      return DropdownMenuItem<String>(
                                        value: formation,
                                        child: Text(
                                          formation,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      );
                                    }).toList(),
                                    value: _selectFormation,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectFormation = newValue!;
                                      });
                                    },

                                    dropdownStyleData: DropdownStyleData(
                                        scrollPadding: const EdgeInsets.all(5),
                                        // scrollbarTheme: ScrollbarThemeData(),
                                        maxHeight: 350,
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 35, 27, 82),
                                        ),
                                        // offset: Offset(-20, 0),
                                        scrollbarTheme: ScrollbarThemeData(
                                            radius: const Radius.circular(40),
                                            thickness:
                                                MaterialStateProperty.all(6),
                                            thumbVisibility:
                                                const MaterialStatePropertyAll(
                                                    true))),
                                  ),
                                ),
                              );
                            },
                          )),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'VS',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: FormField(
                            enabled: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            builder: (FormFieldState<dynamic> field) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      bottom: 0, top: 10, left: 2),
                                  filled: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  fillColor:
                                      const Color.fromARGB(255, 35, 27, 82),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 0, style: BorderStyle.none),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    hint: const Text(
                                      'Select',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    // dropdownColor: Color.fromARGB(255, 35, 27, 82),
                                    isExpanded: true,
                                    alignment: Alignment.center,
                                    // menuMaxHeight: 700,
                                    items: formation.map((String formation) {
                                      return DropdownMenuItem<String>(
                                        value: formation,
                                        child: Text(
                                          formation,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      );
                                    }).toList(),
                                    value: _selectFormation,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectFormation = newValue!;
                                      });
                                    },

                                    dropdownStyleData: DropdownStyleData(
                                        scrollPadding: const EdgeInsets.all(5),
                                        // offset: Offset(0, -40),
                                        // scrollbarTheme: ScrollbarThemeData(),
                                        maxHeight: 350,
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 35, 27, 82),
                                        ),
                                        // offset: Offset(-20, 0),
                                        scrollbarTheme: ScrollbarThemeData(
                                            radius: const Radius.circular(40),
                                            thickness:
                                                MaterialStateProperty.all(6),
                                            thumbVisibility:
                                                const MaterialStatePropertyAll(
                                                    true))),
                                  ),
                                ),
                              );
                            },
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Match Information',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isExtraTimeChecked = !isExtraTimeChecked;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white),
                                        gradient: isExtraTimeChecked
                                            ? const LinearGradient(colors: [
                                                Color.fromARGB(
                                                    255, 235, 212, 6),
                                                Color.fromARGB(255, 5, 236, 13)
                                              ])
                                            : null,
                                      ),
                                      child: isExtraTimeChecked
                                          ? const Icon(Icons.check,
                                              size: 18,
                                              color: Color.fromARGB(
                                                  255, 4, 17, 27))
                                          : null,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'Extra Time',
                                        style: TextStyle(
                                            color: isExtraTimeChecked
                                                ? Color.lerp(
                                                    const Color.fromARGB(
                                                        255, 245, 221, 7),
                                                    const Color.fromARGB(
                                                        255, 9, 231, 16),
                                                    0.5)
                                                : Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              //  margin: EdgeInsets.only(right: ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isPenalityChecked = !isPenalityChecked;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 29),
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white),
                                        gradient: isPenalityChecked
                                            ? const LinearGradient(colors: [
                                                Color.fromARGB(
                                                    255, 235, 212, 6),
                                                Color.fromARGB(255, 5, 236, 13)
                                              ])
                                            : null,
                                      ),
                                      child: isPenalityChecked
                                          ? const Icon(Icons.check,
                                              size: 18,
                                              color: Color.fromARGB(
                                                  255, 4, 17, 27))
                                          : null,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Penality Shootout',
                                        style: TextStyle(
                                            color: isPenalityChecked
                                                ? Color.lerp(
                                                    const Color.fromARGB(
                                                        255, 245, 221, 7),
                                                    const Color.fromARGB(
                                                        255, 9, 231, 16),
                                                    0.5)
                                                : Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              //  margin: EdgeInsets.only(right: ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isDisconnectionChecked =
                                        !isDisconnectionChecked;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 15),
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white),
                                        gradient: isDisconnectionChecked
                                            ? const LinearGradient(colors: [
                                                Color.fromARGB(
                                                    255, 235, 212, 6),
                                                Color.fromARGB(255, 5, 236, 13)
                                              ])
                                            : null,
                                      ),
                                      child: isDisconnectionChecked
                                          ? const Icon(Icons.check,
                                              size: 18,
                                              color: Color.fromARGB(
                                                  255, 4, 17, 27))
                                          : null,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Disconnection',
                                        style: TextStyle(
                                            color: isDisconnectionChecked
                                                ? Color.lerp(
                                                    const Color.fromARGB(
                                                        255, 245, 221, 7),
                                                    const Color.fromARGB(
                                                        255, 9, 231, 16),
                                                    0.5)
                                                : Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              //  margin: EdgeInsets.only(right: ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isToxicPlayerChecked =
                                        !isToxicPlayerChecked;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white),
                                        gradient: isToxicPlayerChecked
                                            ? const LinearGradient(colors: [
                                                Color.fromARGB(
                                                    255, 235, 212, 6),
                                                Color.fromARGB(255, 5, 236, 13)
                                              ])
                                            : null,
                                      ),
                                      child: isToxicPlayerChecked
                                          ? const Icon(Icons.check,
                                              size: 18,
                                              color: Color.fromARGB(
                                                  255, 4, 17, 27))
                                          : null,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Toxic Player',
                                        style: TextStyle(
                                            color: isToxicPlayerChecked
                                                ? Color.lerp(
                                                    const Color.fromARGB(
                                                        255, 245, 221, 7),
                                                    const Color.fromARGB(
                                                        255, 9, 231, 16),
                                                    0.5)
                                                : Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              // alignment: Alignment.centerLeft,
                              //  margin: EdgeInsets.only(right: ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isProplayerChecked = !isProplayerChecked;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          right: 1, left: 5),
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white),
                                        gradient: isProplayerChecked
                                            ? const LinearGradient(colors: [
                                                Color.fromARGB(
                                                    255, 235, 212, 6),
                                                Color.fromARGB(255, 5, 236, 13)
                                              ])
                                            : null,
                                      ),
                                      child: isProplayerChecked
                                          ? const Icon(Icons.check,
                                              size: 18,
                                              color: Color.fromARGB(
                                                  255, 4, 17, 27))
                                          : null,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20.0, left: 10),
                                      child: Text(
                                        'Pro Player',
                                        style: TextStyle(
                                            color: isProplayerChecked
                                                ? Color.lerp(
                                                    const Color.fromARGB(
                                                        255, 245, 221, 7),
                                                    const Color.fromARGB(
                                                        255, 9, 231, 16),
                                                    0.5)
                                                : Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      child: Column(
                        children: [
                          const Text(
                            'Rage Quit',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            //  margin: EdgeInsets.only(right: ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isRageYouChecked = !isRageYouChecked;
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white),
                                      gradient: isRageYouChecked
                                          ? const LinearGradient(colors: [
                                              Color.fromARGB(255, 235, 212, 6),
                                              Color.fromARGB(255, 5, 236, 13)
                                            ])
                                          : null,
                                    ),
                                    child: isRageYouChecked
                                        ? const Icon(Icons.check,
                                            size: 18,
                                            color:
                                                Color.fromARGB(255, 4, 17, 27))
                                        : null,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'You',
                                      style: TextStyle(
                                          color: isRageYouChecked
                                              ? Color.lerp(
                                                  const Color.fromARGB(
                                                      255, 245, 221, 7),
                                                  const Color.fromARGB(
                                                      255, 9, 231, 16),
                                                  0.5)
                                              : Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(left: 40),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isRageOppChecked = !isRageOppChecked;
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white),
                                      gradient: isRageOppChecked
                                          ? const LinearGradient(colors: [
                                              Color.fromARGB(255, 235, 212, 6),
                                              Color.fromARGB(255, 5, 236, 13)
                                            ])
                                          : null,
                                    ),
                                    child: isRageOppChecked
                                        ? const Icon(Icons.check,
                                            size: 18,
                                            color:
                                                Color.fromARGB(255, 4, 17, 27))
                                        : null,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Opponent',
                                      style: TextStyle(
                                          color: isRageOppChecked
                                              ? Color.lerp(
                                                  const Color.fromARGB(
                                                      255, 245, 221, 7),
                                                  const Color.fromARGB(
                                                      255, 9, 231, 16),
                                                  0.5)
                                              : Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            'Gift Win',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(left: 40),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isGiftYouChecked = !isGiftYouChecked;
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white),
                                      gradient: isGiftYouChecked
                                          ? const LinearGradient(colors: [
                                              Color.fromARGB(255, 235, 212, 6),
                                              Color.fromARGB(255, 5, 236, 13)
                                            ])
                                          : null,
                                    ),
                                    child: isGiftYouChecked
                                        ? const Icon(Icons.check,
                                            size: 18,
                                            color:
                                                Color.fromARGB(255, 4, 17, 27))
                                        : null,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 35,
                                    ),
                                    child: Text(
                                      'You',
                                      style: TextStyle(
                                          color: isGiftYouChecked
                                              ? Color.lerp(
                                                  const Color.fromARGB(
                                                      255, 245, 221, 7),
                                                  const Color.fromARGB(
                                                      255, 9, 231, 16),
                                                  0.5)
                                              : Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(left: 40),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isGiftOppChecked = !isGiftOppChecked;
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white),
                                      gradient: isGiftOppChecked
                                          ? const LinearGradient(colors: [
                                              Color.fromARGB(255, 235, 212, 6),
                                              Color.fromARGB(255, 5, 236, 13)
                                            ])
                                          : null,
                                    ),
                                    child: isGiftOppChecked
                                        ? const Icon(Icons.check,
                                            size: 18,
                                            color:
                                                Color.fromARGB(255, 4, 17, 27))
                                        : null,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Opponent',
                                      style: TextStyle(
                                          color: isGiftOppChecked
                                              ? Color.lerp(
                                                  const Color.fromARGB(
                                                      255, 245, 221, 7),
                                                  const Color.fromARGB(
                                                      255, 9, 231, 16),
                                                  0.5)
                                              : Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(left: 25),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Gameplay Experience',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
        //       Row(
        //         children: [
                 
      
        //           Container(
        //             // margin: EdgeInsets.only(left: 20),
        //             alignment: Alignment.centerLeft,
        //             width: 250,
        //             child:  FlutterSlider(
        //   values: [10],
        //   max: 100,
        //   min: 0,
          
        //   // handler: FlutterSliderHandler(disabled: false),
        //   trackBar: FlutterSliderTrackBar(
        //     activeTrackBar: BoxDecoration(
        //           gradient: LinearGradient(colors: [Colors.red,Colors.orange,Colors.yellow,Colors.green]),
        //           borderRadius: BorderRadius.circular(5)
        //     ),
        //     activeTrackBarHeight: 6,
        //   ),
        //   onDragging: (handlerIndex, lowerValue, upperValue) {
            
        //   },
        // ),
        //           ),
                  
        //         ],
        //       ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                      
                         Container(
                          height: 5,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Colors.red,Colors.orange,Colors.yellow,Colors.green,Colors.blue])
                          ),
                           child: Slider(
                            value: _value!,
                            min: 0.0,
                            max: 5.0,
                            divisions: 5,
                           thumbColor: Colors.white,
                            activeColor: Colors.transparent,
                            onChangeStart: (double value) {
                              print('Start value is ' + value.toString());
                            },
                            onChangeEnd: (double value) {
                              print('Finish value is ' + value.toString());
                            },
                            onChanged: (double value) {
                              setState(() {
                                _value = value;
                              });
                            },
                            inactiveColor: Color.fromARGB(193, 30, 27, 77),
                                                 ),
                         ),
                    
                       Column(
                         children: [
                           Text(
                '${_emojis[_value.toInt()]}',
                style: Theme.of(context).textTheme.displayMedium, 
              ),
              SizedBox(height: 5,),
               Text(_value <= 1  ? "Very Bad" : _value <= 2 ? "Bad" : _value <= 3 ? "Good" : _value <=4 ? "Very Good" :  "Excellent", style: TextStyle(color: Colors.white),)
                         ],
                       ),
                    ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 25),
                child: const Text(
                  'Notes',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                height: 100,
                width: 340,
                color: const Color.fromARGB(255, 35, 27, 82),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Type here...',
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                // margin: const EdgeInsets.only(left: 10, right: 10),
                height: 40,
                width: 350,
                //  color: const Color.fromARGB(255, 35, 27, 82), 
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                
                child: Container(
                  // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 5,right: 5),
                    color: const Color.fromARGB(255, 35, 27, 82), 
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Colors.white),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Add a player',
                            style: TextStyle(color: Colors.white60),
                          ),
                        )
                      ],
                    )),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                  width: 320,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 214, 218, 8),
                        Color.fromARGB(255, 7, 212, 25),
                        Color.fromARGB(255, 10, 188, 219)
                      ])),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: const Text(
                        'SUBMIT THIS MATCH RESULT',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ))),
                      SizedBox(height: 20,)
              // Container(
              //   height: 450,
              //   width: 200,

              //          child: TextFormField(
              //             decoration: const InputDecoration(
              //                 labelText: 'Your Goals',
              //                 labelStyle: TextStyle(color: Colors.white),
              //                 border: OutlineInputBorder(
              //                     borderRadius:
              //                         BorderRadius.all(Radius.circular(20))),
              //                 fillColor: Color.fromARGB(255, 35, 27, 82),
              //                 filled: true),
              //           ),),
            ],
          ),
        ),
      ),
    );
  }
  
  
}
//   int currentIndex = 0;
//   DateTime? startDate;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     DateTime currentDate = DateTime(2022, 12, 28);
//   }

//   List generateWeeks(List dates, List formattedDates) {
//     List<dynamic> formattedWeekList = [];
//     for (int i = 0; i < dates.length; i++) {
//       String gameWeek = 'Game Week $i';
//       formattedWeekList.add(gameWeek);
//     }
//     return formattedWeekList;
//   }

//   List generateDates() {
//     List dates = [];
//     // DateTime currentDate = DateTime.now();
//     DateTime currentDate = DateTime(2022, 12, 26);
//     for (int i = 0; i < 10; i++) {
//       DateTime startDate = currentDate.add(Duration(days: i * 5));
//       DateTime endDate = currentDate.add(Duration(days: i * 5 + 4));
//       dates.add(startDate);
//       dates.add(endDate);
//     }
//     return dates;
//   }

//   List formatDates(List dates) {
//     List<dynamic> formattedDatesList = [];

//     for (int i = 0; i < dates.length; i += 2) {
//       // for (int j = 1; j < dates.length; j++) {
//       //   String gameWeek = "Game Week ${j}";

//       String startDate = DateFormat("MMM d").format(dates[i]);
//       String endDate = DateFormat("MMM d").format(dates[i + 1]);
//       String formattedDates = " $startDate - $endDate";
//       // "$gameWeek\n $startDate - $endDate";
//       formattedDatesList.add(formattedDates);
//       // }
//     }
//     return formattedDatesList;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List dates = generateDates();
//     List formattedDates = formatDates(dates);
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 35, 27, 82),
//       appBar: AppBar(
//         title: ShaderMask(
//           shaderCallback: (rect) {
//             return const LinearGradient(colors: [
//               Color.fromARGB(255, 228, 228, 8),
//               Color.fromARGB(255, 68, 233, 153),
//               Color.fromARGB(255, 86, 143, 241)
//             ]).createShader(rect);
//           },
//           child: const Text(
//             'TRACK A NEW MATCH',
//             style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//                 decoration: TextDecoration.none),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: const Color.fromARGB(255, 35, 27, 82),
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (context) => const LandingScreen()));
//           },
//           icon: const Icon(
//             Icons.arrow_back_outlined,
//           ),
//         ),
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
//         ],
//       ),
//       body: const SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: 50, right: 50),
//               child: Text(
//                 'Track your FUT Champs matches to generate new stats.',
//                 style: TextStyle(color: Colors.white, fontSize: 11),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Text(
//               'Week',
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: 80,
//             ),
//             SizedBox(height: 10,),
//             Row(
//               children: [
//                 TextField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10),)),
//                     fillColor: Color.fromARGB(255, 117, 98, 199),
//                     hintText: 'Your Goals',
//                     hintStyle: TextStyle(color: Colors.white)

//                   ),
//                 )
//               ],
//             )
//             // WeekRangeDates(),

//             // List.generate(5, (index) {
//             //   final weekStartDate = startDate.add( Duration(days: index*7));
//             //   final weekEndDate = weekStartDate.add(Duration(days: 6));
//             //   final formatter = DateFormat.MMMd();
//             //   final startDateStr = formatter.format(weekStartDate);
//             //   final endDateStr = formatter.format(weekEndDate);
//             //   return Expanded(
//             //     child: Padding(padding: EdgeInsets.all(8),
//             //     child: Container(
//             //       decoration: BoxDecoration(
//             //           border: Border.all(color: Colors.grey),
//             //           borderRadius: BorderRadius.circular(5.0),
//             //         ),
//             //         child: Center(
//             //           child: Text('$startDateStr - $endDateStr'),
//             //         ),
//             //     ),
//             //     ) )
//             // }),
//             // SizedBox(
//             //   height: 60,
//             //   child: Expanded(
//             //     child: InfiniteListView.builder(
//             //         // itemExtent: 30,
//             //         scrollDirection: Axis.horizontal,
//             //         anchor: 1,
//             //         addAutomaticKeepAlives: false,
//             //         addRepaintBoundaries: true,
//             //         itemCount: formattedDates.length,
//             //         itemBuilder: (BuildContext context, int index) {
//             //           final dateRange = formattedDates[
//             //               (index + currentIndex) % formattedDates.length];
//             //           final isSelected = index == 0;
//             //           return Container(
//             //             padding: const EdgeInsets.all(22),
//             //             child: Text(
//             //               formattedDates[index],
//             //               style: const TextStyle(color: Colors.white),
//             //             ),
//             //           );
//             //         }),
//             //   ),
//             // ),

//             // SizedBox(height: 10,),
//             // Container(
//             //   margin: const EdgeInsets.only(left: 20),
//             //   alignment: Alignment.centerLeft,
//             //   child: const Text(
//             //     'Score (Goals)',
//             //     style:
//             //         TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//             //   ),
//             // ),
//             // const SizedBox(height: 10,),
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             //   crossAxisAlignment: CrossAxisAlignment.stretch,
//             //   children: [
//             //     TextFormField(
//             //           decoration: InputDecoration(
//             //             fillColor: const Color.fromARGB(255, 127, 126, 218),
//             //             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//             //             hintText: 'Your Goals',
//             //             hintStyle: const TextStyle(color: Colors.white)
//             //           ),
//             //         ),
//             //         TextFormField(
//             //           decoration: InputDecoration(
//             //             fillColor: const Color.fromARGB(255, 127, 126, 218),
//             //             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//             //             hintText: 'Your Goals',
//             //             hintStyle: const TextStyle(color: Colors.white)
//             //           ),
//             //         ),
//             //   ],
//             // ),
//             // SizedBox(height: 10,),
//             // Row(
//             //   children: [
//             //     TextFormField(
//             //       decoration: InputDecoration(
//             //         fillColor: Color.fromARGB(255, 148, 147, 214),
//             //         border: InputBorder.none,
//             //         hintText: 'Your Goals',
//             //         hintStyle: TextStyle(color: Colors.white)
//             //       ),
//             //     ),
//             //     Text('VS', style: TextStyle(color: Colors.white),),

//             //   ],
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }
//     child: _gameweeks.isNotEmpty
            // ? Expanded(
            //     child: ListView.builder(
            //       itemCount: _gameweeks.length,
            //       itemBuilder: (context, index) {
            //         return Container(
            //           key: ValueKey(_gameweeks[index]["week"]),
            //           margin: const EdgeInsets.all(10),
            //           child: ListTile(
                        
            //             leading: Text(_gameweeks[index]["week"]),
            //             title: Text(_gameweeks[index]["startDate"]),
            //             subtitle: Text(_gameweeks[index]["endDate"]),
            //           ),
            //         );
            //       },
            //     ),
            //   )
            // : ElevatedButton(
            //   onPressed: (){
            //     readJson();
            //   },
            //   child: Center(child: Text("Game Week"),),
            // ),