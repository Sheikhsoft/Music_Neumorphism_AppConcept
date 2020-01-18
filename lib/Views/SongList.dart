import 'package:flutter/material.dart';
import 'package:flutter_music_neumorphism/AppVariables/AppColor.dart';
import 'package:flutter_music_neumorphism/AppVariables/AppData.dart';
import 'package:flutter_music_neumorphism/Models/songModel.dart';
import 'package:flutter_music_neumorphism/Widgets/ChoosenSongWidget.dart';
import 'package:flutter_music_neumorphism/Widgets/NeumophismContainer.dart';
import 'package:flutter_music_neumorphism/Widgets/SongWidget.dart';
import 'package:flutter_music_neumorphism/Widgets/SpinningImage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongList extends StatefulWidget {
  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  double sliderValue = 0;
  String playingSong;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 1080, height: 2160, allowFontScaling: false);
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
                  height: ScreenUtil().setHeight(100),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'THE LAST VOL',
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(40),
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: ScreenUtil().setHeight(90),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Hero(
                        tag: 'leftButtonHero',
                        child: NeumorPhismContainer(
                          width: ScreenUtil().setWidth(130),
                          height: ScreenUtil().setWidth(130),
                          backgroundColor: AppColor.NavigateButton,
                          backgroundDarkerColor: AppColor.Background,
                          child: Icon(
                            Icons.favorite,
                            size: ScreenUtil().setSp(50),
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      Hero(
                        tag: 'imageHero',
                        child: SpinningImage(
                          height: ScreenUtil().setWidth(400),
                        ),
                      ),
                      Hero(
                        tag: 'rightButtonHero',
                        child: NeumorPhismContainer(
                          width: ScreenUtil().setWidth(130),
                          height: ScreenUtil().setWidth(130),
                          backgroundColor: AppColor.NavigateButton,
                          backgroundDarkerColor: AppColor.Background,
                          child: Icon(
                            Icons.more_horiz,
                            size: ScreenUtil().setSp(50),
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: ScreenUtil().setHeight(90),
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
