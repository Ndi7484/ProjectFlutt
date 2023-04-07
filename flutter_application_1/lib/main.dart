import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart_op.dart';
import 'package:provider/provider.dart';

import 'Feature/Login/LogIn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartOperation>(
      create: (context) => CartOperation(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Web',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: LoginScreen(),
    // );
  }
}
