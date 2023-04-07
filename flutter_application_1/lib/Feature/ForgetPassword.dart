// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/VerifyPage.dart';
import 'package:flutter_application_1/menu/menupage.dart';

import '../../Core/Animation/Fade_Animation.dart';
import '../../Core/Colors/Hex_Color.dart';
// import '../SignUp/SignUp.dart';

enum FormData {
  email,
}

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  FormData? selected;

  TextEditingController emailController = TextEditingController();

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
                    Container(
                      width: 350,
                      height: 130,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("chat2.png"),
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
                            Text("残念ながら、パスワードを忘れてしまいました。"),
                            Text("心配はいりません。。ここに電子メールを入力してください。パスワードを回復します。。"),
                            SizedBox(width: 20.0, height: 6.0),
                            Text("Too bad, you forget your password.",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 11)),
                            Text(
                                "Don't worry.. please type your e-mail here and we will recover your password.",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 11)),
                          ],
                        ),
                      ),
                    ),
                    Image.asset('maid2.png', width: 150),
                  ],
                ),
                Card(
                  elevation: 5,
                  color: const Color.fromARGB(255, 255, 255, 255),
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
                            "Please type your e-mail",
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
                            child: TextField(
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
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return const VerifyPage();
                                }));
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
                                "Verify",
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

                //End of Center Card
              ],
            ),
          ),
        ),
      ),
    );
  }
}
