import 'dart:io';
import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class PushNotificationService {
  const PushNotificationService(this._pref, this._fcm, this._firestore);
  final FirebaseFirestore _firestore;
  final SharedPreferences _pref;
  final FirebaseMessaging _fcm;

  Future initialise() async {
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );

    String userID = _pref.getString(USER_ID);

    String pushToken = await _fcm.getToken();

    _firestore
        .collection('users')
        .doc(userID)
        .update({'pushToken': pushToken}).catchError((err) {
      print(err);
    });
  }

  onTokenRefresh() async {
    String userID = _pref.getString(USER_ID);

    String pushToken = await _fcm.getToken();

    await _firestore
        .collection('users')
        .doc(userID)
        .update({'pushToken': pushToken}).catchError((err) {
      print(err);
    });
  }
}
