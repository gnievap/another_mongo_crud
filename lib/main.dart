import 'package:flutter/material.dart';
import 'package:mongocrud/mongo_service.dart';
import 'package:mongocrud/pet_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoService().connect();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PetScreen(),
    );
  }
}
