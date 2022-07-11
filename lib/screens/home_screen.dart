import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_app_module/data/food_data.dart';
import 'package:flutter_login_app_module/models/food_model.dart';
import 'package:flutter_login_app_module/screens/login_screen.dart';
import 'package:flutter_login_app_module/utils/app_text_styles.dart';
import 'package:flutter_login_app_module/utils/food_category.dart';
import 'package:flutter_login_app_module/utils/reusable_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imgList = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
  ];
  int pageIndex = 0;
  List<Widget> imageSliders = [];
  final List<FoodData> _foods = foods;
  bool? isLinkedInLoggedIn;
  bool? isFacebookLoggedIn;
  void initSlider() {
    imageSliders = imgList
        .map((item) => Container(
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(item, fit: BoxFit.cover, width: 400.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
  }

  @override
  void initState() {
    initSlider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          buildSizedBoxWidget(10),
          CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imageSliders),
          buildSizedBoxWidget(10),
          buildSizedBoxWidget(8),
          foodCategoryHeading(),
          buildSizedBoxWidget(20),
          Column(
            children: _foods.map(buildFoodCategory).toList(),
          )
        ],
      )),
      bottomNavigationBar: buildBottomNavBar(context),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: const Center(
        child: Text(
          "Home",
          style: AppTextStyles.mediumBlackTextStyle,
        ),
      ),
      leading: IconButton(
        padding: const EdgeInsets.only(left: 10),
        onPressed: () {},
        icon: const Icon(Icons.menu),
        iconSize: 24,
        color: Colors.black,
      ),
      actions: [
        IconButton(
          padding: const EdgeInsets.only(right: 15),
          onPressed: () {},
          icon: Icon(Icons.search),
          iconSize: 24,
          color: Colors.black,
        ),
        IconButton(
          padding: const EdgeInsets.only(right: 15),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          icon: const Icon(Icons.logout),
          iconSize: 24,
          color: Colors.black,
        )
      ],
    );
  }

  Widget foodCategoryHeading() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Food Category",
              style: AppTextStyles.boldTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Text(
              "View All",
              style: AppTextStyles.mediumTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  Container buildBottomNavBar(BuildContext context) {
    return Container(
      height: 55,
      decoration: const BoxDecoration(
        color: Color(0xFF0165ff),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home_filled,
                color: Colors.white,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Colors.white,
                size: 25,
              )),
        ],
      ),
    );
  }

  Widget buildFoodCategory(FoodData food) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: FoodCategory(
          imagePath: food.imagePath,
          id: food.id,
          name: food.name,
          price: food.price),
    );
  }
}
