import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie/model/movie/index.dart';
import 'package:movie/widgets/movie_card.dart';
import 'package:movie/widgets/movie_special_card.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  Future<List<MovieModel>> __getData() async {
    String res =
        await DefaultAssetBundle.of(context).loadString("assets/movies.json");

    return MovieModel.fronList(jsonDecode(res));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: __getData(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          final _specialData = snapshot.data!.length > 3
              ? snapshot.data!.sublist(0, 3)
              : snapshot.data!;
          return SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Trailers",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                padding: EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    _specialData.length,
                    ((index) => MovieSpecialCard(_specialData[index])),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Now is Cinema",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 10,
                  children: List.generate(
                    snapshot.data!.length,
                    (index) => MovieCard(snapshot.data![index]),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ));
        } else {
          return SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
