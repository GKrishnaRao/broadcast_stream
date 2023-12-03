import 'dart:async';

import 'package:flutter/material.dart';


class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  int counter = 0;


  //StreamControler having two parts Sink(Input) and Stream(Output) -- Subscriber(StreamBuilder) will use the updated data
  //Control the data for this streamcontroller created with data type to accept only integer
  StreamController<int> counterController = StreamController();
  // Chat App, Collaboration app (Document sharing), Realtime wheather info update


  //Broadcast
  late Stream myStream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();  //Created a broadcast stream
    myStream = counterController.stream.asBroadcastStream();  //multiple subscriber can use a stream
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              StreamBuilder(  //Subscriber the stream
                stream: myStream, //counterController.stream,  // assing the stream controller
                builder: (context, snapshot) { //snapshot is data
                  if(snapshot.hasData) {  //snapshot data is present or not
                    return Text(snapshot.data.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w500,
                          fontSize: 55,
                        ));
                  }else{
                    return const Text('0',
                        style: TextStyle(fontWeight: FontWeight.w500,
                          fontSize: 55,
                        ));
                  }
                },
              ),


              StreamBuilder(  //Subscriber the stream
                stream: myStream,   //counterController.stream,  // assing the stream controller
                builder: (context, snapshot) { //snapshot is data
                  if(snapshot.hasData) {  //snapshot data is present or not
                    return Text(snapshot.data.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w500,
                          fontSize: 55,
                        ));
                  }else{
                    return const Text('0',
                        style: TextStyle(fontWeight: FontWeight.w500,
                          fontSize: 55,
                        ));
                  }
                },
              ),


            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          counter++;
          //Need to add into sink(Upload) for updated data
          counterController.sink.add(counter);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
