import 'package:cleandart/modules/search/domain/entities/result_search.dart';
import 'package:cleandart/modules/search/domain/errors/errors.dart';
import 'package:cleandart/modules/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SearchByText {
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText);
}

class SearchByImpl implements SearchByText {
  final SearchRepository repository;

  SearchByImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(
      String searchText) async {
    if (searchText == null || searchText.isEmpty) {
      return Left(InvalidTextError());
    }
    return repository.search(searchText);
  }
}
