import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'Screens/Post_api/provider/Post_Provider.dart';
import 'Screens/Post_api/view/Post_View.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => HomeProvider(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => HomeScreen(),
            },
          ),
          ),
      );
}