import 'package:flutter/material.dart';
import 'package:portfolio/page/contect.dart';
import 'package:portfolio/page/home.dart';
import 'package:portfolio/page/portfolio.dart';
import 'package:portfolio/widget/footer.dart';

import '../widget/nav_bar.dart';
import 'about.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController scrollController = ScrollController();
  final homeKey = GlobalKey();
  final aboutusKey = GlobalKey();
  final portfolioKey = GlobalKey();
  final contectKey = GlobalKey();

  @override
  void initState() {
    scrollController.addListener(() {});
    super.initState();
  }

  void addScroller() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          NavBar(
            homeKey: homeKey,
            aboutusKey: aboutusKey,
            portfolioKey: portfolioKey,
            contectKey: contectKey,
          ),
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
