import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:bonyeza_kazi/src/presentation/update_profile_page/client_update_profile_page.dart';
import 'package:bonyeza_kazi/src/presentation/update_profile_page/sp_update_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({Key key}) : super(key: key);

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: getUserTypeID(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data == '5'
                ? ClientUpdateProfilePage()
                : SPUpdateProfilePage();
          } else {
            return Container();
          }
        });
  }

  Future<String> getUserTypeID() async {
    final pref = await SharedPreferences.getInstance();
    String userTypeID = pref.getString(USER_TYPE_ID);
    return userTypeID;
  }
}
