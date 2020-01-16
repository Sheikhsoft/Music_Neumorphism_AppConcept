import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_neumorphism/AppVariables/AppColor.dart';
import 'package:flutter_music_neumorphism/Widgets/NeumophismContainer.dart';

class SpinningImage extends StatefulWidget {
  final double height;

  const SpinningImage({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  _SpinningImageState createState() => _SpinningImageState();
}

class _SpinningImageState extends State<SpinningImage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 300));
    animation = Tween<double>(begin: 0, end: 100).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: animation.value,
      child: NeumorPhismContainer(
        width: widget.height,
        height: widget.height,
        spreadRadius: 8,
        blurRadius: 25,
        offset: 10,
        backgroundColor: AppColor.Darker,
        backgroundDarkerColor: AppColor.Darker,
        borderDarkerColor: AppColor.NavigateButton,
        borderColor: AppColor.NavigateButton,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.height / 2),
          child: Image.network(
            'https://i.ytimg.com/vi/doT10lpO1hI/maxresdefault.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
