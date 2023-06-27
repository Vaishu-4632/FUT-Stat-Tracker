import 'package:flutter/material.dart';
import 'package:stat_tracker/screens/Forgotpassword.dart';
import 'package:stat_tracker/screens/RegisterScreen.dart';
import 'package:stat_tracker/utils/background.dart';
import 'package:stat_tracker/utils/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 160,
                ),
                ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(colors: [
                      Colors.yellowAccent,
                      Colors.greenAccent,
                      Colors.blueAccent
                    ]).createShader(rect);
                  },
                  child: const Text(
                    'TRACK YOUR\nWEEKEND LEAGUE\nPROGRESS',
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
                  'LET US DO THE TRACKING FOR YOU',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white70,
                      decoration: TextDecoration.none),
                ),
                const SizedBox(
                  height: 15,
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
                      // labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(width: 2, style: BorderStyle.solid))),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 12,
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
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.75,
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
                        'LOGIN',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ForgotPassword()));
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: Color.fromARGB(255, 207, 204, 204),
                        decoration: TextDecoration.underline,
                        fontSize: 14),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'New to FUT Tracker?',
                      style: TextStyle(color: Colors.white,fontSize: 15),
                      
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignUpScreen()));
                        },
                        child: const Text(
                          "Register Now,It's Free!",
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
        ),
      ),
    );
  }
//
}

//  void _showErrorDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: Text('An error occurred!'),
//         content: Text('Something went wrong.'),
//         actions: [
//           TextButton(
//             onPressed: () {},
//           ),],),);
// }

// SizedBox(height: 16),
// ElevatedButton(
//   onPressed: authProvider.isLoading ? null : () async {
//     final isValid = _formKey.currentState!.validate();
//     if (!isValid) {
//       return;
//     }

//     final loginSuccess = await authProvider.login();

//     if (!loginSuccess) {
//       _showErrorDialog(context);
//     }
//   },
//   child: authProvider.isLoading
//       ? CircularProgressIndicator()
//       : Text(authProvider.authMode == AuthMode.Login ? 'Login' : 'Signup'),
// ),
// TextButton(
//   onPressed: () {
//     final newMode = authProvider.authMode == AuthMode.Login ? AuthMode.Signup : AuthMode.Login;
//     authProvider.setAuthMode(newMode);
//   },
//   child: Text(authProvider.authMode == AuthMode.Login ? 'Don\'t have an account? Signup' : 'Already have an account? Login'),
// ),
// void signInWithEmailAndPassword(BuildContext context) async {
//   try{
//     final auth = Provider.of(context,listen: false);
//     signInWithEmailAndPassword(
//       email: emailController.text,
//       password:passwordController.text
//     );
//   }on FirebaseAuthException catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text(e.message),
//     ));
//   }
// }
