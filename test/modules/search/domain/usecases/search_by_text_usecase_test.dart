import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_hub_search/modules/search/domain/entities/reasult_search_entity.dart';
import 'package:git_hub_search/modules/search/domain/errors/errors.dart';
import 'package:git_hub_search/modules/search/domain/repositories/search_repository.dart';
import 'package:git_hub_search/modules/search/domain/usecases/search_by_text_usecase.dart';
import 'package:mocktail/mocktail.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByTextUseCaseImp(repository: repository);
  test(
    'It should return a ResultSearch list',
    () async {
      when(
        () => repository.search("elias"),
      ).thenAnswer(
        (_) async => const Right(<ResultSearchEntity>[]),
      );
      final result = await usecase("elias");
      expect(result, isA<Right>());
    },
  );

    test(
    'It should return a exception if the search text is invalid',
    () async {
      final result = await usecase("");
      expect(result.fold(id, id), isA<InvalidTextError>());
    },
  );
}
