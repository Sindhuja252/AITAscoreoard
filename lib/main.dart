

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/newmatch.dart';
import 'package:scoreboard/provider/scoreproviderdigital.dart';
import 'package:scoreboard/resume.dart';

void main() => runApp(
  ChangeNotifierProvider(create: (context)=> ScoreProviderValue(),
      child: MyApp(),
  ));


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          leading: const Icon(Icons.menu),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  alignment: Alignment.topRight,
                  child: const Text("Sign as:"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AlignedGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class AlignedGrid extends StatelessWidget {
  final double runSpacing = 20;
  final double spacing = 25;
  final int listSize = 5;
  final int columns = 2;
  final List<String> name = ['New Match', 'History', 'Players', 'Enter Score', 'Resume'];
  final List<Icon> icon = [Icon(Icons.add), Icon(Icons.watch_later_outlined), Icon(Icons.multiline_chart), Icon(Icons.person), Icon(Icons.access_time_filled_outlined)];

  final List<Color> colors = [
    Colors.blue[100] ?? Colors.red,
    Colors.green[100] ?? Colors.blue,
    Colors.purple[100] ?? Colors.green,
    Colors.red[100] ?? Colors.orange,
    Colors.yellow[100] ?? Colors.purple
  ];
  _page(int index,BuildContext context){
    switch(index){
      case 0:
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewMatch()));
          break;
        }
      case 4:{
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Resume()));
        break;

      }


    }

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        runSpacing: runSpacing,
        spacing: spacing,
        alignment: WrapAlignment.spaceAround,
        children: List.generate(listSize, (index) {
          return InkWell(
            onTap: (){
              _page(index,context);

            },
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colors[index],
              ),
              //alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: icon[index],
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      name[index],
                      style: const TextStyle(color: Colors.black, fontSize: 18,),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
