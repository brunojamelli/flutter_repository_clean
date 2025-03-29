import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_repository_clean/data/database/dao/floor_movie_dao.dart';
import 'package:flutter_repository_clean/data/database/entity/floor_movie_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'floor_app_database.g.dart'; // Arquivo gerado

@Database(version: 1, entities: [FloorMovieEntity])
abstract class FloorAppDatabase extends FloorDatabase {
  FloorMovieDao get floorMovieDao;
}