import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_neumorphism/Services/routes.dart';
import 'package:flutter_music_neumorphism/Views/SongDetail.dart';
import 'package:flutter_music_neumorphism/Views/SongList.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final Map args = settings.arguments;
  switch (settings.name) {
    case Routes.SongDetail:
      return MaterialPageRoute(
          builder: (context) => SongDetail(
                song: args['song'],
              ));
    case Routes.SongList:
      return MaterialPageRoute(builder: (context) => SongList());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}
