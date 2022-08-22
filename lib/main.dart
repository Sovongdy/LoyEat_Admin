import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loyeat_admin/src/srceen/startup_srceen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
  );
  MaterialApp app = const MaterialApp(
    home: StartUpSrceen(),
    debugShowCheckedModeBanner: false,
  );
  runApp(app);
}
