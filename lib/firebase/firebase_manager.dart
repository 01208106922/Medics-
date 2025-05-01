import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../model/user_model.dart';

class FirebaseManager {

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, options) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (user, options) {
        return user.toJson();
      },
    );
  }

  static Future<UserModel?> readUser() async {
    var collection = getUsersCollection();
    DocumentSnapshot<UserModel> docRef =
    await collection.doc(FirebaseAuth.instance.currentUser!.uid).get();
    return docRef.data();
  }
  static Future<void> addUser(UserModel user) async {
    var collection = getUsersCollection();
    var docRef = collection.doc(user.uid);
    await docRef.set(user);
  }

  static void createAccount(
      String name,
      String email,
      String password,
      VoidCallback onLoading,
      VoidCallback onSuccess,
      Function(String) onError,
      ) async {
    try {
      onLoading();
      print("Started account creation...");

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Firebase Auth success");

      final user = userCredential.user;
      if (user == null) {
        onError("User is null");
        return;
      }

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .set({
        'name': name,
        'email': email,
        'uid': user.uid,
      });

      print("Firestore save success");
      onSuccess();
    } catch (e) {
      print("Error during createAccount: $e");
      onError(e.toString());
    }
  }

  static Future<void> login(
      String email,
      String password,
      Function onLoading,
      Function onSuccess,
      Function onError,
      ) async {
    try {
      onLoading();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError("Wrong Email or Password");
    }
  }

  static Future<void> updateUser(String name) async {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await FirebaseFirestore.instance.collection("Users")
        .doc(user.uid)
        .update({
      "name": name,
    });
  }
}
