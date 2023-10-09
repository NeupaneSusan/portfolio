// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  final String path;
  final bool isCover;
  const CardPage({Key? key, required this.path, this.isCover = false})
      : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final ValueNotifier<bool> isHover = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (h) {
        isHover.value = true;
      },
      onExit: (h) {
        isHover.value = false;
      },
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: ValueListenableBuilder(
            valueListenable: isHover,
            builder: (context, value, child) {
              return AnimatedScale(
                duration: const Duration(milliseconds: 800),
                scale: value ? 1.09 : 1,
                child: Image.asset(
                  widget.path,
                  fit: widget.isCover ? BoxFit.cover : BoxFit.fitHeight,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
