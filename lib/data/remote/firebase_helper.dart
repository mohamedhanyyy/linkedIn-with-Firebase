import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkedin/core/constants.dart';
import 'package:linkedin/data/local/cache_helper.dart';
import 'package:linkedin/presentation/widgets/dialogues.dart';
import 'package:linkedin/services/locator.dart';

class FirebaseHelper {
  FirebaseHelper._();

  factory FirebaseHelper() {
    firestore = FirebaseFirestore.instance;
    firebaseAuth = FirebaseAuth.instance;
    return FirebaseHelper._();
  }

  static FirebaseFirestore? firestore;
  static FirebaseAuth? firebaseAuth;

  static Dialogues dialogues = locator.get<Dialogues>();

  static final String userUid = FirebaseAuth.instance.currentUser!.uid;

  static Future<void> postToFirebaseCollection({
    required String collectionName,
    required Map<String, dynamic> data,
  }) async {
    return await firestore!.collection(collectionName).doc().set(data);
  }

  static Future<void> postToFirebaseDocument({
    required String collectionName,
    required String documentName,
    required Map<String, dynamic> data,
  }) async {
    return await firestore!
        .collection(collectionName)
        .doc(documentName)
        .set(data);
  }

  static getFirebaseQuery({required String collectionPath}) {
    List<dynamic> data = [];
    QuerySnapshot? snapshot = FirebaseFirestore.instance
        .collection(collectionPath)
        .get() as QuerySnapshot<Object?>?;
    for (var element in snapshot!.docs) {
      data.add(element.data());
    }
    return data;
  }

  static Future<dynamic> loginUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    await firebaseAuth!
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      CacheHelper.saveUid();
      dialogues.alertDialog(
          context: context,
          title: 'Login',
          desc: 'Login done',
          dialogType: DialogType.SUCCES,
          buttonName: 'Ok',
          onTap: () {
            Navigator.pop(context);
          });
      return await postToFirebaseDocument(
          collectionName: userCollectionName,
          documentName: userUid,
          data: {
            'email': email,
            'password': password,
          });
    });
  }

  static signupUser(
      {required String email,
      required String password,
      required String name,
      required BuildContext context}) {
    firebaseAuth!
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      CacheHelper.saveUid();
      return postToFirebaseDocument(
          collectionName: userCollectionName,
          documentName: userUid,
          data: {
            'email': email,
            'password': password,
            'name': name,
            'userUid': userUid,
          }).then((value) => dialogues.alertDialog(
          context: context,
          title: 'Sign up',
          desc: 'Sign up done',
          dialogType: DialogType.SUCCES,
          buttonName: 'Ok',
          onTap: () {
            Navigator.pop(context);
          }));
    });
  }
}
