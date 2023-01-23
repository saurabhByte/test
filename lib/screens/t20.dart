import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/main_model.dart';
import '../provider/heading_provider.dart';

class T20 extends StatefulWidget {
  const T20({Key? key}) : super(key: key);

  @override
  State<T20> createState() => _T20State();
}

class _T20State extends State<T20> {
  HeadingProvider headingProvider = HeadingProvider();
  List<Team> t20TeamList = [];
  List<OdiAllRounder> t20BatsmanList = [];
  List<OdiAllRounder> t20BowlersList = [];
  List<OdiAllRounder> t20AllRoundersList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // headingProvider =  Provider.of<HeadingProvider>(context,listen: false);
    // headingProvider.fetchData();
  }
  int i = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        i = 0;
                      });
                    },
                    child: Container(
                      color: i == 0 ?Colors.deepPurple : Colors.transparent,
                      width: MediaQuery.of(context).size.width*0.2,
                      height: 30,
                      child: i == 0
                          ? const Center(
                        child: Text(
                          'Batsman',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                          :  const Center(
                        child: Text(
                          'Batsman',
                          style: TextStyle(color: Colors.deepPurple),

                        ),
                      ) ,
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      setState(() {
                        i = 1;
                      });
                    },
                    child: Container(
                      color: i == 1 ?Colors.deepPurple : Colors.transparent,
                      width: MediaQuery.of(context).size.width*0.2,
                      height: 30,
                      child: i == 1
                          ? const Center(
                        child: Text(
                          'Bowlers',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                          :  const Center(
                        child: Text(
                          'Bowlers',
                          style: TextStyle(color: Colors.deepPurple),

                        ),
                      ) ,
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      setState(() {
                        i = 2;
                      });
                    },
                    child: Container(
                      color: i == 2 ?Colors.deepPurple : Colors.transparent,
                      width: MediaQuery.of(context).size.width*0.3,
                      height: 30,
                      child: i == 2
                          ? const Center(
                        child: Text(
                          'All-rounders',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                          :  const Center(
                        child: Text(
                          'All-rounders',
                          style: TextStyle(color: Colors.deepPurple),

                        ),
                      ) ,
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      setState(() {
                        i = 3;
                      });
                    },
                    child: Container(
                      color: i == 3 ?Colors.deepPurple : Colors.transparent,
                      width: MediaQuery.of(context).size.width*0.2,
                      height: 30,
                      child: i == 3
                          ? const Center(
                        child: Text(
                          'Teams',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                          :  const Center(
                        child: Text(
                          'Teams',
                          style: TextStyle(color: Colors.deepPurple),

                        ),
                      ) ,
                    ),
                  ),
                  // TextButton(
                  //     onPressed: (){
                  //       //Provider.of<HeadingProvider>(context,listen: false).fetchData();
                  //       //batsmen(context);
                  //       // const Batsmen();
                  //
                  //       // var state =   Provider.of<HeadingProvider>(context);
                  //       // state.fetchData();
                  //
                  //       setState(() {
                  //         i =0;
                  //       });
                  //
                  //
                  //     },
                  //     child: const Text('Batsmen')
                  // ),
                  // TextButton(
                  //     onPressed: (){
                  //       setState(() {
                  //         i =1;
                  //       });
                  //     }
                  //     ,
                  //     child: const Text('Bowlers')
                  // ),
                  // TextButton(
                  //     onPressed: (){
                  //       setState(() {
                  //         i =2;
                  //       });
                  //
                  //     },
                  //     child: const Text('All-rounders')
                  // ),
                  // TextButton(
                  //     onPressed: (){
                  //       setState(() {
                  //         i =3;
                  //       });
                  //
                  //     },
                  //     child: const Text('Teams')
                  // )
                ],
              ),
              const SizedBox(
                height: 30,
              ),


              if(i == 0)...[
                Row(
                  children: const [
                    Expanded(
                      flex:2,
                      child: Text(
                        'RANK',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'PLAYER',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),

                    Expanded(
                      flex:1,
                      child: Text(
                        'POINTS',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ],
                ),

                Consumer<HeadingProvider>(
                    builder: (context,provider,child){
                      if(provider.status == Status.loading){
                        // provider.fetchData();
                        return   const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (provider.status == Status.success){
                        t20BatsmanList = provider.result.t20Batsman;
                      }
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: t20BatsmanList.length,
                          itemBuilder: (context,index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex:2,
                                    child: Text(
                                      t20BatsmanList[index].position.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex:4,
                                    child: Text(
                                      t20BatsmanList[index].playerName,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  Expanded(flex:1,
                                    child: Text(
                                      t20BatsmanList[index].points.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                      );



                    }
                )

                // Consumer<HeadingProvider>(
                //   builder: (context,provider,child){
                //     if(provider.result.odiBatsmen.isEmpty){
                //       provider.fetchData();
                //       return const Text('data');
                //     }
                //     return ListView.builder(
                //         shrinkWrap: true,
                //         physics: const NeverScrollableScrollPhysics(),
                //         itemCount: provider.result.odiBatsmen.length,
                //         itemBuilder: (context,index) {
                //           return Text("provider.result.odiBatsmen[index].playerName");
                //         }
                //     );
                //   },
                // )


              ]else if(i == 1)...[
                Row(
                  children: const [
                    Expanded(
                      flex:2,
                      child: Text(
                        'RANK',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Expanded(
                      flex:3,
                      child: Text(
                        'PLAYER',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Expanded(
                      flex:1,
                      child: Text(
                        'POINTS',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ],
                ),

                Consumer<HeadingProvider>(
                    builder: (context,provider,child){
                      if(provider.status == Status.loading){
                        // provider.fetchData();
                        return   const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (provider.status == Status.success){
                        t20BowlersList = provider.result.t20Bowler;
                      }
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: t20BowlersList.length,
                          itemBuilder: (context,index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex:2,
                                    child: Text(
                                      t20BowlersList[index].position.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex:4,
                                    child: Text(
                                      t20BowlersList[index].playerName,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  Expanded(flex:1,
                                    child: Text(
                                      t20BowlersList[index].points.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                      );


                    }
                )
              ]else if(i == 2)...[
                Row(
                  children: const [
                    Expanded(
                      flex:2,
                      child: Text(
                        'RANK',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Expanded(
                      flex:3,
                      child: Text(
                        'PLAYER',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Expanded(
                      flex:1,
                      child: Text(
                        'POINTS',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ],
                ),

                Consumer<HeadingProvider>(
                    builder: (context,provider,child){
                      if(provider.status == Status.loading){
                        // provider.fetchData();
                        return   const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (provider.status == Status.success){
                        t20AllRoundersList = provider.result.t20AllRounder;
                      }
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                         physics: const NeverScrollableScrollPhysics(),
                          itemCount: t20AllRoundersList.length,
                          itemBuilder: (context,index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex:2,
                                    child: Text(
                                      t20AllRoundersList[index].position.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex:4,
                                    child: Text(
                                      t20AllRoundersList[index].playerName,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  Expanded(flex:1,
                                    child: Text(
                                      t20AllRoundersList[index].points.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                      );



                    }
                )
              ]else if(i == 3)...[
                Row(
                  children: const [
                    Expanded(
                      flex:2,
                      child: Text(
                        'RANK',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Expanded(
                      flex:4,
                      child: Text(
                        'TEAMS',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Expanded(
                      flex:2,
                      child: Text(
                        'RATING',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Expanded(
                      flex:2,
                      child: Text(
                        'POINTS',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ],
                ),
                Consumer<HeadingProvider>(
                    builder: (context,provider,child){
                      if(provider.status == Status.loading){
                        // provider.fetchData();
                        return   const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (provider.status == Status.success){
                        t20TeamList = provider.result.t20Teams;
                      }
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: t20TeamList.length,
                          itemBuilder: (context,index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex:2,
                                    child: Text(
                                      t20TeamList[index].position.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex:4,
                                    child: Text(
                                      t20TeamList[index].teamName,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex :2,
                                    child: Text(
                                      t20TeamList[index].rating.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  Expanded(flex:2,
                                    child: Text(
                                      t20TeamList[index].points.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                      );


                    }
                )
              ]

              /*  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text('Rank'),
                  Text('Player'),
                  Text('Points'),
                ],
              ),
              Consumer<HeadingProvider>(
                  builder: (context,provider,child){
                    provider.fetchData();
                    if(provider.result.odiTeams == null){
                     // provider.fetchData();
                   return   const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                   return   ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: provider.result.odiTeams.length,
                          itemBuilder: (context,index) {
                            return Text(provider.result.odiTeams[index]
                                .teamName);
                          }
                      );


                  }
              )*/

              // RefreshIndicator(
              //     child: Center(
              //       child: Consumer<HeadingProvider>(
              //         builder: (context,value,child){
              //           return value.result.
              //         },
              //       ),
              //     ),
              //     onRefresh: ()async{
              //
              //     }
              // )


            ],
          ),
        ),
      ),
    );

  }
}
