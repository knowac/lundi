import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final CollectionReference<Map<String, dynamic>> kUsersCollection =
    FirebaseFirestore.instance.collection('users');
final FirebaseAuth kFbAuth = FirebaseAuth.instance;
