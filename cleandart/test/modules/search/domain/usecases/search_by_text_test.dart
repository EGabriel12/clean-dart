import 'package:cleandart/modules/search/domain/entities/result_search.dart';
import 'package:cleandart/modules/search/domain/repositories/search_repository.dart';
import 'package:cleandart/modules/search/domain/usecases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByImpl(repository);

  test('Deve retornar uma lista de ResultSearch', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    final result = await usecase('Elias');
    expect(result | null, isA<List<ResultSearch>>());
  });
}
