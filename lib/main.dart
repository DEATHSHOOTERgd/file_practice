import 'package:file_practice/file/food_reader.dart';
import 'package:file_practice/file/recipe_reader.dart';
import 'package:file_practice/file/plants_reader.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Taller XML'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  FoodReader foodReader=FoodReader();
  RecipeReader recipeReader=RecipeReader();
  PlantsReader plantsReader=PlantsReader();

  String section='food';

  Widget _selectSection(String  section){
    if(section=="plants"){
      return _plantsView();
    }
    else if(section=="recipes"){
      return _recipeView();
    }
    else{
      return _foodView();
    }
  }
  Widget _foodView(){
    return FutureBuilder(
        future:foodReader.getFood(context),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child:CircularProgressIndicator());
          }
          else{
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index){
                return Container(
                              margin: const EdgeInsets.only(left: 20.0, right:20.0, top: 20.0),
                              decoration: const BoxDecoration(color: const Color(0xffe1c699)), 
                              padding:const EdgeInsets.only(left: 20.0, right:20.0, top: 50.0, bottom: 20.0),
                              child:Column(children:[
                                        Image.network(snapshot.data[index].imagen, width:300, height: 300, fit: BoxFit.cover),
                                        Text(snapshot.data[index].Name, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 26)),
                                        Text(snapshot.data[index].Price , style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                                        Text(snapshot.data[index].Description , style: const TextStyle(fontStyle: FontStyle.italic,)),
                                        Text(snapshot.data[index].Calories+' cal' , style: const TextStyle(fontWeight: FontWeight.bold,)),
                                        ]
                              )
                              );
              },
            );
          }
        }
            );
  }
  
  Widget _recipeView(){
    return FutureBuilder(
        future:recipeReader.getRecetaFromXml(context),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child:CircularProgressIndicator());
          }
          else{
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index){
                return Container(
                              margin: const EdgeInsets.only(left: 20.0, right:20.0, top: 20.0),
                              decoration: const BoxDecoration(color: const Color(0xffe1c699)), 
                              padding:const EdgeInsets.only(left: 20.0, right:20.0, top: 50.0, bottom: 20.0),
                              child:Column(children:[
                                        Image.network(snapshot.data[index].imagen, width:300, height: 300, fit: BoxFit.cover),
                                        Text(snapshot.data[index].tipo, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 26)),
                                        Text(snapshot.data[index].dificultad , style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                                        Text(snapshot.data[index].nombre , style: const TextStyle(fontStyle: FontStyle.italic,)),
                                        //_ingredientes(snapshot.data[index].ingredients),
                                        Text(snapshot.data[index].calorias , style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                                        Text(snapshot.data[index].pasos , style: const TextStyle(fontStyle: FontStyle.italic,)),
                                        Text(snapshot.data[index].tiempo , style: const TextStyle(fontStyle: FontStyle.italic,)),
                                        Text(snapshot.data[index].elaboracion, style: const TextStyle(fontWeight: FontWeight.bold,)),
                                        ]
                              )
                              );
              },
            );
          }
        }
            );
  }
  Widget _plantsView(){
    return FutureBuilder(
        future:plantsReader.getPlantaFromXml(context),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child:CircularProgressIndicator());
          }
          else{
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index){
                return Container(
                              margin: const EdgeInsets.only(left: 20.0, right:20.0, top: 20.0),
                              decoration: const BoxDecoration(color: const Color(0xffe1c699)), 
                              padding:const EdgeInsets.only(left: 20.0, right:20.0, top: 50.0, bottom: 20.0),
                              child:Column(children:[
                                        Image.network(snapshot.data[index].imagen, width:300, height: 300, fit: BoxFit.cover),
                                        Text(snapshot.data[index].common, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 26)),
                                        Text(snapshot.data[index].botanical , style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                                        Text(snapshot.data[index].zone , style: const TextStyle(fontStyle: FontStyle.italic,)),
                                        Text(snapshot.data[index].light, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 26)),
                                        Text(snapshot.data[index].price , style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                                        Text(snapshot.data[index].availability , style: const TextStyle(fontStyle: FontStyle.italic,)),
                                        ]
                                        
                              )
                              );
              },
            );
          }
        }
            );
  }
  
  Widget buttonFood() {
    return SizedBox(
      width: 100,
      height: 40,
      child: ElevatedButton(
        onPressed: () {setState(() {
          section='food';
        });},
        child: const Text("Food"),
      ),
    );
  }
  Widget buttonReceta() {
    return SizedBox(
      width: 100,
      height: 40,
      child: ElevatedButton(
        onPressed: () {setState(() {
          section='recipes';
        });},
        style: TextButton.styleFrom(backgroundColor: Colors.amber),
        child: const Text("Receta"),
      ),
    );
  }
  Widget buttonPlanta() {
    return SizedBox(
      width: 100,
      height: 40,
      child: ElevatedButton(
        onPressed: () {setState(() {
          section='plants';
        });},
        style: TextButton.styleFrom(backgroundColor: Colors.lightGreen),
        child: const Text("Planta"),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:  Column(children:[Center(child:Padding(padding:const EdgeInsets.only(top: 20.0, bottom: 20.0), child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                buttonFood(),
                const SizedBox(
                  width: 10,
                ),
                buttonPlanta(),
                const SizedBox(
                  width: 10,
                ),
                buttonReceta()
              ],
            )))
            , Container(height: 700.0,child:_selectSection(section))],)
      
      
    );
  }
}
