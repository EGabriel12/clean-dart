import 'package:bloc/bloc.dart';
import 'package:git_hub_search/modules/search/domain/usecases/search_by_text_usecase.dart';
import 'package:git_hub_search/modules/search/presenter/search/states/state.dart';
import 'package:rxdart/transformers.dart';

class SearchBloc extends Bloc<String, SearchState> {
  final SearchByTextUseCase usecase;
  SearchBloc(this.usecase) : super(SearchStart()) {
    on<String>((event, emit) async {
      emit(SearchLoading());
      final result = await usecase(event);
      emit(result.fold((l) => SearchError(l), (r) => SearchSuccess(r)));
    }, transformer: (events, mapper) {
      return events
          .debounceTime(const Duration(milliseconds: 800))
          .asyncExpand(mapper);
    });
  }
}
