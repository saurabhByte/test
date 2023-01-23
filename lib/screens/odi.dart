import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newtask/provider/heading_provider.dart';
import 'package:provider/provider.dart';

import '../model/main_model.dart';

class Odi extends StatefulWidget {
  const Odi({Key? key}) : super(key: key);

  @override
  State<Odi> createState() => _OdiState();
}

class _OdiState extends State<Odi> {
List<Result> resList = [];
HeadingProvider headingProvider = HeadingProvider();
List<Team> odiTeamList = [];
List<OdiAllRounder> odiBatsmanList = [];
List<OdiAllRounder> odiBowlersList = [];
List<OdiAllRounder> odiAllRoundersList = [];

var abc;
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
    context.read<HeadingProvider>().fetchData();
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
                ],
              ),
              const SizedBox(
                height: 30,
              ),


            if(i == 0)...[
              // Text("1")
              Column(
                children: [
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
                          odiBatsmanList = provider.result.odiBatsman;
                          print(odiBatsmanList.length);
                        }
                        return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: odiBatsmanList.length,
                            itemBuilder: (context,index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex:2,
                                      child: Text(
                                        odiBatsmanList[index].position.toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex:4,
                                      child: Text(
                                        odiBatsmanList[index].playerName,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ),
                                    Expanded(flex:1,
                                      child: Text(
                                        odiBatsmanList[index].points.toString(),
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

                ],
              ),
            ]else if(i == 1)...[
              Column(
                children: [
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
                          odiBowlersList = provider.result.odiBowler;
                        }
                        return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: odiBowlersList.length,
                            itemBuilder: (context,index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex:2,
                                      child: Text(
                                        odiBowlersList[index].position.toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex:4,
                                      child: Text(
                                        odiBowlersList[index].playerName,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ),
                                    Expanded(flex:1,
                                      child: Text(
                                        odiBowlersList[index].points.toString(),
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
                  ),
                ],
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
                      odiAllRoundersList = provider.result.odiAllRounder;
                    }
                    return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: odiAllRoundersList.length,
                        itemBuilder: (context,index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex:2,
                                  child: Text(
                                    odiAllRoundersList[index].position.toString(),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex:4,
                                  child: Text(
                                    odiAllRoundersList[index].playerName,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
                                Expanded(flex:1,
                                  child: Text(
                                    odiAllRoundersList[index].points.toString(),
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
                      odiTeamList = provider.result.odiTeams;
                    }
                    return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: odiTeamList.length,
                        itemBuilder: (context,index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex:2,
                                  child: Text(
                                    odiTeamList[index].position.toString(),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex:4,
                                  child: Text(
                                    odiTeamList[index].teamName,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex:2,
                                  child: Text(
                                    odiTeamList[index].rating.toString(),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
                                Expanded(flex:2,
                                  child: Text(
                                    odiTeamList[index].points.toString(),
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
            ],
          ),
        ),
      ),
    );
  }
}
