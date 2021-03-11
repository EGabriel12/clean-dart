import 'package:cleandart/modules/infra/datasources/search_datasource.dart';
import 'package:cleandart/modules/search/domain/errors/errors.dart';
import 'package:cleandart/modules/search/domain/entities/result_search.dart';
import 'package:cleandart/modules/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource datasource;

  SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(
      String searchText) async {
    final result = await datasource.getSearch(searchText);
    return Right(result);
  }
}
