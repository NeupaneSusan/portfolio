// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portfolio/widget/button.dart';

// ignore: must_be_immutable
class NavBar extends StatefulWidget {
  final List<Widget> menuList;
  final AnimationController animationController;
  final ValueNotifier<bool> valueNotifier;

  const NavBar({
    Key? key,
    required this.menuList,
    required this.animationController,
    required this.valueNotifier,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  OverlayState? overlayState;

  OverlayEntry? overlayEntry;

  @override
  void initState() {
    super.initState();
    overlayState = Overlay.of(context);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    print(overlayEntry);

    if (widget.valueNotifier.value && width > 944) {
      if (overlayEntry != null) {
        overlayEntry = null;
        overlayEntry!.remove();
      }
    }
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
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
                children: widget.menuList.map((e) => e).toList(),
              ),
            ),
            OwnButton(
              title: 'Hire Me',
              onPressed: () {},
            )
          ] else ...[
            GestureDetector(
              onTap: () {
                if (widget.valueNotifier.value) {
                  widget.animationController.reverse();
                  widget.valueNotifier.value = false;

                  overlayEntry?.remove();
                  overlayEntry = null;
                  return;
                }
                widget.animationController.forward();
                widget.valueNotifier.value = true;
                overlayEntry = showMenus(widget.menuList);
                WidgetsBinding.instance.addPostFrameCallback(
                    (_) => overlayState?.insert(overlayEntry!));

                // showAboutDialog(
                //     context: context,
                //     children: [...menuList.map((e) => e).toList()]);
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: widget.animationController,
                size: 45,
                color: Colors.redAccent,
              ),
            ),
          ]
        ],
      ),
    );
  }
}

OverlayEntry showMenus(menuList) {
  return OverlayEntry(
    builder: (context) => Padding(
      padding: const EdgeInsets.only(top: 69),
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
                      child: e,
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
    ),
  );
}
