import 'package:final_iti_project/controller/data_provider.dart';
import 'package:final_iti_project/view/pages/details_page.dart';
import 'package:final_iti_project/view/widgets/custom_container_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopRatedMoviesPage extends StatelessWidget {
  const TopRatedMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<DataProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xff17162e),
      appBar: AppBar(
        title: const Text("Toprated"),
        backgroundColor: const Color(0xff17162e),
        elevation: 0,
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: _provider.topRatedMovies.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailsPage(
                          image: _provider.topRatedMovies[index].backdrop ??
                              "/oOce9hLMVFubjAJliau4kiSNPnW.jpg",
                          name: _provider.topRatedMovies[index].name ??
                              "Loading...",
                          review:
                              _provider.topRatedMovies[index].review ?? "0.0",
                          overview: _provider.topRatedMovies[index].overview ??
                              "Loading...",
                          language:
                              _provider.topRatedMovies[index].language ?? "en",
                          date:
                              _provider.topRatedMovies[index].dateforToprated ??
                                  "Loading...",
                          list: _provider.topRatedMovies,
                          index: index,
                        )));
              },
              child: CustomContainerHome(
                image: _provider.topRatedMovies[index].poster!,
                name: _provider.topRatedMovies[index].name ?? "Loading...",
                review: _provider.topRatedMovies[index].review!,
                date: _provider.topRatedMovies[index].dateforToprated ??
                    "Loading...",
                type: _provider.topRatedMovies[index].type ?? "Movie",
              ),
            );
          }),
    );
  }
}
