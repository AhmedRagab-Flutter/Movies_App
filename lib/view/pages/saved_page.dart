import 'package:final_iti_project/controller/data_provider.dart';
import 'package:final_iti_project/view/pages/details_page.dart';
import 'package:final_iti_project/view/widgets/custom_container_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<DataProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xff17162e),
      appBar: AppBar(
        backgroundColor: const Color(0xff17162e),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Saved",
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: _provider.savedItems.isEmpty
          ? Center(
              child: Text(
                "No Saved Items",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: _provider.savedItems.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsPage(
                              image: _provider.savedItems[index].backdrop ??
                                  "/oOce9hLMVFubjAJliau4kiSNPnW.jpg",
                              name: _provider.savedItems[index].name ??
                                  _provider.savedItems[index].nameforPopulare ??
                                  "Loading...",
                              review:
                                  _provider.savedItems[index].review ?? "0.0",
                              overview: _provider.savedItems[index].overview ??
                                  "Loading...",
                              language:
                                  _provider.savedItems[index].language ?? "en",
                              date: _provider.savedItems[index].date ??
                                  _provider.savedItems[index].dateforPopulare ??
                                  _provider.savedItems[index].dateforToprated ??
                                  "Loading...",
                              list: _provider.savedItems,
                              index: index,
                            )));
                  },
                  child: CustomContainerHome(
                    image: _provider.savedItems[index].poster ?? "",
                    name: _provider.savedItems[index].name ??
                        _provider.savedItems[index].nameforPopulare ??
                        "Loading...",
                    review: _provider.savedItems[index].review ?? "0.0",
                    date: _provider.savedItems[index].date ??
                        _provider.savedItems[index].dateforPopulare ??
                        _provider.savedItems[index].dateforToprated ??
                        "Loading...",
                    type: _provider.savedItems[index].type ?? "Movie",
                  ),
                );
              }),
    );
  }
}
