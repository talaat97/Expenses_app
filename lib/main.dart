import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';

import 'widgets/expenses.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //   .then((_) =>
  runApp(const MyApp());
  //);
}

var myColorSchema =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 59, 96, 179));
var myDarkColorSchema =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
          dropdownMenuTheme: DropdownMenuThemeData(
              inputDecorationTheme: InputDecorationTheme(
            fillColor: myColorSchema.secondaryContainer,
            focusColor: myColorSchema.secondaryContainer,
          )),
          colorScheme: myColorSchema,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: myColorSchema.onPrimaryContainer,
            foregroundColor: myColorSchema.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: myColorSchema.secondaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: myColorSchema.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: myColorSchema.onSecondaryContainer,
                fontSize: 17,
              ))),
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: myDarkColorSchema,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: myDarkColorSchema.onPrimaryContainer,
            foregroundColor: myDarkColorSchema.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: myDarkColorSchema.secondaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: myDarkColorSchema.onPrimaryContainer,
              foregroundColor: myDarkColorSchema.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  color: myDarkColorSchema.onSecondaryContainer,
                  fontWeight: FontWeight.normal,
                  fontSize: 17,
                ),
              ),
          bottomSheetTheme: const BottomSheetThemeData().copyWith(
            backgroundColor: myColorSchema.onPrimaryContainer,
          )),
      home: const Expences(),
    );
  }
}
