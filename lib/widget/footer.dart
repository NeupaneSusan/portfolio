import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      color: const Color(0xff11204d),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Copyright',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.apply(color: Colors.white),
          ),
          const Icon(
            Icons.copyright_sharp,
            color: Colors.white,
          ),
          Text(
            '2023 Personal Portfolio',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.apply(color: Colors.white),
          )
        ],
      ),
    );
  }
}
