import 'package:body_optimizer/screens/workout/workoutlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class WorkoutVideoPlayer extends StatefulWidget {
  int index2;
  final VoidCallback onInitialized;

  WorkoutVideoPlayer({Key? key, required this.index2, required this.onInitialized}) : super(key: key);

  @override
  State<WorkoutVideoPlayer> createState() => _WorkoutVideoPlayerState();
}

class _WorkoutVideoPlayerState extends State<WorkoutVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }


}
