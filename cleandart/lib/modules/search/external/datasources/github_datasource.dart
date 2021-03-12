import 'package:cleandart/modules/search/infra/datasources/search_datasource.dart';
import 'package:cleandart/modules/search/infra/models/result_search_model.dart';

class GithubDatasource implements SearchDatasource {
  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) {
    // TODO: implement getSearch
    throw UnimplementedError();
  }
}
