import 'dart:developer';

import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int counter = 1;

  @override
  void initState() {
    //counter++;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
     List listLength =[
      {'name': "kishan"},
      {'name': "kishan1"},
      {'name': "kishan2"},
      {'name': "kishan3"},
      {'name': "kishan4"},
      {'name': "kishan5"},
      {'name': "kishan6"},
      {'name': "kishan7"},
      {'name': "kishan8"},
      {'name': "kishan9"},
      {'name': "kishan10"},
      {'name': "kishan11"},
      {'name': "kishan12"},
      {'name': "kishan13"},
      {'name': "kishan14"},
      {'name': "kishan15"},
      {'name': "kishan16"},
      {'name': "kishan17"},
      {'name': "kishan18"},
      {'name': "kishan19"},
      {'name': "kishan20"},
      {'name': "kishan21"},
      {'name': "kishan22"},
      {'name': "kishan23"},
      {'name': "kishan24"},
      {'name': "kishan25"},
      {'name': "kishan26"},
      {'name': "kishan27"},
      {'name': "kishan28"},
      {'name': "kishan29"},
      {'name': "kishan30"},
      {'name': "kishan31"},
      {'name': "kishan32"},
      {'name': "kishan33"},
      {'name': "kishan34"},
      {'name': "kishan35"},
      {'name': "kishan36"},
      {'name': "kishan37"},
      {'name': "kishan38"},
      {'name': "kishan39"},
      {'name': "kishan40"},
      {'name': "kishan41"},
    ];
    int i = 0;
    int index1 = 0;
    while (i<listLength.length) {
       log('message=> ${i%8 == 0} => $i=> ${i%8}');
       if(i!=0)
       {
         list.add(
           SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             physics: const NeverScrollableScrollPhysics(),
             child: SizedBox(
               height: 100,
               child: ListView.builder(
                 itemCount: i % 8 == 0 ? 8 : i % 8,
                 shrinkWrap: true,
                 scrollDirection: Axis.horizontal,
                 physics: const NeverScrollableScrollPhysics(),
                 itemBuilder: (context, index) {
                   return ClipRRect(
                     borderRadius: BorderRadius.circular(100),
                     child: Container(
                       height: 70,
                       width: 70,
                       color: Colors.red,
                       child: Center(child: Text(listLength[index1++]['name'])),
                     ),
                   );
                 },
               ),
             ),
           ),
         );
       }
       i += 8;
    }
    list.add(
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: listLength.length - (i-8),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  height: 70,
                  width: 70,
                  color: Colors.red,
                  child: Center(child: Text(listLength[index1++]['name'])),


                ),
              );
            },
          ),
        ),
      ),
    );

    Widget widget = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const AlwaysScrollableScrollPhysics(),
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: list,
        ),
      ),
    );

    return MaterialApp(
      home: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget,
          ],
        ),
      ),
    );
  }
}
