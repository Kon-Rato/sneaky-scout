import 'package:flutter/foundation.dart';

enum Status {
  Synced,
  Unsynced,
}

enum Match {
  Practice,
  Qual,
  Playoff,
}

enum PowerCellLocation {
  Inner,
  Lower,
  Outer,
}

enum AutonomousStartingPoint {
  Right,
  Middle,
  Left,
}

class MatchScoutingTeam {
  final Status status;
  final String scoutName;
  final String teamName;
  final int teamNo;
  final Match matchType;
  final dynamic matchNo;
  final String color;
  final int powerCellCount;
  final PowerCellLocation powerCellLocation;
  final bool autonomous;
  final AutonomousStartingPoint autonomousStartingPoint;
  final String comment;
  final bool defense;
  final String defenseComment;
  final int foul;
  final int techFoul;
  final bool imageProcessing;
  final int finalScore;

  MatchScoutingTeam({
    this.status = Status.Unsynced,
    @required this.scoutName,
    @required this.teamName,
    @required this.teamNo,
    @required this.matchType,
    @required this.matchNo,
    @required this.color,
    @required this.powerCellCount,
    @required this.powerCellLocation,
    @required this.autonomous,
    this.autonomousStartingPoint,
    this.comment = "",
    @required this.defense,
    this.defenseComment = "",
    @required this.foul,
    @required this.techFoul,
    @required this.imageProcessing,
    @required this.finalScore,
  });

  String get statusString {
    switch (status) {
      case Status.Synced:
        return "synced";
      case Status.Unsynced:
        return "unsynced";
    }
    return null;
  }

  String get matchTypeString {
    switch (matchType) {
      case Match.Qual:
        return "qual";
      case Match.Practice:
        return "practice";
      case Match.Playoff:
        return "playoff";
    }
    return null;
  }

  String get powerCellLocationString {
    switch (powerCellLocation) {
      case PowerCellLocation.Inner:
        return "inner";
      case PowerCellLocation.Lower:
        return "lower";
      case PowerCellLocation.Outer:
        return "outer";
    }
    return null;
  }

  String get autonomousStartingPointString {
    switch (autonomousStartingPoint) {
      case AutonomousStartingPoint.Left:
        return "left";
      case AutonomousStartingPoint.Middle:
        return "middle";
      case AutonomousStartingPoint.Right:
        return "right";
    }
    return null;
  }

  Map<String, dynamic> matchMap() {
    Map<String, dynamic> _map = {
      // Firebase User kullanılmaya başlandığında buraya user id eklenecek.
      "status": status == Status.Synced ? "synced" : "unsynced",
      "scoutName": scoutName,
      "teamName": teamName,
      "teamNo": teamNo,
      "matchType": matchTypeString,
      "matchNo": matchNo,
      "color": color,
      "powerCellCount": powerCellCount,
      "powerCellLocation": powerCellLocationString,
      "autonomous": autonomous,
      "autonomousStartingPoint": autonomousStartingPointString,
      "comment": comment,
      "defense": defense,
      "defenseComment": defenseComment,
      "foul": foul,
      "techFoul": techFoul,
      "imageProcessing": imageProcessing,
      "finalScore": finalScore,
    };

    return _map;
  }
}
