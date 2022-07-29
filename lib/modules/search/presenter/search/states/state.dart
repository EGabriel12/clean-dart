import 'package:git_hub_search/modules/search/domain/entities/reasult_search_entity.dart';
import 'package:git_hub_search/modules/search/domain/errors/errors.dart';

abstract class SearchState {}

class SearchSuccess implements SearchState {
  final List<ResultSearchEntity> list;

  SearchSuccess(this.list);
}

class SearchStart implements SearchState {
  
}

class SearchLoading implements SearchState {
  
}

class SearchError implements SearchState {
  final FailureSearch error;

  SearchError(this.error);
}