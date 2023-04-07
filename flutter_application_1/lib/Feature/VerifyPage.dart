// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/RevivePassword.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import '../../Core/Animation/Fade_Animation.dart';
import '../../Core/Colors/Hex_Color.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
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
                      height: 100,
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
                            Text("確認コードをメールに送信しました。"),
                            Text("ここにチェックを入れて入力してください。。"),
                            SizedBox(width: 20.0, height: 6.0),
                            Text(
                                "We have sent the verification code to your e-mail.",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 11)),
                            Text(
                                "Please check your e-mail and type it right here..",
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
                            "Verification Code has been sent",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 128, 128),
                                letterSpacing: 0.5),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        VerificationCode(
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Theme.of(context).primaryColor),
                          keyboardType: TextInputType.number,
                          underlineColor: Colors
                              .amber, // If this is null it will use primaryColor: Colors.red from Theme
                          length: 4,
                          cursorColor: Colors
                              .blue, // If this is null it will default to the ambient
                          // clearAll is NOT required, you can delete it
                          // takes any widget, so you can implement your design
                          clearAll: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'clear all',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue[700]),
                            ),
                          ),
                          margin: const EdgeInsets.all(12),
                          onCompleted: (String value) {
                            setState(() {
                              // _code = value;
                            });
                          },
                          onEditing: (bool value) {
                            setState(() {
                              // _onEditing = value;
                            });
                            // if (!_onEditing) FocusScope.of(context).unfocus();
                          },
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
                                  return const RevivePassword();
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
