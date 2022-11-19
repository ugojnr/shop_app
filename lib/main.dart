import 'dart:math';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: const HomeScreen(),
        ));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _items = [
    'assets/images/01.jpg',
    'assets/images/02.jpg',
    'assets/images/03.jpg',
    'assets/images/04.jpg',
    'assets/images/05.jpg',
    'assets/images/06.jpg',
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hello, Welcome DanDev',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(
                width: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(
                      'https://static.generated.photos/vue-static/home/feed/adult.png'),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'search',
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 49,
                  width: 49,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: SvgPicture.asset('assets/list-svgrepo-com.svg'),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(10),
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                Container(
                  height: 49,
                  width: 100,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Icon(
                    Icons.watch_outlined,
                    size: 29,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 49,
                  width: 100,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Colors.white,
                    size: 29,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 49,
                  width: 100,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Colors.white,
                    size: 29,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 49,
                  width: 100,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Colors.white,
                    size: 29,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: MasonryView(
                listOfItem: _items,
                numberOfColumn: 2,
                itemBuilder: (item) {
                  return Image.asset(item);
                }),
          ),
          BottomNavigationBar(
            elevation: 15,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            currentIndex: _currentIndex,
            selectedLabelStyle: TextStyle(color: Colors.white),
            unselectedLabelStyle: TextStyle(color: Colors.white),
            enableFeedback: true,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.store,
                  color: Colors.white,
                ),
                label: 'store',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                  color: Colors.white,
                ),
                label: 'categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                label: 'settings',
              ),
            ],
            onTap: ((index) {
              setState(() {
                _currentIndex = index;
              });
            }),
          ),
        ],
      ),
    );
  }
}
