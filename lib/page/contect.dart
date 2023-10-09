import 'package:flutter/material.dart';
import 'package:portfolio/controller/controller.dart';
import 'package:portfolio/widget/button.dart';

import 'package:portfolio/widget/title.dart';

class Contect extends StatefulWidget {
  const Contect({super.key});
  @override
  State<Contect> createState() => _ContectState();
}

class _ContectState extends State<Contect> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  ValueNotifier<bool> valueNotifier = ValueNotifier(false);

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void clear() {
    nameController.clear();
    emailController.clear();
    messageController.clear();
  }

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
            const TitleWidget(
              title: 'Contact Me',
            ),
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
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 18),
                        child: Form(
                            key: formkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    'Message Me',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: TextFormField(
                                    controller: nameController,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return "Can't be empty";
                                      }

                                      return null;
                                    },
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    decoration: const InputDecoration(
                                        hintText: 'Enter Name',
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: TextFormField(
                                    controller: emailController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Can't be empty";
                                      }
                                      final bool emailValid = RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value);

                                      if (!emailValid) {
                                        return "Invaild email address.";
                                      }
                                      return null;
                                    },
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    decoration: const InputDecoration(
                                        hintText: 'Email',
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Can't be empty";
                                      }
                                      return null;
                                    },
                                    controller: messageController,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    maxLines: 4,
                                    decoration: const InputDecoration(
                                        hintText: 'Message',
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: ValueListenableBuilder(
                                      valueListenable: valueNotifier,
                                      builder:
                                          (context, bool isLoading, child) {
                                        return OwnButton(
                                          isLoading: isLoading,
                                          onPressed: () {
                                            final Map<String, dynamic> body = {
                                              "name": nameController.text,
                                              "email": emailController.text,
                                              "message": messageController.text
                                            };
                                            if (formkey.currentState!
                                                    .validate() &&
                                                !isLoading) {
                                              valueNotifier.value = true;
                                              ControllerApi.sentMessage(
                                                      body, context)
                                                  .then(
                                                (v) {
                                                  if (v) {
                                                    clear();
                                                  }
                                                  valueNotifier.value = false;
                                                },
                                              );
                                            }
                                          },
                                          title: 'Send',
                                        );
                                      }),
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width <= 1000 ? width : width * 0.33,
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Touch Me',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Text(
                              'Contact me for business related queries. I will try to respond as soon as possible.',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const IconsWithText(
                                iconData: Icons.phone,
                                title: '+977-9867255019'),
                            const Divider(),
                            const IconsWithText(
                                iconData: Icons.email,
                                title: 'susaneupane@gmail.com'),
                            const Divider(),
                            const IconsWithText(
                              iconData: Icons.location_on,
                              title: 'Tilottama-9,Lumbini,Rupandehi',
                            ),
                            const Row(
                              children: [],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

class IconsWithText extends StatelessWidget {
  final IconData iconData;
  final String title;
  const IconsWithText({super.key, required this.iconData, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.redAccent,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
