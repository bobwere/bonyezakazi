import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:bonyeza_kazi/src/presentation/profile_page/client_profile.dart';
import 'package:bonyeza_kazi/src/presentation/profile_page/sp_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getUserTypeID().asStream(),
        builder: (context, snapshot1) {
          return StreamBuilder(
              stream: getUserName(),
              builder: (context, snapshot2) {
                if (snapshot1.hasData && snapshot2.hasData) {
                  return snapshot1.data == '5'
                      ? ClientProfile(username: username)
                      : SPProfile(username: username);
                } else {
                  return Container();
                }
              });
        });
  }

  Future<String> getUserTypeID() async {
    final pref = await SharedPreferences.getInstance();
    String userTypeID = pref.getString(USER_TYPE_ID);
    return userTypeID;
  }

  getUserName() async* {
    final rxPrefs = RxSharedPreferences(
      SharedPreferences.getInstance(),
    );
    yield rxPrefs.getStringStream(USER_NAME).listen((event) {
      setState(() {
        username = event;
      });
    });
  }
}
