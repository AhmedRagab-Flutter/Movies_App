import 'package:flutter/material.dart';

class CustomContainerHome extends StatelessWidget {
  final String image;
  final String name;
  final String review;
  final String date;
  final String type;
  const CustomContainerHome(
      {super.key,
      required this.image,
      required this.name,
      required this.review,
      required this.date,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xff1d1c3b),
                borderRadius: BorderRadius.circular(10)),
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.38),
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.08,
                left: 10,
                right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  name,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 15),
                Text(
                  "Media type:  $type",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 3),
                Text(
                  "Release date:  $date",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 15),
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
                            .copyWith(color: const Color(0xffe3c84e))),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.285,
            padding: const EdgeInsets.all(20),
            child: Image.network(
              "https://image.tmdb.org/t/p/w500$image",
            ),
          ),
        ],
      ),
    );
  }
}
