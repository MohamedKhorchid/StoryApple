import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB_0soWSRYYGFgCX82Luv_HGewCSPS2epI",
            authDomain: "story-c0697.firebaseapp.com",
            projectId: "story-c0697",
            storageBucket: "story-c0697.firebasestorage.app",
            messagingSenderId: "661879223662",
            appId: "1:661879223662:web:5795acdd0d7ebe78d37d7f",
            measurementId: "G-3TLYZ9B24Q"));
  } else {
    await Firebase.initializeApp();
  }
}
