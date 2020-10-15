import 'package:animation_director/animation_director.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/splash_page_widgets.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String group;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0095D8),
      body: AnimationDirector(
          repeatTimes: 1,
          speed: 2,
          autoStart: true,
          group: group,
          onCompleted: (int repeated, Duration runtime) {
            print("FINISHED - REPEATED $repeated in ${runtime.inMilliseconds}");
          },
          cast: <ActorWidget>[
            backGround(context: context),
            logo(context: context, startInMilliseconds: 600, duration: 1500),
          ]),
    );
  }
}
