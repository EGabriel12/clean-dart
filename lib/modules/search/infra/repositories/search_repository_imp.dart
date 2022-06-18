import 'package:git_hub_search/modules/search/domain/errors/errors.dart';
import 'package:git_hub_search/modules/search/domain/entities/reasult_search_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:git_hub_search/modules/search/domain/repositories/search_repository.dart';
import 'package:git_hub_search/modules/search/infra/datasources/search_datasource.dart';

class SearchRepositoryImp implements SearchRepository {
  final SearchDatasource datasource;

  SearchRepositoryImp(this.datasource);
  @override
  Future<Either<FailureSearch, List<ResultSearchEntity>>> search(
      String searchText) async {
    try {
      final result = await datasource.getSearch(searchText);
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(DatasourceError(message: e.message));
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
