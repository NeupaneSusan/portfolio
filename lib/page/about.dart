import 'package:flutter/material.dart';
import 'package:portfolio/widget/card.dart';
import 'package:portfolio/widget/title.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      color: Colors.white,
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const TitleWidget(title: 'Abouts Me'),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              width: width,
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width < 1000 ? width : width * 0.55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Developing With a Passion While Exploring The World',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "I'm an enthusiastic student and passionate mobile application developer, driven by an unyielding dedication to continuous learning. My journey is built on hard work and sacrifice, serving as the pillars for my pursuit of success in the tech world. My ultimate aspiration is to make meaningful contributions to the tech community and shape a brighter future through innovative projects",
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width < 1000 ? width : width * 0.33,
                    height: 450,
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 350,
                            height: 450,
                            decoration: BoxDecoration(
                                boxShadow: kElevationToShadow[2],
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          const Align(
                            alignment: Alignment(-0.21, 0),
                            child: SizedBox(
                                width: 350,
                                height: 418,
                                child: CardPage(
                                  path: 'assets/1.jpeg',
                                  isCover: true,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
