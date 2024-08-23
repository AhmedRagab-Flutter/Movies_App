import 'package:final_iti_project/controller/data_provider.dart';
import 'package:final_iti_project/view/pages/details_page.dart';
import 'package:final_iti_project/view/widgets/custom_container_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrendingMoviesPage extends StatelessWidget {
  const TrendingMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<DataProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xff17162e),
      appBar: AppBar(
        title: const Text("Trending"),
        backgroundColor: const Color(0xff17162e),
        elevation: 0,
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: _provider.trendingMovies.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailsPage(
                          image: _provider.trendingMovies[index].backdrop ??
                              "/oOce9hLMVFubjAJliau4kiSNPnW.jpg",
                          name: _provider.trendingMovies[index].name ??
                              "Loading...",
                          review:
                              _provider.trendingMovies[index].review ?? "0.0",
                          overview: _provider.trendingMovies[index].overview ??
                              "Loading...",
                          language:
                              _provider.trendingMovies[index].language ?? "en",
                          date: _provider.trendingMovies[index].date ??
                              "Loading...",
                          list: _provider.trendingMovies,
                          index: index,
                        )));
              },
              child: CustomContainerHome(
                image: _provider.trendingMovies[index].poster!,
                name: _provider.trendingMovies[index].name ?? "Loading...",
                review: _provider.trendingMovies[index].review!,
                date: _provider.trendingMovies[index].date ?? "Loading...",
                type: _provider.trendingMovies[index].type ?? "Movie",
              ),
            );
          }),
    );
  }
}
