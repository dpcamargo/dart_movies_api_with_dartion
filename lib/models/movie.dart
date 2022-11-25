// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Movie {
  String id;
  String title;
  int year;
  String rated;
  double imdbRating;
  bool response;
  List<String> images;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.rated,
    required this.imdbRating,
    required this.response,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Title': title,
      'Year': year,
      'Rated': rated,
      'imdbRating': imdbRating,
      'Response': response,
      'Images': images,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] ?? '',
      title: map['Title'] ?? '',
      year: map['Year'] ?? 0,
      rated: map['Rated'] ?? '',
      imdbRating: map['imdbRating'] ?? 0.0,
      response: map['Response'] ?? false,
      images: List<String>.from(map['Images']),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Movie.fromJson(String json) => Movie.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, year: $year, rated: $rated, imdbRating: $imdbRating, response: $response, images: $images)';
  }
}
