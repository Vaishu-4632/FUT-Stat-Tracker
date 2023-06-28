import 'package:flutter/material.dart';
import 'package:stat_tracker/screens/Login.dart';
import 'package:stat_tracker/utils/background.dart';
import 'package:stat_tracker/utils/validator.dart';
import 'package:csc_picker/csc_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  bool forNewsletter = true;
  String? countryValue;
  String? stateValue;
  String? cityValue;
  bool vertical = false;
  final List<bool> _selectedPlaystations = <bool>[
    true,
    false,
    false,
    false,
    false
  ];

  List<Widget> playstations = <Widget>[
    Text('PS4'),
    Text('PS5'),
    Text('XBOX One'),
    Text('XBOX Series'),
    Text('PC'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("#2C5364"),
              hexStringToColor("#203A43"),
              hexStringToColor("#0F2027")
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 10,left: 25,right: 25),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(colors: [
                      Color.fromARGB(255, 228, 228, 8),
                      Color.fromARGB(255, 68, 233, 153),
                      Color.fromARGB(255, 86, 143, 241)
                    ]).createShader(rect);
                  },
                  child: const Text(
                    'CREATE AN\n ACCOUNT',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "NEW TO FUT TRACKER? IT'S FREE TO JOIN",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      Validator.validateEmail(email: emailController.text),
                  enableSuggestions: true,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(color: Colors.black.withOpacity(0.9)),
                  decoration: InputDecoration(
                      hintText: 'Email',
                      labelStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              width: 2, style: BorderStyle.solid))),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: usernameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      Validator.validateName(name: usernameController.text),
                  enableSuggestions: true,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(color: Colors.black.withOpacity(0.9)),
                  decoration: InputDecoration(
                      hintText: 'Username',
                      labelStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              width: 2, style: BorderStyle.solid))),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => Validator.validatePassword(
                      password: passwordController.text),
                  obscureText: true,
                  enableSuggestions: true,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(color: Colors.black.withOpacity(0.9)),
                  decoration: InputDecoration(
                      hintText: 'Password',
                      labelStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              width: 2, style: BorderStyle.solid))),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => Validator.validatePassword(
                      password: passwordController.text),
                  enableSuggestions: true,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(color: Colors.black.withOpacity(0.9)),
                  decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      labelStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              width: 2, style: BorderStyle.solid))),
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // height: 600,
                  child: Column(
                    children: [
                      FormField(
                        enabled: true,
                        builder: (FormFieldState<dynamic> field) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              // labelText: 'Country',
                              // labelStyle: const TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                                  const EdgeInsets.only(top: 6.0, bottom: 0.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      width: 0, style: BorderStyle.none)),
                              errorText: field.errorText,
                            ),
                            child: CSCPicker(
                              showStates: false,
                              showCities: false,
                              flagState: CountryFlag.ENABLE,
                              selectedItemStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              layout: Layout.horizontal,
                              dropdownDecoration:
                                  BoxDecoration(color: Colors.transparent),
                              onCountryChanged: (value) {
                                setState(() {
                                  countryValue = value;
                                });
                              },
                              onStateChanged: (value) {
                                setState(() {
                                  stateValue = value;
                                });
                              },
                              onCityChanged: (value) {
                                setState(
                                  () {
                                    cityValue = value;
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormField(
                          enabled: true,
                          builder: (FormFieldState<dynamic> field) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.only(
                                    top: 5.0, bottom: 0.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        width: 0, style: BorderStyle.none)),
                                errorText: field.errorText,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: ToggleButtons(
                                      direction: vertical ?Axis.vertical : Axis.horizontal,
                                      onPressed: (int index) {
                                        setState(() {
                                          for (int i = 0;
                                              i < _selectedPlaystations.length;
                                              i++) {
                                            _selectedPlaystations[i] =
                                                i == index;
                                          }
                                        });
                                      },
                                      
                                      textStyle: TextStyle(fontSize: 15, ),
                                      selectedBorderColor: Colors.transparent,
                                      fillColor: Colors.transparent,
                                      
                                      borderColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(6), ),
                                      selectedColor: Colors.green,
                                      color: Colors.grey[400],
                                      constraints: const BoxConstraints(
                                        minHeight: 40.0,
                                        minWidth: 60.0,
                                      ),
                                      isSelected: _selectedPlaystations,
                                      children: playstations
                                          .asMap()
                                          .entries
                                          .map((entry) =>
                                              playstations[entry.key])
                                          .toList(),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                          

                           const SizedBox(
                  height: 5,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Switch(
                      value: forNewsletter, 
                      // trackColor: MaterialStateProperty.all(Color.fromARGB(255, 31, 53, 70)),
                      activeColor: const Color.fromARGB(255, 108, 28, 122),
                      inactiveThumbColor:  Colors.white,
                      activeTrackColor: Colors.purple,
                      inactiveTrackColor:Color.fromARGB(255, 31, 53, 70) ,

                      onChanged: (value) => setState(() {
                        forNewsletter =value;
                      }),),
                      Text("Subscribe to our newsletter", style: TextStyle(color: Colors.white,fontSize: 15),)
                  ],
                ),
                SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width / 1.28,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    gradient: const LinearGradient(colors: [
                      Color.fromRGBO(236, 146, 10, 1),
                      Color.fromARGB(255, 173, 81, 113),
                      Color.fromRGBO(171, 71, 188, 1)
                    ]),
                  ),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: const Text(
                        'REGSTER',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Already using FUT Tracker?',
                      style: TextStyle(color: Colors.white,fontSize: 15),
                      
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                        child: const Text(
                          "Login Here",
                          style: TextStyle(
                              color: Color.fromARGB(255, 40, 172, 45),
                              fontSize: 15,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                )
                    ],
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


 // Container(
                      //   child: FormField(
                      //     enabled: true,
                      //     builder: (FormFieldState<dynamic> field) {
                      //       return InputDecorator(
                      //           decoration: InputDecoration(
                      //             // labelText: 'Country',
                      //             // labelStyle: const TextStyle(color: Colors.grey),
                      //             filled: true,
                      //             fillColor: Colors.white,
                      //             contentPadding: const EdgeInsets.only(
                      //                 top: 6.0, bottom: 0.0),
                      //             border: OutlineInputBorder(
                      //                 borderRadius: BorderRadius.circular(8),
                      //                 borderSide: const BorderSide(
                      //                     width: 0, style: BorderStyle.none)),
                      //             errorText: field.errorText,
                      //           ),
                      //           child: 
                      //           // ListView.builder(
                      //           //   scrollDirection: Axis.horizontal,
                      //           //   itemCount: _buttonTiles.length,

                      //           //   itemBuilder: (BuildContext context, int index){
                      //           //     return Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
                      //           //     child: ElevatedButton(
                      //           //       onPressed: (){
                      //           //         setState(() {
                      //           //           _selectedIndex = index;
                      //           //         });
                      //           //       },
                      //           //       child: Text(_buttonTiles[index],
                      //           //       style: TextStyle(
                      //           //         color: _selectedIndex == index ? Colors.grey :Colors.green,
                      //           //         fontSize: _selectedIndex == index ? 15 : 18,
                      //           //       ),
                      //           //       ),
                      //           //     ),
                      //           //     ),
                      //           //   }
                      //           //   );
                      //           SingleChildScrollView(
                      //             scrollDirection: Axis.horizontal,
                      //             child: Row(
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.spaceEvenly,
                      //               children: [
                      //                 TextButton(
                      //                   onPressed: () {
                                          
                      //                   },
                                        
                      //                   child: const Text(
                      //                     'PS4',
                      //                     style:  TextStyle(color: Colors.grey),
                      //                   ),
                      //                 ),
                      //                 TextButton(
                      //                     onPressed: () {
                      //                     },
                      //                     child: const Text(
                      //                       'PS5',
                      //                       style:
                      //                           TextStyle(color: Colors.grey),
                      //                     )),
                      //                 TextButton(
                      //                     onPressed: () {},
                      //                     child: const Text(
                      //                       'XBOX One',
                      //                       style:
                      //                           TextStyle(color: Colors.grey),
                      //                     )),
                      //                 TextButton(
                      //                     onPressed: () {},
                      //                     child: const Text(
                      //                       'XBOX Series',
                      //                       style:
                      //                           TextStyle(color: Colors.grey),
                      //                     )),
                      //                 TextButton(
                      //                     onPressed: () {},
                      //                     child: const Text(
                      //                       'PC',
                      //                       style:
                      //                           TextStyle(color: Colors.grey),
                      //                     ))
                      //               ],
                      //             ),
                      //           ),
                      //           );
                      //     },
                      //   ),
                      // ),