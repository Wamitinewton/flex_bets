class Event {
  String? idEvent;
  String? idSoccerXML;
  String? idAPIfootball;
  String? strEvent;
  String? strEventAlternate;
  String? strFilename;
  String? strSport;
  String? idLeague;
  String? strLeague;
  String? strSeason;
  String? strDescriptionEN;
  String? strHomeTeam;
  String? strAwayTeam;
  String? intHomeScore;
  String? intRound;
  String? intAwayScore;
  String? intSpectators;
  String? strOfficial;
  String? strTimestamp;
  String? dateEvent;
  String? dateEventLocal;
  String? strTime;
  String? strTimeLocal;
  String? strTVStation;
  String? idHomeTeam;
  String? strHomeTeamBadge;
  String? idAwayTeam;
  String? strAwayTeamBadge;
  String? intScore;
  String? intScoreVotes;
  String? strResult;
  String? idVenue;
  String? strVenue;
  String? strCountry;
  String? strCity;
  String? strPoster;
  String? strSquare;
  String? strFanart;
  String? strThumb;
  String? strBanner;
  String? strMap;
  String? strTweet1;
  String? strTweet2;
  String? strTweet3;
  String? strVideo;
  String? strStatus;
  String? strPostponed;
  String? strLocked;

  Event({
    required this.idEvent,
    this.idSoccerXML,
    this.idAPIfootball,
    this.strEvent,
    this.strEventAlternate,
    this.strFilename,
    this.strSport,
    this.strBanner,
    this.idLeague,
    this.strLeague,
    this.strSeason,
    this.strDescriptionEN,
    this.strHomeTeam,
    this.strAwayTeam,
    this.intHomeScore,
    this.intRound,
    this.intAwayScore,
    this.intSpectators,
    this.strOfficial,
    this.strTimestamp,
    this.dateEvent,
    this.dateEventLocal,
    this.strTime,
    this.strTimeLocal,
    this.strTVStation,
    this.idHomeTeam,
    this.strHomeTeamBadge,
    this.idAwayTeam,
    this.strAwayTeamBadge,
    this.intScore,
    this.intScoreVotes,
    this.strResult,
    this.idVenue,
    this.strVenue,
    this.strCountry,
    this.strCity,
    this.strPoster,
    this.strSquare,
    this.strFanart,
    this.strThumb,
    this.strMap,
    this.strTweet1,
    this.strTweet2,
    this.strTweet3,
    this.strVideo,
    this.strStatus,
    this.strPostponed,
    this.strLocked,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      idEvent: json['idEvent'],
      idSoccerXML: json['idSoccerXML'],
      idAPIfootball: json['idAPIfootball'],
      strEvent: json['strEvent'],
      strEventAlternate: json['strEventAlternate'],
      strFilename: json['strFilename'],
      strSport: json['strSport'],
      idLeague: json['idLeague'],
      strLeague: json['strLeague'],
      strSeason: json['strSeason'],
      strDescriptionEN: json['strDescriptionEN'],
      strHomeTeam: json['strHomeTeam'],
      strAwayTeam: json['strAwayTeam'],
      intHomeScore: json['intHomeScore'],
      intRound: json['intRound'],
      intAwayScore: json['intAwayScore'],
      intSpectators: json['intSpectators'],
      strOfficial: json['strOfficial'],
      strTimestamp: json['strTimestamp'],
      dateEvent: json['dateEvent'],
      dateEventLocal: json['dateEventLocal'],
      strTime: json['strTime'],
      strTimeLocal: json['strTimeLocal'],
      strTVStation: json['strTVStation'],
      idHomeTeam: json['idHomeTeam'],
      strHomeTeamBadge: json['strHomeTeamBadge'],
      idAwayTeam: json['idAwayTeam'],
      strAwayTeamBadge: json['strAwayTeamBadge'],
      intScore: json['intScore'],
      intScoreVotes: json['intScoreVotes'],
      strResult: json['strResult'],
      idVenue: json['idVenue'],
      strVenue: json['strVenue'],
      strCountry: json['strCountry'],
      strCity: json['strCity'],
      strPoster: json['strPoster'],
      strSquare: json['strSquare'],
      strFanart: json['strFanart'],
      strThumb: json['strThumb'],
      strBanner: json['strBanner'],
      strMap: json['strMap'],
      strTweet1: json['strTweet1'],
      strTweet2: json['strTweet2'],
      strTweet3: json['strTweet3'],
      strVideo: json['strVideo'],
      strStatus: json['strStatus'],
      strPostponed: json['strPostponed'],
      strLocked: json['strLocked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idEvent': idEvent,
      'idSoccerXML': idSoccerXML,
      'idAPIfootball': idAPIfootball,
      'strEvent': strEvent,
      'strEventAlternate': strEventAlternate,
      'strFilename': strFilename,
      'strSport': strSport,
      'idLeague': idLeague,
      'strLeague': strLeague,
      'strSeason': strSeason,
      'strDescriptionEN': strDescriptionEN,
      'strHomeTeam': strHomeTeam,
      'strAwayTeam': strAwayTeam,
      'intHomeScore': intHomeScore,
      'intRound': intRound,
      'intAwayScore': intAwayScore,
      'intSpectators': intSpectators,
      'strOfficial': strOfficial,
      'strTimestamp': strTimestamp,
      'dateEvent': dateEvent,
      'dateEventLocal': dateEventLocal,
      'strTime': strTime,
      'strTimeLocal': strTimeLocal,
      'strTVStation': strTVStation,
      'idHomeTeam': idHomeTeam,
      'strHomeTeamBadge': strHomeTeamBadge,
      'idAwayTeam': idAwayTeam,
      'strAwayTeamBadge': strAwayTeamBadge,
      'intScore': intScore,
      'intScoreVotes': intScoreVotes,
      'strResult': strResult,
      'idVenue': idVenue,
      'strVenue': strVenue,
      'strCountry': strCountry,
      'strCity': strCity,
      'strPoster': strPoster,
      'strSquare': strSquare,
      'strFanart': strFanart,
      'strThumb': strThumb,
      'strBanner': strBanner,
      'strMap': strMap,
      'strTweet1': strTweet1,
      'strTweet2': strTweet2,
      'strTweet3': strTweet3,
      'strVideo': strVideo,
      'strStatus': strStatus,
      'strPostponed': strPostponed,
      'strLocked': strLocked,
    };
  }
}
