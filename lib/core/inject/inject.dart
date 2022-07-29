import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:git_hub_search/modules/search/domain/repositories/search_repository.dart';
import 'package:git_hub_search/modules/search/domain/usecases/search_by_text_usecase.dart';
import 'package:git_hub_search/modules/search/external/datasources/github_datasource.dart';
import 'package:git_hub_search/modules/search/infra/datasources/search_datasource.dart';
import 'package:git_hub_search/modules/search/infra/repositories/search_repository_imp.dart';
import 'package:git_hub_search/modules/search/presenter/search/search_bloc.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    // datasources
    getIt.registerLazySingleton<Dio>(() => Dio());
    getIt.registerLazySingleton<SearchDatasource>(
        () => GithubDatasource(getIt()));

    // repositories
    getIt.registerLazySingleton<SearchRepository>(
        () => SearchRepositoryImp(getIt()));

    // usecases
    getIt.registerLazySingleton<SearchByTextUseCase>(
        () => SearchByTextUseCaseImp(repository: getIt()));

    // controllers
    getIt.registerFactory<SearchBloc>(() => SearchBloc(getIt()));
  }
}
