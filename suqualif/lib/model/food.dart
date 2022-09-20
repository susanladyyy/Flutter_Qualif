import 'package:suqualif/model/user.dart';

class Food {
  String name;
  String desc;
  String image;
  List<User> user;
  int price;

  Food({required this.name, required this.desc, required this.image, required this.user, required this.price});
}