import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/key.dart';

import 'package:portfolio/widget/button.dart';
import 'package:portfolio/widget/menu.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final ValueNotifier<bool> _isOpenValueNotifier = ValueNotifier(false);
  late OverlayState _overlayState;
  late OverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _overlayState = Overlay.of(context);
    _overlayEntry = showMenus();
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
    if (_isOpenValueNotifier.value && width > 944) {
      _isOpenValueNotifier.value = false;
      _animationController.reverse();
      _overlayEntry.remove();
      _overlayEntry = showMenus();
    }
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          if (width > 994) ...[
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: menuList.map((e) {
                  return GestureDetector(
                      onTap: () {
                        Scrollable.ensureVisible(
                            e.key.currentContext as BuildContext,
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.fastOutSlowIn,
                            alignmentPolicy:
                                ScrollPositionAlignmentPolicy.explicit);
                      },
                      child: HoveMenu(title: e.title));
                }).toList(),
              ),
            ),
            OwnButton(
              title: 'Hire Me',
              onPressed: () {},
            )
          ] else ...[
            GestureDetector(
              onTap: () {
                if (_isOpenValueNotifier.value) {
                  _animationController
                      .reverse()
                      .whenComplete(() => {_overlayEntry.remove()});
                  _isOpenValueNotifier.value = false;

                  return;
                }

                _animationController.forward();
                _isOpenValueNotifier.value = true;
                _overlayState.insert(_overlayEntry);
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: _animationController,
                size: 45,
                color: Colors.redAccent,
              ),
            ),
          ]
        ],
      ),
    );
  }

  OverlayEntry showMenus() {
    return OverlayEntry(builder: (_) {
      return Positioned(
        top: 85,
        width: MediaQuery.sizeOf(_).width,
        height: MediaQuery.sizeOf(_).height,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, snapshot) {
            return Opacity(
              opacity: _animation.value,
              child: Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...menuList
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: GestureDetector(
                                  onTap: () {
                                    _isOpenValueNotifier.value = false;
                                    _animationController.reverse();

                                    _overlayEntry.remove();
                                    _overlayEntry = showMenus();
                                    Scrollable.ensureVisible(
                                        e.key.currentContext as BuildContext,
                                        duration:
                                            const Duration(milliseconds: 800),
                                        curve: Curves.fastOutSlowIn,
                                        alignmentPolicy:
                                            ScrollPositionAlignmentPolicy
                                                .explicit);
                                  },
                                  child: HoveMenu(title: e.title)),
                            ),
                          )
                          .toList(),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 10),
                        child: OwnButton(title: 'Hire Me', onPressed: () {}),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
