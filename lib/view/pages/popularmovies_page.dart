import 'package:final_iti_project/controller/data_provider.dart';
import 'package:final_iti_project/view/pages/details_page.dart';
import 'package:final_iti_project/view/widgets/custom_container_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularMaviesPage extends StatelessWidget {
  const PopularMaviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<DataProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xff17162e),
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: const Color(0xff17162e),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: _provider.popularMovies.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailsPage(
                          image: _provider.popularMovies[index].backdrop ??
                              "/oOce9hLMVFubjAJliau4kiSNPnW.jpg",
                          name:
                              _provider.popularMovies[index].nameforPopulare ??
                                  "Loading...",
                          review:
                              _provider.popularMovies[index].review ?? "0.0",
                          overview: _provider.popularMovies[index].overview ??
                              "Loading...",
                          language:
                              _provider.popularMovies[index].language ?? "en",
                          date:
                              _provider.popularMovies[index].dateforPopulare ??
                                  "Loading...",
                          list: _provider.popularMovies,
                          index: index,
                        )));
              },
              child: CustomContainerHome(
                image: _provider.popularMovies[index].poster ??
                    "/1E5baAaEse26fej7uHcjOgEE2t2.jpg",
                name: _provider.popularMovies[index].nameforPopulare ??
                    "Loading...",
                review: _provider.popularMovies[index].review ?? "Loading...",
                date: _provider.popularMovies[index].dateforPopulare ??
                    "Loading...",
                type: _provider.popularMovies[index].type ?? "Movie",
              ),
            );
          }),
    );
  }
}
