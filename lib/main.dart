import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/page/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          cardTheme: const CardTheme(
            surfaceTintColor: Colors.white,
            shadowColor: Colors.white,
            elevation: 10,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              animationDuration: const Duration(milliseconds: 500),
              minimumSize: MaterialStateProperty.all(const Size(120, 48)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              backgroundColor: MaterialStateColor.resolveWith(
                (states) {
                  if (states.contains(MaterialState.hovered) &&
                      states.contains(MaterialState.pressed)) {
                    return Colors.white;
                  }

                  return Colors.redAccent;
                },
              ),
              foregroundColor: MaterialStateColor.resolveWith(
                (states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.redAccent;
                  }
                  return Colors.white;
                },
              ),
              side: MaterialStateBorderSide.resolveWith(
                (states) => const BorderSide(
                    color: Colors.redAccent,
                    width: 1.0,
                    style: BorderStyle.solid),
              ),
              textStyle: MaterialStateProperty.resolveWith(
                (states) => const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              overlayColor: MaterialStateProperty.all<Color>(Colors.white),
              shadowColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.w800,
              color: Color(0xff11204d),
            ),
            headlineMedium: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
              color: Color(0xff11204d),
            ),
            bodySmall: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xff11204d)),
            bodyMedium: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: Color(0xff11204d),
            ),
          ),
          fontFamily: GoogleFonts.roboto().fontFamily,
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            surface: Colors.white,
            background: const Color(0xfffefafa),
          )),
      home: const HomeView(),
    );
  }
}
