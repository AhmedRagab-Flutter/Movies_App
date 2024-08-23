import 'package:final_iti_project/controller/data_provider.dart';
import 'package:final_iti_project/model/model_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  final String image;
  final String name;
  final String review;
  final String overview;
  final String language;
  final String date;
  final int index;
  final List<AppModel> list;
  const DetailsPage({
    super.key,
    required this.image,
    required this.name,
    required this.review,
    required this.overview,
    required this.language,
    required this.date,
    required this.index,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<DataProvider>(context);
    return Scaffold(
        backgroundColor: const Color(0xff17162e),
        body: Column(
          children: [
            Stack(
              children: [
                Image.network("https://image.tmdb.org/t/p/w500$image"),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.25),
                  child: Card(
                    color: const Color(0xff1d1c3b),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 3),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0xffe3c84e),
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Text(review,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          color: const Color(0xffe3c84e))),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            overview,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(height: 1.7),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: MediaQuery.of(context).size.width * 0.06,
                  top: MediaQuery.of(context).size.height * 0.2,
                  child: MaterialButton(
                    height: 70,
                    onPressed: () {
                      _provider.isAdded == false
                          ? _provider.addItemToSaved(index, list, context)
                          : _provider.removeItemFromSaved(index, list, context);
                    },
                    shape: const CircleBorder(),
                    color: const Color(0xff282ddb),
                    child: const Icon(
                      Icons.turned_in_not,
                      size: 33,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              color: const Color(0xff1d1c3b),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Informations",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Language:  $language",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text(
                    "Release date:  $date",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
