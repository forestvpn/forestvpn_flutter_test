// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Article extends Equatable {
  const Article({
    required this.id,
    required this.title,
    required this.publicationDate,
    required this.imageUrl,
    this.readed = false,
    this.description,
  });

  final String id;
  final String title;
  final DateTime publicationDate;
  final String imageUrl;
  final bool readed;
  final String? description;

  @override
  List<Object> get props {
    return [
      id,
      title,
      publicationDate,
      imageUrl,
      readed,
    ];
  }
}
