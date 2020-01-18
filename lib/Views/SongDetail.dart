import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_neumorphism/AppVariables/AppColor.dart';
import 'package:flutter_music_neumorphism/Models/songModel.dart';
import 'package:flutter_music_neumorphism/Widgets/NeumophismContainer.dart';
import 'package:flutter_music_neumorphism/Widgets/SpinningImage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongDetail extends StatefulWidget {
  final SongModel song;

  const SongDetail({Key key, @required this.song}) : super(key: key);
  @override
  _SongDetailState createState() => _SongDetailState();
}

class _SongDetailState extends State<SongDetail> {
  double sliderValue = 0;
  bool isPlaying = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Background,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(ScreenUtil().setHeight(30)),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Hero(
                        tag: 'leftButtonHero',
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: NeumorPhismContainer(
                            width: ScreenUtil().setWidth(130),
                            height: ScreenUtil().setWidth(130),
                            backgroundColor: AppColor.NavigateButton,
                            backgroundDarkerColor: AppColor.Background,
                            child: Icon(
                              Icons.arrow_back,
                              size: ScreenUtil().setSp(50),
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'PLAYING NOW',
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(40),
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          textAlign: TextAlign.center,
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
                            Icons.menu,
                            size: ScreenUtil().setSp(50),
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: ScreenUtil().setHeight(90),
                  ),
                  Hero(
                    tag: 'imageHero',
                    child: SpinningImage(
                      height: ScreenUtil().setHeight(800),
                    ),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(90),
                  ),
                  Text(
                    widget.song.name,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(70),
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(30),
                  ),
                  Text(
                    widget.song.singer,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(35),
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(90),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '0:00',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: ScreenUtil().setSp(35),
                        ),
                      ),
                      Spacer(),
                      Text(
                        '12:00',
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: ScreenUtil().setSp(35)),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        thumbColor: Colors.grey,
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: ScreenUtil().setSp(30))),
                    child: Slider(
                      activeColor: AppColor.NavigateButton,
                      inactiveColor: AppColor.Brighter,
                      value: sliderValue,
                      onChanged: (newValue) {
                        setState(() {
                          sliderValue = newValue;
                        });
                      },
                    ),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(90),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      NeumorPhismContainer(
                        width: ScreenUtil().setWidth(200),
                        height: ScreenUtil().setWidth(200),
                        backgroundColor: AppColor.NavigateButton,
                        backgroundDarkerColor: AppColor.Brighter,
                        borderColor: AppColor.NavigateButton,
                        borderDarkerColor: AppColor.NavigateButton,
                        child: Icon(
                          Icons.skip_previous,
                          size: ScreenUtil().setSp(70),
                          color: Colors.grey[700],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                        child: Hero(
                          tag: 'playButtonHero',
                          child: NeumorPhismContainer(
                            width: ScreenUtil().setWidth(200),
                            height: ScreenUtil().setWidth(200),
                            backgroundColor: AppColor.PauseButton,
                            backgroundDarkerColor: AppColor.PauseButtonDarker,
                            borderColor: AppColor.PauseButton,
                            borderDarkerColor: AppColor.PauseButton,
                            child: Icon(
                              isPlaying ? Icons.pause : Icons.play_arrow,
                              size: ScreenUtil().setSp(70),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      NeumorPhismContainer(
                        width: ScreenUtil().setWidth(200),
                        height: ScreenUtil().setWidth(200),
                        backgroundColor: AppColor.NavigateButton,
                        backgroundDarkerColor: AppColor.Brighter,
                        borderColor: AppColor.NavigateButton,
                        borderDarkerColor: AppColor.NavigateButton,
                        child: Icon(
                          Icons.skip_next,
                          size: ScreenUtil().setSp(70),
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
