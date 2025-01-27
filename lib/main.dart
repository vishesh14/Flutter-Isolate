import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_isolate_apps/project_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//https://github.com/vishesh14/Flutter-Isolate.git
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Image.asset('assets/gifs/giphy.gif'),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                var total = complexTask1();
                debugPrint('total = $total');
              }, child: Text("Button1")),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () async{
                final recievePort = ReceivePort();
               await Isolate.spawn(complexTask2, recievePort.sendPort);
               recievePort.listen((total){
                debugPrint('complexTask2 : $total');
               });
               
              }, child: Text("Button1")),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){}, child: Text("Button1"))
            ],
          ),
        ),
      ),
    );
  }

  double complexTask1(){
   
   var total =0.0;
   for (var i = 0; i<1000000000; i++) {
     total += i;
   }   
   return total;

  }
}

 complexTask2(SendPort sendPort){
   
   var total =0.0;
   for (var i = 0; i<1000000000; i++) {
     total += i;
   }   
   sendPort.send(total);
  }

