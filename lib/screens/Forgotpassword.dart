import 'package:flutter/material.dart';
import 'package:stat_tracker/screens/Login.dart';
import 'package:stat_tracker/utils/background.dart';
import 'package:stat_tracker/utils/validator.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
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
            padding: const EdgeInsets.all(24.0),
            child: Column(children: [
              const SizedBox(
                height: 200,
              ),
              Image.asset(
                'assets/images/images/Forgot-Password.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'FORGOT YOUR\nPASSWORD?',
                style: TextStyle(
                    color: Color.fromARGB(255, 51, 250, 207), fontSize: 30),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "To reset your password, please enter FUT Tracker email\n address and we'll send you a OTP on your registered Email id",
                style: TextStyle(color: Colors.white70, fontSize: 12.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12,),
              TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => Validator.validatePassword(
                      password: emailController.text),
                  enableSuggestions: true,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.done,
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
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 15,),
                 Container(
                  width: MediaQuery.of(context).size.width / 1.75,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    gradient: const LinearGradient(colors: [
                      Color.fromRGBO(235, 156, 38, 1),
                      Color.fromARGB(255, 216, 101, 141),
                      Color.fromRGBO(171, 71, 188, 1)
                    ]),
                  ),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: const Text(
                        'SEND OTP',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                ),
                const SizedBox(height: 10,),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: const Text(
                    'Back to Login',
                    style: TextStyle(
                        color: Color.fromARGB(255, 207, 204, 204),
                        decoration: TextDecoration.underline,
                        fontSize: 14),
                  ),
                ),
            ]),
          ),
        ),
      ),
    );
  }
}
