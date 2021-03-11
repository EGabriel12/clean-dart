import 'package:cleandart/modules/infra/datasources/search_datasource.dart';
import 'package:cleandart/modules/infra/models/result_search_model.dart';
import 'package:cleandart/modules/infra/repositories/search_repository_impl.dart';
import 'package:cleandart/modules/search/domain/entities/result_search.dart';
import 'package:cleandart/modules/search/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDataSourceMock extends Mock implements SearchDatasource {}

main() {
  final datasource = SearchDataSourceMock();
  final repository = SearchRepositoryImpl(datasource);

  test("deve retornar uma lista de ResultSearch", () async {
    when(datasource.getSearch(any))
        .thenAnswer((_) async => <ResultSearchModel>[]);
    final result = await repository.search("Elias");
    expect(result | null, isA<List<ResultSearch>>());
  });

  test("deve retornar um DatasourceError se o Datasource falhar", () async {
    when(datasource.getSearch(any)).thenThrow(Exception());
    final result = await repository.search("Elias");
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
