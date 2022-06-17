import 'package:dartz/dartz.dart';
import 'package:git_hub_search/modules/search/domain/entities/reasult_search_entity.dart';
import 'package:git_hub_search/modules/search/domain/errors/errors.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch, List<ResultSearchEntity>>> search(String searchText);
}