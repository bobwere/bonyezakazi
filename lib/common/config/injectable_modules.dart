import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  Dio get dio => Dio();
  @preResolve
  Future<SharedPreferences> get pref => SharedPreferences.getInstance();
  @lazySingleton
  FlutterSecureStorage get storage => FlutterSecureStorage();
  @lazySingleton
  DioCacheManager get cacheManager => DioCacheManager(CacheConfig());
  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  @lazySingleton
  FirebaseMessaging get firemessaging => FirebaseMessaging();
  @lazySingleton
  FirebaseAuth get firebaseauth => FirebaseAuth.instance;
}
