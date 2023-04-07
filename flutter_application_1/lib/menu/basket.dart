import 'package:flutter/material.dart';
// import 'package:flutter_application_1/menu/menupage.dart';
import 'package:flutter_application_1/models/cart_op.dart';
// import 'package:provider/provider.dart';

var a = CartOperation();

class BasketScreen extends StatefulWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body:
            // Consumer<CartOperation>(
            //   builder: (context, CartOperation data, child) {
            //     return ListView.builder(
            //       itemCount: data.getBask.length,
            //       itemBuilder: (context, index) {
            //         return ListView(
            //             children: List.generate(a.getBask.length, (index) {
            //           return const ListTile(
            //             leading: FlutterLogo(size: 72.0),
            //             title: Text('here'),
            //             subtitle: Text(
            //                 'A sufficiently long subtitle warrants three lines.'),
            //             trailing: Icon(Icons.more_vert),
            //             isThreeLine: true,
            //           );
            //         }));
            //         // NotesCard(data.getBask[index]);
            //       },
            //     );
            //   },
            // )
            ListView(
                children: List.generate(a.getBask.length, (index) {
          return const ListTile(
            leading: FlutterLogo(size: 72.0),
            title: Text('here'),
            subtitle:
                Text('A sufficiently long subtitle warrants three lines.'),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          );
        }))

        // const [
        //   Card(
        //     child: ListTile(
        //       leading: FlutterLogo(size: 72.0),
        //       title: Text('Three-line ListTile'),
        //       subtitle:
        //           Text('A sufficiently long subtitle warrants three lines.'),
        //       trailing: Icon(Icons.more_vert),
        //       isThreeLine: true,
        //     ),
        //   ),
        //   Card(
        //     child: ListTile(
        //       leading: FlutterLogo(size: 72.0),
        //       title: Text('Three-line ListTile'),
        //       subtitle:
        //           Text('A sufficiently long subtitle warrants three lines.'),
        //       trailing: Icon(Icons.more_vert),
        //       isThreeLine: true,
        //     ),
        //   ),
        // ]),
        // body: Center(
        //   child: ElevatedButton(
        //     onPressed: () {
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) => const HomePageScreen()));
        //     },
        //     child: const Text('Buy This'),
        //   ),
        // ),
        );
  }
}
