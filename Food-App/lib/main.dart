import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/details_screen.dart';
import 'package:food_app/widgets/category_title.dart';
import 'package:food_app/widgets/food_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
          fontFamily: "Poppins",
          scaffoldBackgroundColor: kWhiteColor,
          primaryColor: kPrimaryColor,
          textTheme: TextTheme(
            headline: TextStyle(fontWeight: FontWeight.bold),
            button: TextStyle(fontWeight: FontWeight.bold),
            title: TextStyle(fontWeight: FontWeight.bold),
            body1: TextStyle(color: kTextColor),
          )),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: EdgeInsets.all(10),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kPrimaryColor.withOpacity(.26),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kPrimaryColor,
          ),
          child: SvgPicture.asset("assets/icons/plus.svg"),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 50),
            child: Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                "assets/icons/menu.svg",
                height: 11,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Mutlaka denemeniz gereken  \nHarika Lezzetler",
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                CategoryTitle(title: "Hepsi", active: true),
                CategoryTitle(title: "italyan"),
                CategoryTitle(title: "Asya"),
                CategoryTitle(title: "Hindistan"),
                CategoryTitle(title: "Burgers"),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: kBorderColor),
            ),
            child: SvgPicture.asset("assets/icons/search.svg"),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                FoodCard(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return DetailsScreen();
                      }),
                    );
                  },
                  title: "Vegan salata kasesi ",
                  image: "assets/images/image_1.png",
                  price: 20,
                  calories: "450Kcal",
                  description:
                      "Salata, genellikle sebze veya meyvelerden olusan sade karisim ya da uzerine yogurt ya da salata sosu dokulmesiyle hazirlanan ve yemeklere eslik eden yiyecek karisimi. Kimi zaman icine et ya da peynir gibi yiyecekler de konulur. Mevsimine ve yapildigi yoreye ozgu sayisiz cesidi yapilir.Bu salata tam olarak veganlara uygundur .   ",
                ),
                FoodCard(
                  press: () {},
                  title: "Vegan salata 2 ",
                  image: "assets/images/image_2.png",
                  price: 20,
                  calories: "300",
                  description:
                      "Vegan Diyet Belirli Besinler Acisindan Zengindir: Tipik bir Bati diyetinden vegan diyetine gecerseniz, et ve hayvansal urunleri ortadan kaldirirsiniz Bu, kacinilmaz olarak diger gidalara daha fazla guvenmenize yol acacaktir. Tam gida vegan diyeti soz konusu oldugunda, ikameler tam tahillar, meyveler, sebzeler, fasulye, bezelye, kabuklu yemisler ve tohumlar seklindedir. Bu yiyecekler, tipik bir Bati diyetinden daha buyuk bir vegan diyeti olusturdugundan, belirli faydali besinlerin gunluk aliminin daha yuksek olmasina katkida bulunabilirler. Birkac calisma, vegan diyetlerinin daha fazla lif, antioksidan ve faydalı bitki bilesikleri saglama egiliminde oldugunu bildirmistir. ",
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
