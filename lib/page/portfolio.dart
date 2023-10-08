import 'package:flutter/material.dart';
import 'package:portfolio/widget/title.dart';

import '../widget/card.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const TitleWidget(
            title: 'My Portfolio',
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Here are some projects managed by me and team.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(),
          ),
          const SizedBox(
            height: 50,
          ),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            crossAxisCount: 3,
            children: const [
              CardPage(path: 'assets/22.png'),
              CardPage(
                path: 'assets/33.png',
              ),
              CardPage(
                path: 'assets/11.png',
              ),
              CardPage(
                path: 'assets/44.png',
              ),
              CardPage(path: 'assets/55.png'),
              CardPage(path: 'assets/77.png')
            ],
          )
        ],
      ),
    );
  }
}
