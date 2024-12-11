import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:scoreboard/provider/scoreproviderdigital.dart';

class Resume extends StatefulWidget {
  const Resume({super.key});

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  @override
  Widget build(BuildContext context) {
    final scoreProvider = Provider.of<ScoreProviderValue>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scoreboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 110,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black
                    )
                  ),
                  child: Column(
                    children: [
                      // Player 1 Score Display
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(scoreProvider.a.toString(), style: TextStyle(fontSize: 20)),
                              SizedBox(width: 20,),
                              Text(scoreProvider.b.toString(), style: TextStyle(fontSize: 20)),
                              SizedBox(width: 20,),
                              Text(scoreProvider.c.toString(), style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: Text(scoreProvider.player1Increment.toString(), style: TextStyle(fontSize: 15))),
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.black),
                      // Player 2 Score Display
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text( scoreProvider.d.toString(), style: TextStyle(fontSize: 20)),
                              SizedBox(width: 20,),
                              Text( scoreProvider.e.toString(), style: TextStyle(fontSize: 20)),
                              SizedBox(width: 20,),
                              Text( scoreProvider.f.toString(), style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.pink[100],
        
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: Text( scoreProvider.status ? scoreProvider.player2Increment.toString() : "AD", style: TextStyle(fontSize: 15))),
                            ),
                          ),
                        ],
                      ),
                     // SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
        
            Row(
              children: [
                Icon(Icons.arrow_right,color: Colors.purple[200],size: 50,),
                Spacer(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                   children: [
                     Text("Total"),
                     Text('0.00')
                   ],
                  ),
                )
              ],
            ),
            Container(
              height: 40,
              width: 361,
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text("Switch Slides")),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text('Serving:'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 40,width: 130,decoration: BoxDecoration(color:Colors.blue[200],borderRadius: BorderRadius.circular(10)),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 40,width: 130,decoration: BoxDecoration(color:Colors.pink[200],borderRadius: BorderRadius.circular(10)),),
                ),
        
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text('Game')),
                  ),
                ),
                Spacer(),
        
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 130,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black
                        ),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text('Game')),
                  ),
        
                ),
              ],
            ),

            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 50,
        
                    child: Center(child: Text(scoreProvider.player1Increment.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                  ),
                ),
                SizedBox(
                  width: 180,
                ),
        
        
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 50,

                    child: Center(child: Text(scoreProvider.player2Increment.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      scoreProvider.player1increment(context);
                    },
                    child: Container(
                      height: 100,
                      width: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(child: Text('Add point')),
                    ),
                  ),
                ),
                Spacer(),
        
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      scoreProvider.player2increment(context);
                    },
                    child: Container(
                      height: 100,
                      width: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(child: Text('Add Point')),
                    ),
                  ),
        
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
