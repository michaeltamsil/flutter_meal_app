import 'package:flutter/material.dart';
import 'package:flutter_meal_app/screens/categories.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color.fromARGB(255, 131, 57, 0)),
    textTheme: GoogleFonts.latoTextTheme(),
    useMaterial3: true);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme, home: const CategoriesScreen(),
      // home: const MealsScreen(
      //   meals: dummyMeals,
      //   title: 'Some Category...',
      // ),
    );
  }
}
