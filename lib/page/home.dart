import 'package:flutter/material.dart';
import 'package:portfolio/controller/controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: 50),
        child: Wrap(
          runSpacing: 10,
          spacing: 10,
          alignment: WrapAlignment.spaceBetween,
          runAlignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              color: Colors.cyanAccent,
              width: width < 1000 ? width : width * 0.55,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 500,
                  child: Image.asset('assets/2.png'),
                ),
              ),
            ),
            SizedBox(
              width: width <= 1000 ? width : width * 0.33,
              child: Column(
                children: [
                  Text(
                    "I'm Susan Neupane",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'This my offical portfolio website to shows all details \nand  work experience mobile and web development.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ControllerApi.downloadCv(context);
                    },
                    child: const Text(
                      'Download CV',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
