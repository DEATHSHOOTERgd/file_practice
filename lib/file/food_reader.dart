import '/model/Food.dart';
import "package:xml/xml.dart" as xml;
import 'package:flutter/material.dart';


class FoodReader{
  Future<List<Food>> getFood(BuildContext context) async {
    final xmlString = await DefaultAssetBundle.of(context)
        .loadString("assets/XML/comida.xml");
    List<Food> food = [];
    var raw = xml.parse(xmlString);
    var elements = raw.findAllElements("food");

    for (var item in elements) {
      food.add(Food(
          item.findElements("name").first.text.toString(),
          item.findElements("price").first.text,
          item.findElements("description").first.text,
          item.findElements("calories").first.text,
          item.findElements("imagen").first.text));
    }

    return food;
  }
}