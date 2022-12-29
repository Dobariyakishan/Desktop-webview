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

    // for (int i = 0; i < 43 || i==42; i++) {
    //   log('message=> ${i%8 == 0} => $i=> ${i%8}');
    //   if (i!= 0 && i % 8 == 0) {
    //       list.add(
    //         SingleChildScrollView(
    //           scrollDirection: Axis.horizontal,
    //           physics: const NeverScrollableScrollPhysics(),
    //           child: SizedBox(
    //             height: 100,
    //             child: ListView.builder(
    //               itemCount: 8 ,
    //               shrinkWrap: true,
    //               scrollDirection: Axis.horizontal,
    //               physics: const NeverScrollableScrollPhysics(),
    //               itemBuilder: (context, index) {
    //                 return ClipRRect(
    //                   borderRadius: BorderRadius.circular(100),
    //                   child: Container(
    //                     height: 70,
    //                     width: 70,
    //                     color: Colors.red,
    //                   ),
    //                 );
    //               },
    //             ),
    //           ),
    //         ),
    //       );
    //     }else if (i == 42) {
    //     list.add(
    //       SingleChildScrollView(
    //         scrollDirection: Axis.horizontal,
    //         physics: const NeverScrollableScrollPhysics(),
    //         child: SizedBox(
    //           height: 100,
    //           child: ListView.builder(
    //             itemCount: i%8,
    //             shrinkWrap: true,
    //             scrollDirection: Axis.horizontal,
    //             physics: const NeverScrollableScrollPhysics(),
    //             itemBuilder: (context, index) {
    //               return ClipRRect(
    //                 borderRadius: BorderRadius.circular(100),
    //                 child: Container(
    //                   height: 70,
    //                   width: 70,
    //                   color: Colors.red,
    //                 ),
    //               );
    //             },
    //           ),
    //         ),
    //       ),
    //     );
    //   }
    // }
     int listLength =15;
    int i = 0;
    int k = 0;
    while (i<listLength) {
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
            itemCount: listLength - (i-8),
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
