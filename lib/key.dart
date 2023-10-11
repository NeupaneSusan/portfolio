import 'package:flutter/widgets.dart';

final homeKey = GlobalKey();
final aboutusKey = GlobalKey();
final portfolioKey = GlobalKey();
final contectKey = GlobalKey();

List<MenuModel> menuList = [
  MenuModel(
    title: 'Home',
    key: homeKey,
  ),
  MenuModel(title: 'About me', key: aboutusKey),
  MenuModel(title: 'Portfolio', key: portfolioKey),
  MenuModel(title: 'Contect', key: contectKey)
];

class MenuModel {
  String title;
  GlobalKey<State<StatefulWidget>> key;
  MenuModel({
    required this.title,
    required this.key,
  });
}
