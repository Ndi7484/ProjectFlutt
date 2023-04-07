// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/ForgetPassword.dart';
import 'package:flutter_application_1/menu/menupage.dart';

import '../../Core/Animation/Fade_Animation.dart';
import '../../Core/Colors/Hex_Color.dart';
import '../SignUp/SignUp.dart';

enum FormData {
  email,
  password,
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;
  FormData? selected;
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.1, 0.4, 0.7, 0.9],
            colors: [
              HexColor("#4b4293").withOpacity(0.8),
              HexColor("#4b4293"),
              HexColor("#08418e"),
              HexColor("#08418e")
            ],
          ),
          image: const DecorationImage(
              fit: BoxFit.cover, image: AssetImage('pink.jpg')),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('maid_a.png', width: 150),
                    Container(
                      width: 300,
                      height: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("chat.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 20,
                            20), //apply padding to LTRB, L:Left, T:Top, R:Right, B:Bottom
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("いらっしゃいませ !!"),
                            Text("最初にログインしてください"),
                            SizedBox(width: 20.0, height: 6.0),
                            Text("Welcome !!",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 11)),
                            Text("Please login first",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 11)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Card(
                  elevation: 5,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Form(
                    key: _formKey,
                    child: Container(
                      width: 400,
                      padding: const EdgeInsets.all(40.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FadeAnimation(
                              delay: 0.8,
                              child: Image.asset(
                                'logo.png',
                                width: 150,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          FadeAnimation(
                            delay: 1,
                            child: const Text(
                              "Please sign in to continue",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 128, 128),
                                  letterSpacing: 0.5),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                            delay: 1,
                            child: Container(
                              width: 300,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.grey[200],
                              ),
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: emailController,
                                onTap: () {
                                  setState(() {
                                    selected = FormData.email;
                                  });
                                },
                                decoration: const InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      height: 1.75),
                                ),
                                textAlignVertical: TextAlignVertical.center,
                                style: const TextStyle(
                                    color: Colors.pinkAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                            delay: 1,
                            child: Container(
                              width: 300,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.grey[200]),
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: passwordController,
                                onTap: () {
                                  setState(() {
                                    selected = FormData.password;
                                  });
                                },
                                decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    prefixIcon: const Icon(
                                      Icons.lock_open_outlined,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: ispasswordev
                                          ? const Icon(
                                              Icons.visibility_off,
                                              color: Colors.pink,
                                              size: 20,
                                            )
                                          : const Icon(
                                              Icons.visibility,
                                              color: Colors.pink,
                                              size: 20,
                                            ),
                                      onPressed: () => setState(
                                          () => ispasswordev = !ispasswordev),
                                    ),
                                    hintText: 'Password',
                                    hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        height: 1.75)),
                                obscureText: ispasswordev,
                                textAlignVertical: TextAlignVertical.center,
                                style: const TextStyle(
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                            delay: 1,
                            child: TextButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return const HomePageScreen();
                                    }));
                                  }
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 255, 0, 166),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14.0, horizontal: 80),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0))),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //End of Center Card
                //Start of outer card
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(height: 10),
                FadeAnimation(
                  delay: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Forget your Password? ",
                          style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 0.5,
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const ForgetPassword();
                          }));
                        },
                        child: Text("Yes, I'm forget",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 217, 0, 255)
                                    .withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                fontSize: 14)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                FadeAnimation(
                  delay: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Don't have an account? ",
                          style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 0.5,
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const SignupScreen();
                          }));
                        },
                        child: Text("Sign up",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 217, 0, 255)
                                    .withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                fontSize: 14)),
                      ),
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
