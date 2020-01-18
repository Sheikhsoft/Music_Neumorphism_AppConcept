import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_neumorphism/AppVariables/AppColor.dart';
import 'package:flutter_music_neumorphism/Models/songModel.dart';
import 'package:flutter_music_neumorphism/Services/navigationServices.dart';
import 'package:flutter_music_neumorphism/Services/routes.dart';
import 'package:flutter_music_neumorphism/Widgets/NeumophismContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongWidget extends StatelessWidget {
  final Function onPressPlay;
  final SongModel song;
  const SongWidget({
    Key key,
    this.song,
    this.onPressPlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressPlay(song);
        navigatorKey.currentState
            .pushNamed(Routes.SongDetail, arguments: {'song': song});
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: ListTile(
          title: Text(
            song.name,
            style: TextStyle(color: Colors.grey[500], fontSize: 20),
          ),
          subtitle: Text(song.singer,
              style: TextStyle(color: Colors.grey[700], fontSize: 15)),
          trailing: GestureDetector(
            onTap: () {
              onPressPlay(song);
            },
            child: NeumorPhismContainer(
              width: ScreenUtil().setWidth(100),
              height: ScreenUtil().setWidth(100),
              backgroundColor: AppColor.NavigateButton,
              backgroundDarkerColor: AppColor.Brighter,
              child: Icon(
                Icons.play_arrow,
                size: ScreenUtil().setSp(40),
                color: Colors.grey[500],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
