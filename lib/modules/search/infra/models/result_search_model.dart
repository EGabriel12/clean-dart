// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:git_hub_search/modules/search/domain/entities/reasult_search_entity.dart';

class ResultSearchModel extends ResultSearchEntity {
  String titleField;
  String contentField;
  String imageField;
  ResultSearchModel({
    required this.titleField,
    required this.contentField,
    required this.imageField,
  }) : super(title: titleField, content: contentField, image: imageField);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'image': image,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      titleField: map['title'] as String,
      contentField: map['content'] as String,
      imageField: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
