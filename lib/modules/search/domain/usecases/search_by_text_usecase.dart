// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:git_hub_search/modules/search/domain/entities/reasult_search_entity.dart';
import 'package:git_hub_search/modules/search/domain/errors/errors.dart';
import 'package:git_hub_search/modules/search/domain/repositories/search_repository.dart';

abstract class SearchByTextUseCase {
  Future<Either<FailureSearch, List<ResultSearchEntity>>> call(
      String searchText);
}

class SearchByTextUseCaseImp implements SearchByTextUseCase {
  final SearchRepository repository;
  SearchByTextUseCaseImp({
    required this.repository,
  });

  @override
  Future<Either<FailureSearch, List<ResultSearchEntity>>> call(
      String searchText) async {
    if (searchText.isEmpty) {
      return Left(InvalidTextError());
    }
    return repository.search(searchText);
  }
}
