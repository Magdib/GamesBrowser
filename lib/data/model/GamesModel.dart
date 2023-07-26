import 'package:hive_flutter/hive_flutter.dart';

part 'GamesModel.g.dart';

@HiveType(typeId: 2)
class GamesModel {
  @HiveField(0)
  String? gameId;
  @HiveField(1)
  String? gameCategorieid;
  @HiveField(2)
  String? gameName;
  @HiveField(3)
  String? gameDate;
  @HiveField(4)
  String? gameSize;
  @HiveField(5)
  String? gamePrice;
  @HiveField(6)
  String? gamePeriod;
  @HiveField(7)
  String? gameInternetstate;
  @HiveField(8)
  String? gameGraphics;
  @HiveField(9)
  String? gameImage1;
  @HiveField(10)
  String? gameImage2;
  @HiveField(11)
  String? gameGameplay;
  @HiveField(12)
  String? gameTrailer;
  @HiveField(13)
  String? gameDownloadlink;
  @HiveField(14)
  String? gameRate;
  @HiveField(15)
  String? categoriesId;
  @HiveField(16)
  String? categoriesName;

  GamesModel(
      {this.gameId,
      this.gameCategorieid,
      this.gameName,
      this.gameDate,
      this.gameSize,
      this.gamePrice,
      this.gamePeriod,
      this.gameInternetstate,
      this.gameGraphics,
      this.gameImage1,
      this.gameImage2,
      this.gameGameplay,
      this.gameTrailer,
      this.gameDownloadlink,
      this.gameRate,
      this.categoriesId,
      this.categoriesName});

  GamesModel.fromJson(Map<String, dynamic> json) {
    gameId = json['game_id'];
    gameCategorieid = json['game_categorieid'];
    gameName = json['game_name'];
    gameDate = json['game_date'];
    gameSize = json['game_size'];
    gamePrice = json['game_price'];
    gamePeriod = json['game_period'];
    gameInternetstate = json['game_internetstate'];
    gameGraphics = json['game_graphics'];
    gameImage1 = json['game_image1'];
    gameImage2 = json['game_image2'];
    gameGameplay = json['game_gameplay'];
    gameTrailer = json['game_trailer'];
    gameDownloadlink = json['game_downloadlink'];
    gameRate = json['game_rate'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['game_id'] = this.gameId;
    data['game_categorieid'] = this.gameCategorieid;
    data['game_name'] = this.gameName;
    data['game_date'] = this.gameDate;
    data['game_size'] = this.gameSize;
    data['game_price'] = this.gamePrice;
    data['game_period'] = this.gamePeriod;
    data['game_internetstate'] = this.gameInternetstate;
    data['game_graphics'] = this.gameGraphics;
    data['game_image1'] = this.gameImage1;
    data['game_image2'] = this.gameImage2;
    data['game_gameplay'] = this.gameGameplay;
    data['game_trailer'] = this.gameTrailer;
    data['game_downloadlink'] = this.gameDownloadlink;
    data['game_rate'] = this.gameRate;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    return data;
  }
}
