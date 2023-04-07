import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_application_1/menu/basket.dart';
// import 'package:flutter_application_1/models/cart.dart';
// import 'package:flutter_application_1/models/cart_op.dart';
import 'package:input_quantity/input_quantity.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_application_1/menu/menupage.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

// ignore: constant_identifier_names
enum TypeOrdering { HoneyLemon, Lime, PureWater }

const List<String> list = <String>['Delivery', 'Take Away', 'Dine In'];

class _HomePageScreenState extends State<HomePageScreen> {
  static Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 50.0, 20.0));

  String dropdownValue = list.first;

  TypeOrdering? _character = TypeOrdering.Lime;

  bool flagWarranty = false;
  bool flagWarranty2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Page'),
      ),
      body: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("resto.jpg"),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('maid_a.png', height: 150),
              Container(
                width: 400,
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
                      Text("こちらにご注文内容をご記入ください。"),
                      Text("注文の種類を選択し、好きな食べ物を選択してください"),
                      SizedBox(width: 20.0, height: 6.0),
                      Text("Please fill in your order here.",
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 11)),
                      Text(
                          "Choose your type of order, and Choose your favorite foods..",
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 11)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: Text('Choose your order type:'),
        ),
        SliverToBoxAdapter(
            child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          isExpanded: true,
          style: const TextStyle(color: Colors.deepPurple, fontSize: 20),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value!;
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )),
        SliverToBoxAdapter(
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("white.jpg"),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(width: 40.0, height: 100.0),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient,
                    fontFamily: 'CyberGraph',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('MAIN MENU'),
                      RotateAnimatedText('主菜'),
                      RotateAnimatedText('LE PLATS'),
                    ],
                    isRepeatingAnimation: true,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverGrid.count(
            crossAxisCount: 3,
            children: List.generate(menu.length, (index) {
              return Center(
                child: SelectCard(choice: menu[index]),
              );
            })),
        SliverToBoxAdapter(
            child: Column(
          children: <Widget>[
            const Text('Choose our free services:'),
            ListTile(
              title: const Text('Honey Lemon / ハニーレモン'),
              leading: Radio<TypeOrdering>(
                value: TypeOrdering.HoneyLemon,
                groupValue: _character,
                onChanged: (TypeOrdering? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Lime / ライム'),
              leading: Radio<TypeOrdering>(
                value: TypeOrdering.Lime,
                groupValue: _character,
                onChanged: (TypeOrdering? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Pure Water / 水'),
              leading: Radio<TypeOrdering>(
                value: TypeOrdering.PureWater,
                groupValue: _character,
                onChanged: (TypeOrdering? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ],
        )),
        const SliverToBoxAdapter(
          child: Text('Add-ons :'),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: flagWarranty,
                  onChanged: (bool? value) {
                    setState(() {
                      flagWarranty = !flagWarranty;
                    });
                  },
                ),
                const Expanded(child: Text('Special for Me')),
                Checkbox(
                  value: flagWarranty2,
                  onChanged: (bool? value) {
                    setState(() {
                      flagWarranty2 = !flagWarranty2;
                    });
                  },
                ),
                const Expanded(child: Text('Special Service')),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("resto.jpg"),
              ),
            ),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const BasketScreen();
          }));
        },
        tooltip: 'My basket list',
        backgroundColor: Colors.green,
        child: const Icon(Icons.shopping_basket_rounded),
      ),
    );
  }
}

