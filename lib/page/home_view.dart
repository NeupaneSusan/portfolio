import 'package:flutter/material.dart';
import 'package:portfolio/page/contect.dart';
import 'package:portfolio/page/home.dart';
import 'package:portfolio/page/portfolio.dart';
import 'package:portfolio/widget/button.dart';
import 'package:portfolio/widget/footer.dart';

import '../widget/menu.dart';
import '../widget/nav_bar.dart';
import 'about.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  final ScrollController _controller = ScrollController();
  late AnimationController _animationController;
  final ValueNotifier<bool> _isOpenValueNotifier = ValueNotifier(false);
  late OverlayEntry _overlayEntry;
  final homeKey = GlobalKey();
  final aboutusKey = GlobalKey();
  final portfolioKey = GlobalKey();
  final contectKey = GlobalKey();

  final List<Widget> menuList = [];
  @override
  void initState() {
    menuList.addAll([
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
    ]);
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _isOpenValueNotifier.dispose();
    _overlayEntry.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width > 994 && _isOpenValueNotifier.value) {
      _animationController.reverse();
    }

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          NavBar(
            menuList: menuList,
            animationController: _animationController,
            valueNotifier: _isOpenValueNotifier,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _controller,
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
