import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newtask/screens/t20.dart';
import 'package:newtask/screens/test.dart';

import 'odi.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController ;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this,initialIndex: 1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('abc'),
        elevation: 0.7,
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: "ODI",),
            Tab(text: "Test",),
            Tab(text: "T20",)
          ],

        ),
      ),
       body:
      // Column(
      //   children: [
      //     Text('Batsmen'),
      //     Text('Bowler'),
      //     Text('AllRounder'),
      //     Text('Team'),
      //     TabBarView(
      //       controller: tabController,
      //       children: const [
      //         Odi(),
      //         Test(),
      //         T20()
      //       ],
      //
      //     ),
      //   ],
      // )
      TabBarView(
        controller: tabController,
        children: const [
          Odi(),
          Test(),
          T20()
        ],

      ),
    );
  }
}
