import 'package:flutter/material.dart';
import 'package:portfolio/widget/line.dart';

class HoveMenu extends StatefulWidget {
  final String title;
  const HoveMenu({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  State<HoveMenu> createState() => _HoveMenuState();
}

class _HoveMenuState extends State<HoveMenu> {
  ValueNotifier<bool> isHoveredValueNotifier = ValueNotifier(false);

  @override
  void dispose() {
    super.dispose();
    isHoveredValueNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(widget.title),
            ),
            ValueListenableBuilder(
              valueListenable: isHoveredValueNotifier,
              builder: (context, isHovered, child) {
                return AnimatedPositioned(
                  width: isHovered ? 45 : 0,
                  bottom: 0,
                  duration: const Duration(milliseconds: 500),
                  child: const Line(),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void onEntered(bool isHovered) {
    isHoveredValueNotifier.value = isHovered;
  }
}
