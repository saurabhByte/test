// import 'dart:convert';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:newtask/model/main_model.dart';
//
//
// class HeadingProvider extends ChangeNotifier{
//
//   final List<String> _headingList = ["Batsmen","Bowler","AllRounder","Team"];
//
//   List<String> get headingList => _headingList;
//   int get count => _headingList.length;
//
//
//   void addItems(String item){
//     _headingList.add(item);
//     notifyListeners();
//   }
//   // getHeadingList(){
//   //   _headingList.add("Batsmen");
//   //   _headingList.add("Bowler");
//   //   _headingList.add("AllRounder");
//   //   _headingList.add("Team");
//   //
//   //   notifyListeners();
//   // }
//
//   bool _error = false;
//   String _errorMsg = '';
//   dynamic _result;
//   int statusCode = 0 ;
//   dynamic responseData;
//   String message = "";
//   List<dynamic> _resultList = [];
//
//   bool get error => _error;
//   String get errorMsg => _errorMsg;
//   dynamic get resultList => _resultList;
//     Result result = Result(odiTeams: [], testTeams: [], t20Teams: [], odiBatsmen: [], odiBowler: [], odiAllRounder: [], testBatsmen: [], testBowler: [], testAllRounder: [], t20Batsmen: [], t20Bowler: [], t20AllRounder: []);
//
//
//
//  Future<void> fetchData() async {
//     // try{
//       //isLoading;
//       //dynamic data = await ApiService.readJson();
//        dynamic  response = await rootBundle.loadString('assets/ranking_response.json');
//        // final data = await json.decode(response);
//      dynamic data = json.decode(response);
//       if(data is Map<String, dynamic>){
//         statusCode = data["statusCode"];
//         responseData = data["responseData"];
//         message = data["responseData"]["message"];
//         // _result = data["responseData"]["result"];
//         // if(_result.toString().isNotEmpty  ){
//         //   for(int i = 0; i < data["responseData"]["result"]["odiTeams"].length;i++ ){
//         //     _result.c
//         //   }
//         // }
//
//         dynamic r = data["responseData"];
//
//         Map<String, dynamic> re = data["responseData"]["result"];
//
//        // Result result = Result.fromJson(re);
//         result = Result.fromJson(re);
//         print(result.odiTeams[0].teamName);
//
//       }
//     // }catch(ex){
//     //   _error = true;
//     //   _errorMsg = ex.toString();
//     //   debugPrint(ex.toString());
//     // }finally{
//     //   //isLoading(false);
//     // }
//
//     notifyListeners();
//   }
//
//
// }

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:newtask/model/main_model.dart';

enum Status { failed, success, loading, none }

class HeadingProvider extends ChangeNotifier{

  final List<String> _headingList = ["Batsmen","Bowler","AllRounder","Team"];

  List<String> get headingList => _headingList;
  int get count => _headingList.length;


  void addItems(String item){
    _headingList.add(item);
    notifyListeners();
  }


  bool _error = false;
  String _errorMsg = '';
  int statusCode = 0 ;
  dynamic responseData;
  String message = "";

  bool get error => _error;
  String get errorMsg => _errorMsg;
  Result _result = Result(odiTeams: [], testTeams: [], t20Teams: [], odiBatsman: [], odiBowler: [], odiAllRounder: [], testBatsman: [], testBowler: [], testAllRounder: [], t20Batsman: [], t20Bowler: [], t20AllRounder: []);

  Result get result => _result;
  Status get status => _status;
  Status _status = Status.none;

  Future<void> fetchData() async {
    // try{
    //isLoading;
    //dynamic data = await ApiService.readJson();
    dynamic  response = await rootBundle.loadString('assets/ranking_response.json');
    // final data = await json.decode(response);
    dynamic data = json.decode(response);
    if(data is Map<String, dynamic>){
      statusCode = data["statusCode"];
      responseData = data["responseData"];
      message = data["responseData"]["message"];
      // _result = data["responseData"]["result"];
      // if(_result.toString().isNotEmpty  ){
      //   for(int i = 0; i < data["responseData"]["result"]["odiTeams"].length;i++ ){
      //     _result.c
      //   }
      // }

      dynamic r = data["responseData"];

      Map<String, dynamic> re = data["responseData"]["result"];

      // Result result = Result.fromJson(re);
      _result = Result.fromJson(re);
      print(_result.t20Teams.length);
      print(_result.t20Teams[0].teamName);
      _status = Status.success;
      notifyListeners();

    }
    else {
      _status = Status.failed;
      notifyListeners();
    }
    // }catch(ex){
    //   _error = true;
    //   _errorMsg = ex.toString();
    //   debugPrint(ex.toString());
    // }finally{
    //   //isLoading(false);
    // }

  }


}