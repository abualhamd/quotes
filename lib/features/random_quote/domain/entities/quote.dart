import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String content;
  final String id;
  final String author;
  final String permalink;

  const Quote(
      {required this.id,
      required this.content,
      required this.author,
      required this.permalink});

  @override
  List<Object?> get props => [id, content, author, permalink];
}
