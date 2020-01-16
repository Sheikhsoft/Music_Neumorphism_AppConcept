import 'package:flutter/material.dart';
import 'package:flutter_music_neumorphism/AppVariables/AppColor.dart';
import 'package:flutter_music_neumorphism/AppVariables/AppData.dart';
import 'package:flutter_music_neumorphism/Models/songModel.dart';
import 'package:flutter_music_neumorphism/Widgets/ChoosenSongWidget.dart';
import 'package:flutter_music_neumorphism/Widgets/NeumophismContainer.dart';
import 'package:flutter_music_neumorphism/Widgets/SongWidget.dart';
import 'package:flutter_music_neumorphism/Widgets/SpinningImage.dart';

class SongList extends StatefulWidget {
  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  double sliderValue = 0;
  String playingSong;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Background,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'THE LAST VOL',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Hero(
                        tag: 'leftButtonHero',
                        child: NeumorPhismContainer(
                          width: 50,
                          height: 50,
                          backgroundColor: AppColor.NavigateButton,
                          backgroundDarkerColor: AppColor.Background,
                          child: Icon(
                            Icons.favorite,
                            size: 20,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      Hero(
                        tag: 'imageHero',
                        child: SpinningImage(
                          height: 180,
                        ),
                      ),
                      Hero(
                        tag: 'rightButtonHero',
                        child: NeumorPhismContainer(
                          width: 50,
                          height: 50,
                          backgroundColor: AppColor.NavigateButton,
                          backgroundDarkerColor: AppColor.Background,
                          child: Icon(
                            Icons.more_horiz,
                            size: 20,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: ListView.builder(
                      itemCount: songs.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (songs[index].id == playingSong) {
                          return ChoosenSongWidget(
                            onPressPlay: (SongModel song) {
                              setState(() {
                                playingSong = song.id;
                              });
                            },
                            song: songs[index],
                          );
                        } else {
                          return SongWidget(
                            song: songs[index],
                            onPressPlay: (SongModel song) {
                              setState(() {
                                playingSong = song.id;
                              });
                            },
                          );
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
