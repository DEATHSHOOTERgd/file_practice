import '/model/Recipe.dart';
import "package:xml/xml.dart" as xml;
import 'package:flutter/material.dart';

class RecipeReader{
  Future<List<Recipe>> getRecetaFromXml(BuildContext context)async{
    final xmlString = await DefaultAssetBundle.of(context).loadString("assets/XML/receta.xml");
    List<Recipe> recetas = [];
    var raw = xml.parse(xmlString);
    var elements = raw.findAllElements("receta");
    for(var item in elements){
      recetas.add(Recipe(
        item.findElements("tipo").first.text,
        item.findElements("dificultad").first.text,
        item.findElements("nombre").first.text,
        item.findElements("ingredientes").first.text,
        item.findElements("calorias").first.text,
        item.findElements("pasos").first.text,
        item.findElements("tiempo").first.text,
        item.findElements("elaboracion").first.text,
        item.findElements("imagen").first.text
      ));
    } 
    return recetas;
    
  }
}