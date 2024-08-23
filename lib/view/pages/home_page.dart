import 'package:final_iti_project/controller/data_provider.dart';
import 'package:final_iti_project/view/pages/popularmovies_page.dart';
import 'package:final_iti_project/view/pages/saved_page.dart';
import 'package:final_iti_project/view/pages/topratedmovies_page.dart';
import 'package:final_iti_project/view/pages/trendingmovies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<DataProvider>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Color(0xff282ddb),
        ),
        child: Scaffold(
          floatingActionButton: MaterialButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SavedPage()));
            },
            color: const Color(0xff282ddb),
            shape: const CircleBorder(),
            height: 60,
            child: const Icon(
              Icons.turned_in,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xff17162e),
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (i) => setState(() => _currentIndex = i),
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: const Text("Home"),
                selectedColor: Colors.amber,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.leaderboard),
                title: const Text("Toprated"),
                selectedColor: Colors.green,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.trending_up),
                title: const Text("Trending"),
                selectedColor: Colors.blue,
              ),
            ],
          ),
          body: _currentIndex == 0
              ? const PopularMaviesPage()
              : _currentIndex == 1
                  ? const TopRatedMoviesPage()
                  : const TrendingMoviesPage(),
        ));
  }
}
