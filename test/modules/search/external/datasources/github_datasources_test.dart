import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_hub_search/modules/search/domain/errors/errors.dart';
import 'package:git_hub_search/modules/search/external/datasources/github_datasource.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/github_response.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = GithubDatasource(dio);
  test("it should return a ResultSearchModel list", () async {
    when(
      () => dio.get(any()),
    ).thenAnswer(
      (_) async => Response(
        data: jsonDecode(githubResult),
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final future = datasource.getSearch("elias");
    expect(future, completes);
    expect(1, isNotNull);
  });

  test("It should return an DataSourceError if status code isn't 200", () async {
    when(
      () => dio.get(any()),
    ).thenAnswer(
      (_) async => Response(
        statusCode: 401,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final future = datasource.getSearch("elias");
    expect(future, throwsA(isA<DatasourceError>()));
  });

  test("It should return an Exception if there is a dio problem", () async {
    when(
      () => dio.get(any()),
    ).thenThrow(Exception());

    final future = datasource.getSearch("elias");
    expect(future, throwsA(isA<Exception>()));
  });
}
