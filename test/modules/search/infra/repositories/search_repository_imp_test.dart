import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_hub_search/modules/search/domain/errors/errors.dart';
import 'package:git_hub_search/modules/search/infra/datasources/search_datasource.dart';
import 'package:git_hub_search/modules/search/infra/models/result_search_model.dart';
import 'package:git_hub_search/modules/search/infra/repositories/search_repository_imp.dart';
import 'package:mocktail/mocktail.dart';

class SearchDatasourceMock extends Mock implements SearchDatasource {}

void main() {
  final datasource = SearchDatasourceMock();
  final repository = SearchRepositoryImp(datasource);

  test('It should return a ResultSearch list', () async {
    when(
      () => datasource.getSearch("elias"),
    ).thenAnswer((_) async => <ResultSearchModel>[]);
    final result = await repository.search("elias");
    expect(result, isA<Right>());
  });

  test('It should return a DatasourceError if data source fail', () async {
    when(
      () => datasource.getSearch("elias"),
    ).thenThrow(Exception());
    final result = await repository.search("elias");
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
