import 'package:flutter/material.dart';
import 'package:stat_tracker/utils/background.dart';
import 'package:stat_tracker/utils/validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
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
            padding: EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
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
                height: 20,
              ),
              const Text(
                "NEW TO FUT TRACKER? IT'S FREE TO JOIN",
                style: TextStyle(color: Colors.white, fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15,),
              TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => Validator.validateEmail(
                      email: emailController.text),
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
                const SizedBox(height: 15,),
              TextFormField(
                  controller: usernameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => Validator.validateName(
                      name: usernameController.text),
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
                const SizedBox(height: 15,),
                
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
                const SizedBox(height: 15,),
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



            ],
          ),
        ),
      ),
      ),
    );
  }
}