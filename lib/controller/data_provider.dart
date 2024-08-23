import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:final_iti_project/model/model_class.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class DataProvider extends ChangeNotifier {
  List<AppModel> trendingMovies = [];
  List<AppModel> topRatedMovies = [];
  List<AppModel> popularMovies = [];
  List<AppModel> savedItems = [];
  bool isAdded = false;
  int index = 0;

  String apiKey = "9af9a7e1b7e5da3f56bd196fb4739912";
  String accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YWY5YTdlMWI3ZTVkYTNmNTZiZDE5NmZiNDczOTkxMiIsInN1YiI6IjY0ZGU4MTM5ZTE5ZGU5MDBlMzQyNWI3YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vVXsZ-D8La1u9DhmB-AODsGvlXqozyzB4-3sYi3EFdI";
  void fetchData() async {
    TMDB tmdb = TMDB(
      ApiKeys(apiKey, accessToken),
      logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true),
    );
    Map trendings = await tmdb.v3.trending.getTrending();
    Map topRated = await tmdb.v3.movies.getTopRated();
    Map popular = await tmdb.v3.tv.getPopular();
    List<AppModel> trendingList = List<AppModel>.from(
        trendings['results'].map((dynamic item) => AppModel.fromJson(item)));
    List<AppModel> topRatedList = List<AppModel>.from(
        topRated['results'].map((dynamic item) => AppModel.fromJson(item)));
    List<AppModel> popularList = List<AppModel>.from(
        popular['results'].map((dynamic item) => AppModel.fromJson(item)));

    trendingMovies = trendingList;
    topRatedMovies = topRatedList;
    popularMovies = popularList;
    notifyListeners();
  }

  transToPupular() {
    index = 0;
    notifyListeners();
  }

  transToTopRated() {
    index = 1;
    notifyListeners();
  }

  transToTrending() {
    index = 2;
    notifyListeners();
  }

  transToSaved() {
    index = 3;
    notifyListeners();
  }

  addItemToSaved(int i, List<AppModel> list, context) {
    isAdded = !isAdded;
    savedItems.add(list[i]);
    awesomeTopSnackbar(context, "Successfuly Saved",
        iconWithDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(),
            color: Colors.green),
        icon: const Icon(
          Icons.done,
          color: Colors.white,
        ));
    notifyListeners();
  }

  removeItemFromSaved(int i, List<AppModel> list, context) {
    isAdded = !isAdded;
    savedItems.remove(list[i]);
    awesomeTopSnackbar(context, "Successfuly Removed",
        iconWithDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(),
            color: Colors.green),
        icon: const Icon(
          Icons.done,
          color: Colors.white,
        ));
    notifyListeners();
  }
}