List<Choice> menu = <Choice>[
  const Choice(
      title: 'Souffle Cheesecake', pic: 'menu/souffle.jpg', price: 12.3),
  const Choice(title: 'Beefsteak', pic: 'menu/beefsteak.jpg', price: 12.3),
  const Choice(title: 'Hamburger', pic: 'menu/hamburger.jpg', price: 12.3),
  const Choice(title: 'Beef Stew', pic: 'menu/beef_stew.jpg', price: 12.3),
  const Choice(
      title: 'Breakfast Special',
      pic: 'menu/breakfast_special.jpg',
      price: 12.3),
  const Choice(
      title: 'Minced Meat Cutlet', pic: 'menu/meat_cutlet.jpg', price: 12.3),
  const Choice(
      title: 'Fried Shrimp', pic: 'menu/fried_shrimp.jpg', price: 12.3),
  const Choice(
      title: 'Spaghetti with Meat Sauce',
      pic: 'menu/spaghetti.jpg',
      price: 12.3),
  const Choice(
      title: 'Chocolate Parfait',
      pic: 'menu/chocolate_parfait.jpg',
      price: 12.3),
  const Choice(title: 'Omelette Rice', pic: 'menu/omelette.jpg', price: 12.3),
  const Choice(title: 'Tofu Steak', pic: 'menu/tofu_steak.jpg', price: 12.3),
  const Choice(
      title: 'Pork Cutlet Rice Bowl', pic: 'menu/katsudon.jpg', price: 12.3),
  const Choice(
      title: 'Pudding a la Mode', pic: 'menu/pudding.jpg', price: 12.3),
  const Choice(title: 'Sandwich', pic: 'menu/sandwich.jpg', price: 12.3),
  const Choice(
      title: 'Steamed Potato With Butter',
      pic: 'menu/steam_potato.jpg',
      price: 12.3),
  const Choice(title: 'Curry Rice', pic: 'menu/curry_rice.jpg', price: 12.3),
  const Choice(
      title: 'Chicken Curry', pic: 'menu/chicken_curry.jpg', price: 12.3),
  const Choice(
      title: 'Hamburg Steak', pic: 'menu/hamburg_steak.jpg', price: 12.3),
  const Choice(
      title: 'Assorted Cookies', pic: 'menu/assorted_cookies.jpg', price: 12.3),
  const Choice(
      title: 'Fried Seafood', pic: 'menu/fried_seafood.jpg', price: 12.3),
  const Choice(
      title: 'Melon Soda Float', pic: 'menu/melon_soda.jpg', price: 12.3),
  const Choice(title: 'Crêpes', pic: 'menu/crepes.jpg', price: 12.3),
  const Choice(
      title: 'Natto Spaghetti', pic: 'menu/natto_spaghetti.jpg', price: 12.3),
  const Choice(title: 'Carpaccio', pic: 'menu/carpaccio.jpg', price: 12.3),
  const Choice(title: 'Curry Bun', pic: 'menu/curry_bun.jpg', price: 12.3),
  const Choice(title: 'Pork Soup', pic: 'menu/pork_soup.jpg', price: 12.3),
  const Choice(title: 'Croquettes', pic: 'menu/croquettes.jpg', price: 12.3),
];

class Choice {
  const Choice({required this.title, required this.pic, required this.price});
  final String title;
  final String pic;
  final double price;
}

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;
  static Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color.fromARGB(134, 0, 195, 255),
      Color.fromARGB(131, 255, 0, 0)
    ],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 50.0, 20.0));

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 14, fontFamily: 'YellowGinger');
    return Card(
        // color: Color.fromARGB(0, 0, 0, 0),
        child: Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(choice.pic),
            Text(choice.title, style: textStyle),
            const SizedBox(width: 20.0, height: 9.0),
            InputQty(
              maxVal: 10,
              initVal: 0,
              minVal: 0,
              showMessageLimit: false,
              isIntrinsicWidth: true,
              borderShape: BorderShapeBtn.none,
              boxDecoration: const BoxDecoration(),
              steps: 1,
              onQtyChanged: (value) {
                a.updateBask(choice.title, value as int, choice.price);
                // Future.delayed(const Duration(seconds: 1), () {
                //   Provider.of<CartOperation>(context, listen: true)
                //       .updateBask(choice.title, value as int, choice.price);
                // });
              },
            ),
          ]),
    ));
  }
}
