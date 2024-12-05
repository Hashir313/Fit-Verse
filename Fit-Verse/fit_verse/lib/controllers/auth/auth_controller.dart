// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //! Sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      throw Exception('Failed to sign in with email and password');
    }
  }

  //! Sign up with email and password
  Future<UserCredential> signUpWithEmailAndPassword(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      throw Exception('Failed to sign up with email and password');
    }
  }

  //! Sign out
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      throw Exception('Failed to sign out');
    }
  }

  //! Upload user name email and user id to firestore
  Future<void> uploadUserDetails(
    BuildContext context,
    String name,
    String email,
    String uid,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': name,
        'email': email,
        'uid': uid,
      });
      print('User details uploaded successfully');
    } catch (e) {
      print('Error uploading user details: $e'); // Improved error logging
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload user details: $e')),
      );
      throw Exception('Failed to upload user details');
    }
  }
}
