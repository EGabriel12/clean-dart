import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_hub_search/modules/search/domain/entities/reasult_search_entity.dart';
import 'package:git_hub_search/modules/search/domain/errors/errors.dart';
import 'package:git_hub_search/modules/search/domain/usecases/search_by_text_usecase.dart';
import 'package:git_hub_search/modules/search/presenter/search/search_bloc.dart';
import 'package:git_hub_search/modules/search/presenter/search/states/state.dart';
import 'package:mocktail/mocktail.dart';

class SearchByTextMock extends Mock implements SearchByTextUseCase {}

void main() {
  final usecase = SearchByTextMock();
  final bloc = SearchBloc(usecase);

  test('It should return states in correct order', () {
    when(
      () => usecase.call(any()),
    ).thenAnswer(
      (_) async => const Right(<ResultSearchEntity>[]),
    );

    expect(bloc.stream,
        emitsInOrder([isA<SearchLoading>(), isA<SearchSuccess>()]));
    bloc.add("elias");
  });
  test('It should return an error', () {
    when(
      () => usecase.call(any()),
    ).thenAnswer(
      (_) async => Left(InvalidTextError()),
    );

    expect(bloc.stream,
        emitsInOrder([isA<SearchLoading>(), isA<SearchError>()]));
    bloc.add("elias");
  });
}
