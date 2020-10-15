import 'package:animation_director/animation_director.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

ActorWidget backGround({BuildContext context}) {
  return ActorWidget(name: 'Background', actions: [
    ActorAction(
        character: ActorCharacter(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: kBlueBackgroundColor)))
  ]);
}

ActorWidget logo(
    {BuildContext context, int startInMilliseconds, int duration}) {
  return ActorWidget(name: 'Logo', actions: [
    ActorAction(
        waitBeforeStart: Duration(milliseconds: startInMilliseconds),
        character: ActorCharacter(
          child: Center(
            child: Center(
              child: TextResponsive("Majob",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'AvenirRound',
                    fontWeight: FontWeight.w700,
                    fontSize: 50,
                  )),
            ),
          ),
        ),
        scale: ActorScale(startScale: 0, finishScale: 0)),
    ActorAction(
      scale: ActorScale(
          alignment: Alignment.center,
          startScale: 0,
          finishScale: 1,
          curve: Curves.elasticOut,
          duration: Duration(milliseconds: duration)),
    ),
  ]);
}
