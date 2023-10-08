import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widget/menu.dart';

class NavBar extends StatelessWidget {
  final GlobalKey homeKey;
  final GlobalKey aboutusKey;
  final GlobalKey portfolioKey;
  final GlobalKey contectKey;
  const NavBar(
      {super.key,
      required this.homeKey,
      required this.aboutusKey,
      required this.portfolioKey,
      required this.contectKey});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w800, fontSize: 40),
              children: [
                TextSpan(
                  text: 'Susan',
                  style: GoogleFonts.openSans(
                    color: Colors.redAccent,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
                TextSpan(
                  text: 'Neupane',
                  style: GoogleFonts.openSans(color: Colors.black),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
          Row(
            children: [
              HoveMenu(
                title: 'Home',
                keys: homeKey,
              ),
              HoveMenu(
                title: 'About',
                keys: aboutusKey,
              ),
              HoveMenu(
                title: 'Portfolio',
                keys: portfolioKey,
              ),
              HoveMenu(
                title: 'Contact',
                keys: contectKey,
              )
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Hire Me',
            ),
          )
        ],
      ),
    );
  }
}
