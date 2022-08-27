import '/model/Plant.dart';
import "package:xml/xml.dart" as xml;
import 'package:flutter/material.dart';

class PlantsReader{
Future<List<Plant>> getPlantaFromXml(BuildContext context)async{
    final xmlString = await DefaultAssetBundle.of(context).loadString("assets/XML/planta.xml");
    List<Plant> plantas = [];
    var raw = xml.parse(xmlString);
    var elements = raw.findAllElements("PLANT");
    for(var item in elements){
      plantas.add(Plant(
        item.findElements("COMMON").first.text,
        item.findElements("BOTANICAL").first.text,
        item.findElements("ZONE").first.text,
        item.findElements("LIGHT").first.text,
        item.findElements("PRICE").first.text,
        item.findElements("AVAILABILITY").first.text,
        item.findElements("imagen").first.text
      ));
    } 
    return plantas;

  }
}