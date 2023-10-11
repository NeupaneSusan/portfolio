import 'package:flutter/material.dart';
import 'package:portfolio/key.dart';
import 'package:portfolio/page/contect.dart';
import 'package:portfolio/page/home.dart';
import 'package:portfolio/page/portfolio.dart';

import 'package:portfolio/widget/footer.dart';

import '../widget/nav_bar.dart';
import 'about.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const NavBar(),
          Expanded(
            child: SingleChildScrollView(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                children: [
                  Home(
                    key: homeKey,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AboutUs(
                    key: aboutusKey,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Portfolio(
                    key: portfolioKey,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Contect(
                    key: contectKey,
                  ),
                ],
              ),
            ),
          ),
          const Footer()
        ],
      ),
    );
  }
}
