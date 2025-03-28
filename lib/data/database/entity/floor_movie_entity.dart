import 'package:floor/floor.dart';

@Entity(tableName: 'movies')
class FloorMovieEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  
  final String title;
  final int year;
  final String? extract;
  @ColumnInfo(name: 'img_url')
  final String? imageUrl;

  FloorMovieEntity({
    this.id,
    required this.title,
    required this.year,
    this.extract,
    this.imageUrl,
  });
}