// To parse this JSON data, do
//
//     final main = mainFromJson(jsonString);

import 'dart:convert';

Main mainFromJson(String str) => Main.fromJson(json.decode(str));

String mainToJson(Main data) => json.encode(data.toJson());

class Main {
  Main({
    required this.status,
    required this.responseData,
  });

  int status;
  ResponseData responseData;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    status: json["status"],
    responseData: ResponseData.fromJson(json["responseData"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "responseData": responseData.toJson(),
  };
}

class ResponseData {
  ResponseData({
    required this.message,
    required this.result,
  });

  String message;
  Result result;

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
    message: json["message"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "result": result.toJson(),
  };
}

class Result {
  Result({
    required this.odiTeams,
    required this.testTeams,
    required this.t20Teams,
    required this.odiBatsman,
    required this.odiBowler,
    required this.odiAllRounder,
    required this.testBatsman,
    required this.testBowler,
    required this.testAllRounder,
    required this.t20Batsman,
    required this.t20Bowler,
    required this.t20AllRounder,
  });

  List<Team> odiTeams;
  List<Team> testTeams;
  List<Team> t20Teams;
  List<OdiAllRounder> odiBatsman;
  List<OdiAllRounder> odiBowler;
  List<OdiAllRounder> odiAllRounder;
  List<OdiAllRounder> testBatsman;
  List<OdiAllRounder> testBowler;
  List<OdiAllRounder> testAllRounder;
  List<OdiAllRounder> t20Batsman;
  List<OdiAllRounder> t20Bowler;
  List<OdiAllRounder> t20AllRounder;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    odiTeams: List<Team>.from(json["odiTeams"].map((x) => Team.fromJson(x))),
    testTeams: List<Team>.from(json["testTeams"].map((x) => Team.fromJson(x))),
    t20Teams: List<Team>.from(json["t20Teams"].map((x) => Team.fromJson(x))),
    odiBatsman: json["odiBatsman"]!=null?List<OdiAllRounder>.from(json["odiBatsman"].map((x) => OdiAllRounder.fromJson(x))) : [],
    odiBowler: json["odiBowler"]!=null?List<OdiAllRounder>.from(json["odiBowler"].map((x) => OdiAllRounder.fromJson(x))) : [],
    odiAllRounder: json["odiAllRounder"]!=null?List<OdiAllRounder>.from(json["odiAllRounder"].map((x) => OdiAllRounder.fromJson(x))):[],
    testBatsman: json["testBatsman"]!=null?List<OdiAllRounder>.from(json["testBatsman"].map((x) => OdiAllRounder.fromJson(x))):[],
    testBowler: json["testBowler"]!=null?List<OdiAllRounder>.from(json["testBowler"].map((x) => OdiAllRounder.fromJson(x))):[],
    testAllRounder: json["testAllRounder"]!=null?List<OdiAllRounder>.from(json["testAllRounder"].map((x) => OdiAllRounder.fromJson(x))):[],
    t20Batsman: json["t20Batsman"]!=null?List<OdiAllRounder>.from(json["t20Batsman"].map((x) => OdiAllRounder.fromJson(x))):[],
    t20Bowler: json["t20Bowler"]!=null?List<OdiAllRounder>.from(json["t20Bowler"].map((x) => OdiAllRounder.fromJson(x))):[],
    t20AllRounder: json["t20AllRounder"]!=null?List<OdiAllRounder>.from(json["t20AllRounder"].map((x) => OdiAllRounder.fromJson(x))):[],
  );

  Map<String, dynamic> toJson() => {
    "odiTeams": List<dynamic>.from(odiTeams.map((x) => x.toJson())),
    "testTeams": List<dynamic>.from(testTeams.map((x) => x.toJson())),
    "t20Teams": List<dynamic>.from(t20Teams.map((x) => x.toJson())),
    "odiBatsman": List<dynamic>.from(odiBatsman.map((x) => x.toJson())),
    "odiBowler": List<dynamic>.from(odiBowler.map((x) => x.toJson())),
    "odiAllRounder": List<dynamic>.from(odiAllRounder.map((x) => x.toJson())),
    "testBatsman": List<dynamic>.from(testBatsman.map((x) => x.toJson())),
    "testBowler": List<dynamic>.from(testBowler.map((x) => x.toJson())),
    "testAllRounder": List<dynamic>.from(testAllRounder.map((x) => x.toJson())),
    "t20Batsman": List<dynamic>.from(t20Batsman.map((x) => x.toJson())),
    "t20Bowler": List<dynamic>.from(t20Bowler.map((x) => x.toJson())),
    "t20AllRounder": List<dynamic>.from(t20AllRounder.map((x) => x.toJson())),
  };
}

class OdiAllRounder {
  OdiAllRounder({
    required this.playerName,
    required this.position,
    required this.points,
    required this.team,
    required this.matchType,
    required this.playerType,
    required this.status,
  });

  String playerName;
  int position;
  int points;
  String team;
  int matchType;
  int playerType;
  int status;

  factory OdiAllRounder.fromJson(Map<String, dynamic> json) => OdiAllRounder(
    playerName: json["player_name"],
    position: json["position"],
    points: json["points"],
    team: json["team"],
    matchType: json["match_type"],
    playerType: json["player_type"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "player_name": playerName,
    "position": position,
    "points": points,
    "team": team,
    "match_type": matchType,
    "player_type": playerType,
    "status": status,
  };
}

class Team {
  Team({
    required this.teamName,
    required this.position,
    required this.points,
    required this.rating,
    required this.matches,
    required this.matchType,
    required this.status,
  });

  String teamName;
  int position;
  int points;
  int rating;
  int matches;
  int matchType;
  int status;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    teamName: json["team_name"],
    position: json["position"],
    points: json["points"],
    rating: json["rating"],
    matches: json["matches"],
    matchType: json["match_type"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "team_name": teamName,
    "position": position,
    "points": points,
    "rating": rating,
    "matches": matches,
    "match_type": matchType,
    "status": status,
  };
}
